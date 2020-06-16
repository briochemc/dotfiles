ENV["GKS_ENCODING"] = "utf-8"

try
    using Revise
catch e
    @warn(e.msg)
end

try
    using OhMyREPL
catch e
    @warn(e.msg)
end

try
    using ClearStacktrace
catch e
    @warn(e.msg)
end
