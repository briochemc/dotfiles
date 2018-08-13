# Add local directory to path
push!(LOAD_PATH, ".")

# Run local _init.jl if present
isfile("_init.jl") && include(joinpath(pwd(), "_init.jl"))

# Revise and run without reloading manually
@schedule begin
    sleep(0.1)
    @eval using Revise
end
