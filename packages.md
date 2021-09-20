# Installing Julia packages
## Modules
Functions and variables are organized into separate *modules*. Before accessing a module, you need to load it to memory. This modular approach is helpful because you don't load code you will not use. In addition, the organization helps you write more legible and easier to maintain code.

You load a module with the `using` statement. This makes all (exported) functions and variables of the module accessible to you.
```
julia> mean(1:20)
ERROR: UndefVarError: mean not defined
Stacktrace:
 [1] top-level scope at REPL[1]:1

julia> using Statistics

julia> mean(1:20)
10.5
```

Note that different modules can use the same function and variable name. For example, `mean` may mean something else entirely in another module. To be more specific about which `mean` function you want to use, write the fully qualified name of the function:
```
julia> Statistics.mean(1:20)
10.5
```
Every time you run a new Julia session (launch a new kernel in Jupyter), you need to import your modules with `using`. Intuitively, `using` loads the modules from disk to memory. (In Python, the same process is done by `import <module>`, in R it is `library(<module>)`.)

## Packages
As with all open-source software, the real value of the language is in the community created and curated content. Julia provides a long list of optional and user-defined packages. It also has the best package manager among similar tools that solves the following problems:
1. Where to get a new package from?
2. Which versions of which packages were used for this project?
3. How can I share this information with collaborators?

Julia's package manager is called Pkg. There are two ways to invoke it. One is loading the Pkg module and using the functions defined in this module, like
```
using Pkg
Pkg.add("Distributions")
```
The other is a separate REPL for Pkg. In the Julia REPL, press the key `]`. You see the prompt change to `(@v1.6) pkg>` and you can issue Pkg commands, like `add Distributions`. To exit the Pkg REPL, press that Backspace key.

We will follow the first approach as it is also available in Jupyer Lab. The most used Pkg command is `add`:
```
using Pkg
Pkg.add("Distributions")
using Distributions
```
This downloads the Distributions package and makes it available for you to load it to memory. You only have to `add` a package once before using it. Intuitively, `Pkg.add` fetches the package from the internet and saves it to your disk.

## Environments
In a typical project, you will be using many packages. You don't want to download them again if they are already on your computer. But in other projects you may be using a different version of the same package, so you *do* want to download a new version. This kind of conflict among packages are common for software developers and users. They even have a name for it: "dependency hell." 

Julia environments solve the dependency hell by fixing the exact list and exact version of packages you are using in a project. You can then load them again when you come back to the project. If you don't have the exact version, it will be downloaded. 

This information is stored in two text files, `Project.toml` and `Manifest.toml`. You never need to edit these files directly (although you can), Pkg does this for you. It is, however, helpful to know the information is there. If you want to share you Julia environment with a collaborator, these are the two short text files to send over.

In Julia, environments are associated with folders. (It is good practice to keep all your project files in a separate folder.)

Create a new environment by navigating to your project folder and typing `Pkg.activate`:
```
cd("Documents/work/macro")
Pkg.activate(".")
```
Here the string `"."` refers to the current directory.
```
julia> Pkg.status()
Status `~/Documents/work/macro/Project.toml`
  (empty environment)
```
If you now add packages *during this session*, their metadata will be saved to Project.toml and Manifest.toml.
```
julia> Pkg.add("Distributions")
...
julia> Pkg.status()
Status `~/Project.toml`
  [31c24e10] Distributions v0.25.16
```
Jupyter Lab automatically activates the project in the folder from which you are starting it.

To install the packages in someone else's Project.toml, you use the `instantiate` command. For example, download `Project.toml` from the course website, move it to you folder (from which you have launched Jupyter Lab) and write `Pkg.instantiate()`.