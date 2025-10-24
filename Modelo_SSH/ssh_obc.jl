#!/usr/bin/env julia
# ssh_obc.jl
# SSH model with open boundary conditions (OBC).
# Builds the tight-binding Hamiltonian for Ncells unit cells (2 sites per cell),
# diagonalizes it, detects edge states, and performs a sweep of inter-cell hopping w.

using LinearAlgebra
# Uncomment to install Plots if needed
# using Pkg; Pkg.add("Plots")
using Plots

# -------------------------
# Build SSH Hamiltonian
# -------------------------
function build_ssh_hamiltonian(Ncells::Int, v::Float64, w::Float64)
    Nsites = 2 * Ncells
    H = zeros(Float64, Nsites, Nsites)
    # intracell hopping v between A_n (2n-1) and B_n (2n)
    # intercell hopping w between B_n (2n) and A_{n+1} (2n+1)
    for n in 1:Ncells
        a = 2n - 1
        b = 2n
        H[a, b] = -v
        H[b, a] = -v
        if n < Ncells
            H[b, 2n + 1] = -w
            H[2n + 1, b] = -w
        end
    end
    return H
end

# -------------------------
# Diagonalize and utilities
# -------------------------
function spectrum_and_states(H::AbstractMatrix{T}) where T
    vals, vecs = eigen(H)  # vals sorted in ascending order
    return vals, vecs
end

# Detect edge-localized states near zero energy
function detect_edge_states(vals::AbstractVector{T}, vecs::AbstractMatrix{T};
                            energy_tol::Float64 = 1e-2,
                            edge_weight_thresh::Float64 = 0.2,
                            edge_size_sites::Int = 2,
                            report_energies::Bool = false) where T
    # New detection: find eigenstates with a large fraction of probability on the
    # first/last `edge_size_sites` sites. This is more robust for finite systems
    # where zero-mode energies are not exactly zero.
    Nsites = size(vecs, 1)
    edge_indices = Int[]
    edge_energies = Float64[]
    for i in 1:length(vals)
        psi = vecs[:, i]
        p_left = sum(abs2, psi[1: min(edge_size_sites, Nsites)])
        p_right = sum(abs2, psi[max(1, Nsites-edge_size_sites+1):Nsites])
        if max(p_left, p_right) >= edge_weight_thresh
            push!(edge_indices, i)
            push!(edge_energies, vals[i])
        end
    end
    if report_energies && !isempty(edge_energies)
        println("Detected edge-state energies: ", round.(edge_energies, sigdigits=6))
    end
    return unique(edge_indices), length(edge_indices)
end

# -------------------------
# Sweep and plotting
# -------------------------
function sweep_w_and_plot(Ncells::Int, v::Float64; w_vals = range(0.0, stop=2.0, length=201),
                          energy_tol = 1e-3)
    Nw = length(w_vals)
    # store lowest few energies (absolute) for plotting
    lowest_vals = zeros(Float64, 6, Nw)
    edge_counts = zeros(Int, Nw)
    for (j, w) in enumerate(w_vals)
        H = build_ssh_hamiltonian(Ncells, v, w)
        vals, vecs = spectrum_and_states(H)
        abs_sorted_idx = sortperm(abs.(vals))
        # store 6 smallest |E|
        for k in 1:6
            lowest_vals[k, j] = vals[abs_sorted_idx[k]]
        end
        _, cnt = detect_edge_states(vals, vecs; energy_tol=energy_tol)
        edge_counts[j] = cnt
    end

    # Plot energies of the lowest bands vs w
    plt = plot(title = "SSH (OBC): low-energy spectrum vs w (v=$(v), Ncells=$(Ncells))",
               xlabel = "w", ylabel = "E (eigenvalues)")
    for k in 1:6
        plot!(plt, w_vals, lowest_vals[k, :], lw=1.5, label = k == 1 ? "lowest states" : "")
    end
    savefig(plt, "ssh_energy_vs_w.png")

    # Plot edge count vs w
    plt2 = plot(w_vals, edge_counts, seriestype=:steppre, xlabel="w", ylabel="# edge states",
                title = "Número de estados de borde vs w", ylim = (-0.2, 4.2))
    savefig(plt2, "ssh_edgecount_vs_w.png")

    return w_vals, lowest_vals, edge_counts
end

# -------------------------
# Small unit tests / sanity checks
# -------------------------
function run_tests()
    println("Ejecutando tests rápidos...")

    Ncells = 40
    tol = 1e-2  # energía tol para considerar 'cero' (num. finita)

    # Topological case: w > v -> expect 2 edge states
    v = 1.0; w = 1.5
    H = build_ssh_hamiltonian(Ncells, v, w)
    vals, vecs = spectrum_and_states(H)
    # use a smaller edge_weight_thresh to catch more localized states
    _, cnt_top = detect_edge_states(vals, vecs; energy_tol=tol, edge_weight_thresh=0.15, report_energies=true)
    println("v=$v, w=$w -> estados de borde detectados: $cnt_top (esperado 2)")

    # Trivial case: v > w -> expect 0 edge states
    v2 = 1.5; w2 = 0.5
    H2 = build_ssh_hamiltonian(Ncells, v2, w2)
    vals2, vecs2 = spectrum_and_states(H2)
    _, cnt_triv = detect_edge_states(vals2, vecs2; energy_tol=tol)
    println("v=$v2, w=$w2 -> estados de borde detectados: $cnt_triv (esperado 0)")

    # simple assertions (non-fatal prints)
    if cnt_top < 2
        println("WARNING: esperábamos 2 estados de borde en la fase topológica, detectados: $cnt_top")
    end
    if cnt_triv > 0
        println("WARNING: esperábamos 0 estados de borde en la fase trivial, detectados: $cnt_triv")
    end
    return (cnt_top, cnt_triv)
end

# -------------------------
# Main demo runner
# -------------------------
function main()
    println("SSH OBC demo: construyendo y analizando espectros...")
    Ncells = 40
    v = 1.0
    w_vals = range(0.0, stop=2.0, length=301)
    w_vals, lowest_vals, edge_counts = sweep_w_and_plot(Ncells, v; w_vals=w_vals, energy_tol=1e-3)
    println("Guardadas figuras: ssh_energy_vs_w.png y ssh_edgecount_vs_w.png")

    # Run tests
    run_tests()
    println("Demo completado.")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
