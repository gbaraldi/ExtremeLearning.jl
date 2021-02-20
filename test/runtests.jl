using Test
using SafeTestsets

@safetestset "bin_adder" begin include("bin_adder.jl") end
@safetestset "constructor" begin include("constructor.jl") end
