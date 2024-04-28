module ScientificComputing

export fibonacci, factorial, linear_regression

# Function to calculate the nth Fibonacci number
function fibonacci(n::Int)
    if n < 0
        throw(ArgumentError("n must be a non-negative integer"))
    elseif n == 0
        return 0
    elseif n == 1
        return 1
    else
        a, b = 0, 1
        for _ in 2:n
            a, b = b, a + b
        end
        return b
    end
end

# Function to calculate the factorial of an integer
function factorial(n::Int)
    if n < 0
        throw(ArgumentError("n must be a non-negative integer"))
    elseif n == 0
        return 1
    else
        return prod(1:n)
    end
end

# Function to perform linear regression
function linear_regression(x::Vector{T}, y::Vector{T}) where T
    if length(x) != length(y)
        throw(ArgumentError("Input vectors must have the same length"))
    end
    
    n = length(x)
    x̄ = mean(x)
    ȳ = mean(y)
    Sxx = sum((xi - x̄)^2 for xi in x)
    Sxy = sum((xi - x̄) * (yi - ȳ) for (xi, yi) in zip(x, y))
    
    slope = Sxy / Sxx
    intercept = ȳ - slope * x̄
    
    return slope, intercept
end

end # module
