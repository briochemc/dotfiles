ENV["GKS_ENCODING"] = "utf-8"

atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch e
        @warn "Error initializing Revise" exception=(e, catch_backtrace())
    end

    try
        @eval using OhMyREPL
    catch e
        @warn "error while importing OhMyREPL" e
    end

    try
        @eval using ClearStacktrace
    catch e
        @warn e.msg
    end
end


