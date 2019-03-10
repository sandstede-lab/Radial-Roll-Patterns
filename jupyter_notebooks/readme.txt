
This directory contains the auto07p files and two Jupyter notebooks to reproduce the data and the plots presented in figures 6 and 7 of [Bramburger et al.].

#############################################################

Preview:

Instead of running the two notebooks, their output can be viewed in a web browser using the html files
     radial_snaking_plot.html
     radial_snaking_auto.html

#############################################################

Notebook: radial_snaking_plot.py

This notebook plots the data files contained in the folder/directory "data". The notebook  requires a python installation (python 2.7 and 3.7 will both work) with matplotlib, jupyter, numpy, and pandas. The plots render best with a matplotlib version above 2.0. Anaconda (see below) can be used to install the latest python environment. The terminal command
     jupyter notebook
then runs Jupyter. Select the notebook "radial_snaking_plot" in the web browser that will open following the "jupyter notebook" command and runs the cells to reproduce the figures from the precomputed data.

#############################################################

Notebook: radial_snaking_auto.py

This notebook recreates the data files contained in the folder/directory "data". The notebook requires (i) an auto07p installation and (ii) a python 2.7 installation with matplotlib=1.5.3, jupyter, numpy, and pandas. If anaconda is installed, the terminal command
     conda create -n python_for_auto python=2.7 matplotlib=1.5.3 numpy pandas jupyter
creates a python 2.7 environment that can be activated with
     conda activate python_for_auto
The terminal command
     jupyter notebook
then runs Jupyter. Select the notebook "radial_snaking_auto" in the web browser that will open following the "jupyter notebook" command and runs the cells.

#############################################################

Installing auto07p: Auto07p can be downloaded from https://sourceforge.net/projects/auto-07p/

Installing python: Anaconda (https://www.anaconda.com) is a free package manager that allows to install and switch between different python installations on Linux, Mac, and Windows.

Caveats: Unfortunately, auto97p cannot be run with a matplotlib version higher than 1.5.3 due to several incompatibilities.

#############################################################
