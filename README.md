# Extra Assignments - Theoretical Condensed Matter Physics

This repository contains numerical implementations and theoretical analyses of several fundamental models in condensed matter physics, developed as part of the Quantum Field Theory and Condensed Matter Physics course (QFT_MatCon).

---

# Tareas Extra - Física Teórica de la Materia Condensada

Este repositorio contiene implementaciones numéricas y análisis teóricos de varios modelos fundamentales en física de la materia condensada, desarrollados como parte del curso de Teoría Cuántica de Campos y Materia Condensada (QFT_MatCon).

## 📁 Repository Structure

### 🌀 Bogoliubov_de_Gennes/
Numerical implementation of Bogoliubov-de Gennes equations for modeling superconductivity.

- **`BdG_simulation.ipynb`**: Complete Julia simulation notebook
- **`Notas_BdG.pdf`**: Theoretical notes on BdG equations

**Features:**
- Self-consistent solution of the superconducting gap
- Finite temperature phase transition analysis
- Corrected self-consistency equation (1-2f factor over all eigenvalues)

### 🔄 Inestabilidad-Cooper/
Analysis of Cooper instability and pair formation in fermionic systems.

- **`Inestabilidad_Cooper.nb`**: Mathematica notebook
- **`Tarea_extra_inestabilidad_Cooper.pdf`**: Theoretical analysis document
- **`Inestabilidad_Cooper.png`**: Illustrative figure
- **`Archivos_Tex/`**: LaTeX source files

### 🌀 Modelo_SSH/
Implementation of the Su-Schrieffer-Heeger model for topological edge states.

- **`Notas_SSH.pdf`**: SSH model theoretical notes
- **`ssh_obc.jl`**: Julia code for SSH model with open boundary conditions
- **`ssh_edgecount_vs_w.png`**: Edge states vs parameter w plot
- **`ssh_energy_vs_w.png`**: Energy spectrum vs parameter w

**Features:**
- Automatic edge state detection
- Topological analysis with mass barrier
- Visualization of topological transition

### 📚 Gell-Mann_Low/
Materials related to quantum field theory.

- **`main.pdf`**: Main document
- **`Notas_QFT_DavidTijerina.pdf`**: QFT notes
- **`Quantum_field_theory_for_the_gifted_amateur_Lancaster_Blundell.pdf`**: Reference book
- **`code/`**: Related code
- **`media/`**: Multimedia resources

---

## 📁 Estructura del Repositorio

### 🌀 Bogoliubov_de_Gennes/
Implementación numérica de las ecuaciones de Bogoliubov-de Gennes para modelar superconductividad.

- **`BdG_simulation.ipynb`**: Notebook de Julia con la simulación completa
- **`Notas_BdG.pdf`**: Notas teóricas sobre las ecuaciones BdG

**Características:**
- Solución auto-consistente del gap superconductor
- Análisis de transición de fase a temperatura finita
- Corrección implementada para la ecuación de auto-consistencia (factor 1-2f sobre todos los eigenvalores)

### 🔄 Inestabilidad-Cooper/
Análisis de la inestabilidad de Cooper y formación de pares en sistemas fermiónicos.

- **`Inestabilidad_Cooper.nb`**: Notebook de Mathematica
- **`Tarea_extra_inestabilidad_Cooper.pdf`**: Documento con el análisis teórico
- **`Inestabilidad_Cooper.png`**: Figura ilustrativa
- **`Archivos_Tex/`**: Archivos fuente LaTeX

### 🌀 Modelo_SSH/
Implementación del modelo de Su-Schrieffer-Heeger para estados de borde topológicos.

- **`Notas_SSH.pdf`**: Notas teóricas del modelo SSH
- **`ssh_obc.jl`**: Código Julia para el modelo con condiciones abiertas a la frontera
- **`ssh_edgecount_vs_w.png`**: Gráfica de estados de borde vs parámetro w
- **`ssh_energy_vs_w.png`**: Espectro de energía vs parámetro w

**Características:**
- Detección automática de estados de borde
- Análisis topológico con barrera de masa
- Visualización de la transición topológica

