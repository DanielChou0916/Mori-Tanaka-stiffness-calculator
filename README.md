# Mori-Tanaka Stiffness Calculator

This package provides tools for calculating the **Mori-Tanaka effective stiffness** of a two-phase composite material.  
It is implemented in **MATLAB** and is inspired by the work of **Dr. TingTing Xu** ([Google Scholar](https://scholar.google.com/citations?user=gtsbipkAAAAJ&hl=en)).

## 📌 Overview
In the presented **2D plane strain example**, a **matrix-inclusion composite** is considered, where the inclusion phase is recognized as **cavities (cracks)**, leading to a zero stiffness tensor for inclusion:

<p align="center">
  <img src="https://latex.codecogs.com/png.latex?\mathbb{C}_2%20%3D%20\mathbf{0}" alt="\mathbb{C}_2 = \mathbf{0}" />
</p>

- **Crack 1 orientation** is stationary.  
- **Crack 2 orientation** varies (as shown in the figure below).  
- **Crack spacing** (horizontal & vertical distances) does not influence the Mori-Tanaka scheme, though it is illustrated for reference.

<p align="center">
  <img src="https://github.com/user-attachments/assets/0363116c-7466-4e3a-bbb0-20522297d80d" width="500">
</p>

It is noteworthy that this structure is assumed to be sufficient to represent the microstructure.  
Users should carefully consider the concept of **Representative Elementary Volume (REV)** before using this package.

---

## 🛠 Usage

This package includes both **numerical** and **analytical** approaches for calculating the effective stiffness tensor:

<p align="center">
  <img src="https://latex.codecogs.com/png.latex?\mathbb{C}_{\text{hom}}" alt="\mathbb{C}_{\text{hom}}" />
</p>

### **🔹 Numerical Calculation**
The script **`Numerical_calculation_Chom.m`** demonstrates how to compute **C_hom** using numerical techniques.

### **🔹 Analytical Calculation**
The script **`Analytical_calculation_Chom.m`** provides an analytical solution for Mori-Tanaka stiffness using a **cylindrical-shaped inclusion**, which is equivalent to the 2D plane strain case.

---

## 📄 Citation

These functions are utilized in the following research article:

> **Chou, Daniel** & **Chloe Arson**, 2025. Microstructure features that most influence the Mori-Tanaka scheme break-down in 2D solids with crack-like flat cavities,
> Journal of Engineering Mechanics, DOI: 10.1061/JENMDT/EMENG-8025 (forthcoming)

A more detailed explanation, along with examples and extended documentation, will be provided once the article is formally published.

---

## 📫 Contact

For any questions or discussions, feel free to reach out via [LinkedIn](https://linkedin.com/in/daniel-t-chou-1b51661b2).
