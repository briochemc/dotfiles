ENV["GKS_ENCODING"] = "utf-8"

atreplinit() do repl
    try
        @eval using OhMyREPL
    catch e
        @warn "error while importing OhMyREPL" e
    end
end

try
    using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end

try
    using AbbreviatedStackTraces
catch e
    @warn e.msg
end