### 📚 Gell-Mann_Low/
Materiales relacionados con teoría cuántica de campos.

- **`main.pdf`**: Documento principal
- **`Notas_QFT_DavidTijerina.pdf`**: Notas de QFT
- **`Quantum_field_theory_for_the_gifted_amateur_Lancaster_Blundell.pdf`**: Libro de referencia
- **`code/`**: Código relacionado
- **`media/`**: Recursos multimedia

## 🚀 Requirements

### For Julia Notebooks:
- Julia 1.11+
- Packages: LinearAlgebra, SparseArrays, Plots, LaTeXStrings, Statistics
- Jupyter Notebook or VS Code with Julia extension

### For Mathematica Notebooks:
- Mathematica 12+

### For LaTeX Documents:
- LaTeX distribution (TeX Live, MiKTeX, etc.)
- pdflatex compiler

---

## 🚀 Requisitos

### Para Notebooks de Julia:
- Julia 1.11+
- Paquetes: LinearAlgebra, SparseArrays, Plots, LaTeXStrings, Statistics
- Jupyter Notebook o VS Code con extensión Julia

### Para Notebooks de Mathematica:
- Mathematica 12+

### Para documentos LaTeX:
- LaTeX distribution (TeX Live, MiKTeX, etc.)
- Compilador pdflatex

## 📖 Usage

### Run BdG Simulations:
```bash
cd Bogoliubov_de_Gennes
jupyter notebook BdG_simulation.ipynb
# Or in VS Code: open the file and run cells
```

### Run SSH Model:
```bash
cd Modelo_SSH
julia ssh_obc.jl
```

### Compile LaTeX Documents:
```bash
cd Gell-Mann_Low
pdflatex main.tex
```

---

## 📖 Uso

### Ejecutar simulaciones BdG:
```bash
cd Bogoliubov_de_Gennes
jupyter notebook BdG_simulation.ipynb
# O en VS Code: abrir el archivo y ejecutar celdas
```

### Ejecutar modelo SSH:
```bash
cd Modelo_SSH
julia ssh_obc.jl
```

### Compilar documentos LaTeX:
```bash
cd Gell-Mann_Low
pdflatex main.tex
```

## 📊 Main Results

### BdG Equations
- **Superconducting gap**: Physically reasonable values of order 10⁻⁴ - 10⁻³ (corrected)
- **Phase transition**: Gap decreases with temperature
- **Convergence**: Stable with parameters μ=-1.0, g=2.5

### SSH Model
- **Edge states**: Correctly detected in topological phase
- **Topological transition**: Clearly visible in spectrum
- **Open boundaries**: Implemented to observe edge effects

---

## 📊 Resultados Principales

### Ecuaciones BdG
- **Gap superconductor**: Valores físicos del orden 10⁻⁴ - 10⁻³ (corregidos)
- **Transición de fase**: Disminución del gap con temperatura
- **Convergencia**: Estable con parámetros μ=-1.0, g=2.5

### Modelo SSH
- **Estados de borde**: Detectados correctamente en la fase topológica
- **Transición topológica**: Claramente visible en el espectro
- **Condiciones abiertas**: Implementadas para observar efectos de borde

## 📚 References

- QFT_MatCon course notes
- "Quantum Field Theory for the Gifted Amateur" - Lancaster & Blundell
- Original papers on BdG equations and SSH model

## 👤 Author

José Ángel - Master's student in Physics

## 📝 Notes

This repository is part of the extra assignments for the Quantum Field Theory and Condensed Matter Physics course. The codes are optimized for pedagogical clarity and may require adjustments for production applications.

---

## 📚 Referencias

- Notas del curso QFT_MatCon
- "Quantum Field Theory for the Gifted Amateur" - Lancaster & Blundell
- Artículos originales sobre modelos BdG y SSH

## 👤 Autor

José Ángel - Estudiante de Maestría en Física

## 📝 Notas

Este repositorio forma parte de las tareas extra del curso de Teoría Cuántica de Campos y Materia Condensada. Los códigos están optimizados para claridad pedagógica y pueden requerir ajustes para aplicaciones de producción.

---

*Last updated: October 2025*