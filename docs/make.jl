using ELM
using Documenter

DocMeta.setdocmeta!(ELM, :DocTestSetup, :(using ELM); recursive=true)

makedocs(;
    modules=[ELM],
    authors="Gabriel Baraldi <baraldi@usp.br> and contributors",
    repo="https://github.com/gbaraldi/ELM.jl/blob/{commit}{path}#{line}",
    sitename="ELM.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gbaraldi.github.io/ELM.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gbaraldi/ELM.jl",
)

