using ExtremeLearning
using Documenter

DocMeta.setdocmeta!(ExtremeLearning, :DocTestSetup, :(using ExtremeLearning); recursive=true)

makedocs(;
    modules=[ExtremeLearning],
    authors="Gabriel Baraldi",
    repo="https://github.com/gbaraldi/ExtremeLearning.jl/blob/{commit}{path}#{line}",
    sitename="ExtremeLearning.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gbaraldi.github.io/ExtremeLearning.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Examples" => "examples.md",
        "Functions" => "functions.md"
    ],
)

deploydocs(;
    repo="github.com/gbaraldi/ExtremeLearning.jl",
)

