module gauss

export naive_gauss

function naive_gauss(A)
    n = size(A)[1]
    pivot = A[1, 1]
    U = copy!(similar(A, eltype(pivot)), A)

    for j in 1:n
        for i in j+1:n
            pivot = -U[i, j] / U[j, j]
            U[i, :] = U[i, :] + U[j, :] * pivot
        end
    end

    return U
end

end # module
