# Add local directory to path
push!(LOAD_PATH, ".")

# Run local _init.jl if present
isfile("_init.jl") && include(joinpath(pwd(), "_init.jl"))