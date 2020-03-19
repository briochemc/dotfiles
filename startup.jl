# OhMyREPL (from Scott Thomas via slack)
ENV["GKS_ENCODING"] = "utf-8"
try
    @eval using OhMyREPL
catch err
    @warn "OhMyREPL could not be started" err
end

# Revise (from Scott Thomas via slack)
try
    @eval using Revise
    Revise.async_steal_repl_backend()
catch err
    @warn "Revise could not be started" err
end