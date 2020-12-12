using gauss
using Test

@testset "Naive gaussian elimination works" begin
    A = [2.0 1.0 -1.0; -3.0 -1.0 2.0; -2.0 1.0 2.0]
    U = [2.0 1.0 -1.0; 0.0 0.5 0.5; 0.0 0.0 -1.0]

    @test naive_gauss(A) ≈ U
end
