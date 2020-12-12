using gauss
using Test

A = [2.0 1.0 -1.0; -3.0 -1.0 2.0; -2.0 1.0 2.0]

@testset "Naive gaussian elimination works" begin
    U = [2.0 1.0 -1.0; 0.0 0.5 0.5; 0.0 0.0 -1.0]
    @test naive_gauss(A) ≈ U
end

@testset "Better gaussian elimination works" begin
    U = [-3.0  -1.0 2.0; 0.0 1.66667 0.666667; 0.0 0.0 0.2]
    @test isapprox(better_gauss(A), U, atol = 1e-5)
end
