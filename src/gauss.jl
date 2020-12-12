module gauss

export naive_gauss, better_gauss

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

function better_gauss(A::AbstractMatrix)
    n = size(A, 1)
    pivot = A[1, 1]
    U = copy!(similar(A, eltype(pivot)), A)

    r = 1
    for j in 1:n
        mi = argmax(abs.(U[r:end, j])) + r - 1
        swap_rows!(U, mi, r)

        for i in r+1:n
            pivot = -U[i, j] / U[j, j]
            U[i, :] = U[i, :] + U[j, :] * pivot
        end
        r += 1
    end

    return U
end

function swap_rows!(A::AbstractMatrix, i::Integer, j::Integer)
    for k in axes(A, 2)
        t = A[i, k]
        A[i, k] = A[j, k]
        A[j, k] = t
    end
end

end # module
