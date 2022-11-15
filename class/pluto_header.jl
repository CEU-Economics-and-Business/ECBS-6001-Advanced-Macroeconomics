begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(".")
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()
end
