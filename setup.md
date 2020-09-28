# Setup instructions
## Hardware 
Bring your own laptop to class. Tablets are not sufficient. Make sure you have administrative privileges on the computer, that is, you can install programs. You can use any major operating system (Windows, Mac, Linux).

## Jupyter Lab
We are using Jupyer Lab as our Integrated Development Environment. This tool provides interactive notebooks where we can enter code, explore figures and write text. Please follow along the live coding part of the class by entering code in your Jupyter Lab and executing the code to see what happens. More detailes instructions will be provided in class, and errors will be debugged together -- they are an essential part of the coding experience.

## Miniconda
To install Jupyter Lab, we use the miniconda distribution of (mostly Python) software packages. 

1. [Download the version](https://docs.conda.io/en/latest/miniconda.html) for your OS, use Python 3.8. 
2. After installation, find "Anaconda prompt" in the Windows start menu and launch it. You should see a "shell" where you can interact with your computer by typing text commands.
3. Type `conda install -c conda-forge jupyterlab`.


## Julia

1. [Download and install Julia 1.4](https://julialang.org/downloads/oldreleases/#v142_may_23_2020) relevant for your OS.
2. Launch Julia and make sure the version reads `1.4.2`.
3. Type the following commands at your Julia prompt
```
using Pkg
Pkg.add("IJulia")
```

After completing all of these steps, start Jupyer Lab from the Anaconda Prompt.
```
jupyter lab
```
You should be able to select Julia 1.4 as one of your "kernels."