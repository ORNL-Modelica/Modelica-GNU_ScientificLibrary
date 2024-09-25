# Modelica-GNU_ScientificLibrary

Free library for accessing the [GNU Scientific Library](https://www.gnu.org/software/gsl/) functions via Modelica.
- Uses GSL v2.7.1

## Tested Environments

- OpenModelica 1.23.1.
- Dymola 2023x Refresh 1

## Overview

More math!

Many physical applications require the solving of PDEs, rendering Differential-Algebraic solvers ill-suited for the general task. However, such problems sometimes exhibit symmetries, leading a way to change the PDEs to a system of coupled ODEs via canonical transformations and separability (see, e.g., §5.1 of Morse and Feshbach, Methods of Theoretical Physics, 1953). This transformation of the problem usually involves a choice of specific coordinates, and along these new dimensions, Special Functions. Sometimes symmetries involve degrees of freedom in an "internal" space, as in some forms of media (e.g., degenerate matter). Access to a larger mathematical library could also improve simulation preconditioning, as well as intermediate- and post-simulation analysis. An extension of Modelica's mathematical functions (here with the GNU Scientific Library) is therefore thought to be potentially useful.

The primary tools of this library are contained in the Functions Package. The file structure of the packages mirrors the GNU GSL file structure to assist in locating files between Modelica and GSL source code.

Thus far, emphasis has been placed upon the use of GSL's special functions (further GSL capabilities are possible and are forthcoming). Wherever possible, the functions have been packaged into Blocks for direct use in Modelica Connection Tools, like OMEdit and Dymola. Some examples are also provided to show usage of the function blocks. In some cases, additional, related blocks (associated DEs, asymptotic forms, numerical inverters) have been created for further support.

## Interface

For some GSL capabilities, an interface is provided to handle communication between Modelica and the GSL Library. 
Depending on the routines involved, alteration and compilation of the interface may be necessary before a particular Modelica model can be run. 
Wherever possible, it is the goal here that the user need not be forced to leave the Connection Editor environment to handle this.

For example, an integrand-setup model (e.g., 'ExampleIntegral.CreateIntegrand') must be run before using GSL integration routines within a larger Modelica model. To create another integrand, simply duplicate one of the example models and change the String 'C_integrand' for the desired mathematical function in standard C-syntax. This setup model then needs to be "simulated" (it actually only copies/creates files, compiles and archives them) before the simulation of a larger model. The larger model may then include multiple uses of the relevant 'integrand' (e.g., in qag or other GSL integration routines). (Alternatively, one could edit integrand.c directly and then compile "by hand" in a command window:
	gcc -fPIC -c integrand.c integration_mi.c
	gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so  [.dll for windows]) 

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [The GNU General Public License (GPL)](https://www.gnu.org/copyleft/gpl.html).
