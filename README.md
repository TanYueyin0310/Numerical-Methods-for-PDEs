# Numerical-Methods-for-PDEs

[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- TABLE OF CONTENTS -->
## Table of Contents
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>



<!-- ABOUT THE PROJECT -->
## About The Project

This is a *course project* for Numerical Solution of Partial Differential Equation(NPDE), School of Mathematics and Statistics, Wuhan University. The lecturer is Prof. Duan Huoyuan.

In this project, there are implementations of 6 numerical methods for 2 parabolic partial differential equations:

- For one-dimentional equation
  - Forward Finite Difference Scheme
  - Backward Finite Difference Scheme
  - Crank-Nicolson Scheme
- For two-dimensional equation
  - Alternating-Direction Implicit Scheme(ADI)
  - Predictor-Corrector Scheme
  - Locally One-Dimensional Scheme(LOD)

Note that the codes in this project compute the numerical solutions of these following 2 PDEs.
- One-dimentional equation
$$
\begin{cases}
\frac{\partial u}{\partial t} =  \frac{\partial ^2 f}{\partial ^2 x} + \sin{t}(0<x<1,t>0)\\
u_x(0,t)=u_x(1,t)=0(t>0)\\
u(x,0)=\cos{\pi x}(0<x<1)
\end{cases}
$$
- Two-dimensional equation
$$
\begin{cases}
\frac{\partial u}{\partial t} =  4^{-2}(u_{xx}+u_{yy})((x,y)\in G=(0,1),t>0)\\
u(0,y,t)=u(1,y,t)=0(0<y<1,t>0)\\
u_y(x,o,t)=u_y(x,1,t)=0(0<x<1,t>0)\\
u(x,y,0)=\sin{\pi x}\cos{\pi y}
\end{cases}
$$

<img src="http://latex.codecogs.com/gif.latex?\begin{cases}\frac{\partial u}{\partial t} =  4^{-2}(u_{xx}+u_{yy})((x,y)\in G=(0,1),t>0)\\u(0,y,t)=u(1,y,t)=0(0<y<1,t>0)\\u_y(x,o,t)=u_y(x,1,t)=0(0<x<1,t>0)\\u(x,y,0)=\sin{\pi x}\cos{\pi y}\end{cases}" /> 

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mrow data-mjx-texclass="INNER"><mo data-mjx-texclass="OPEN">{</mo><mtable columnalign="left left" columnspacing="1em" rowspacing=".2em"><mtr><mtd><mfrac><mrow><mi mathvariant="normal">∂</mi><mi>u</mi></mrow><mrow><mi mathvariant="normal">∂</mi><mi>t</mi></mrow></mfrac><mo>=</mo><msup><mn>4</mn><mrow><mo>−</mo><mn>2</mn></mrow></msup><mo stretchy="false">(</mo><msub><mi>u</mi><mrow><mi>x</mi><mi>x</mi></mrow></msub><mo>+</mo><msub><mi>u</mi><mrow><mi>y</mi><mi>y</mi></mrow></msub><mo stretchy="false">)</mo><mo stretchy="false">(</mo><mo stretchy="false">(</mo><mi>x</mi><mo>,</mo><mi>y</mi><mo stretchy="false">)</mo><mo>∈</mo><mi>G</mi><mo>=</mo><mo stretchy="false">(</mo><mn>0</mn><mo>,</mo><mn>1</mn><mo stretchy="false">)</mo><mo>,</mo><mi>t</mi><mo>&gt;</mo><mn>0</mn><mo stretchy="false">)</mo></mtd></mtr><mtr><mtd><mi>u</mi><mo stretchy="false">(</mo><mn>0</mn><mo>,</mo><mi>y</mi><mo>,</mo><mi>t</mi><mo stretchy="false">)</mo><mo>=</mo><mi>u</mi><mo stretchy="false">(</mo><mn>1</mn><mo>,</mo><mi>y</mi><mo>,</mo><mi>t</mi><mo stretchy="false">)</mo><mo>=</mo><mn>0</mn><mo stretchy="false">(</mo><mn>0</mn><mo>&lt;</mo><mi>y</mi><mo>&lt;</mo><mn>1</mn><mo>,</mo><mi>t</mi><mo>&gt;</mo><mn>0</mn><mo stretchy="false">)</mo></mtd></mtr><mtr><mtd><msub><mi>u</mi><mi>y</mi></msub><mo stretchy="false">(</mo><mi>x</mi><mo>,</mo><mi>o</mi><mo>,</mo><mi>t</mi><mo stretchy="false">)</mo><mo>=</mo><msub><mi>u</mi><mi>y</mi></msub><mo stretchy="false">(</mo><mi>x</mi><mo>,</mo><mn>1</mn><mo>,</mo><mi>t</mi><mo stretchy="false">)</mo><mo>=</mo><mn>0</mn><mo stretchy="false">(</mo><mn>0</mn><mo>&lt;</mo><mi>x</mi><mo>&lt;</mo><mn>1</mn><mo>,</mo><mi>t</mi><mo>&gt;</mo><mn>0</mn><mo stretchy="false">)</mo></mtd></mtr><mtr><mtd><mi>u</mi><mo stretchy="false">(</mo><mi>x</mi><mo>,</mo><mi>y</mi><mo>,</mo><mn>0</mn><mo stretchy="false">)</mo><mo>=</mo><mi>sin</mi><mo data-mjx-texclass="NONE">⁡</mo><mrow><mi>π</mi><mi>x</mi></mrow><mi>cos</mi><mo data-mjx-texclass="NONE">⁡</mo><mrow><mi>π</mi><mi>y</mi></mrow></mtd></mtr></mtable><mo data-mjx-texclass="CLOSE" fence="true" stretchy="true" symmetric="true"></mo></mrow></math>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Yueyin Tan - tanyueyin@outlook.com


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[issues-shield]: https://img.shields.io/github/issues/tanyueyin0310/Numerical-Methods-for-PDEs.svg?style=for-the-badge
[issues-url]: https://github.com/tanyueyin0310/Numerical-Methods-for-PDEs/issues
[license-shield]: https://img.shields.io/github/license/tanyueyin0310/Numerical-Methods-for-PDEs.svg?style=for-the-badge
[license-url]: https://github.com/tanyueyin0310/Numerical-Methods-for-PDEs/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/tanyueyin