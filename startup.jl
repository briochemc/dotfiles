ENV["GKS_ENCODING"] = "utf-8"

for M in (:OhMyREPL, :Revise, :ClearStacktrace)
    try
        @eval using $M
    catch err
        @warn "$M could not be started" err
    end
end