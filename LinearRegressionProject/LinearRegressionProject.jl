module LinearRegressionProject

using CSV
using DataFrames
using Plots
using StatsBase
using LinearAlgebra

# Define the LinearRegression struct
struct LinearRegression
    weights::Vector{Float64}
end

# Function to fit the linear regression model
function fit!(X::Matrix{Float64}, y::Vector{Float64})
    X = hcat(ones(size(X, 1)), X)  # Add intercept term
    weights = X \ y  # Calculate weights using the normal equation
    return LinearRegression(weights)
end

# Function to make predictions
function predict(model::LinearRegression, X::Matrix{Float64})
    X = hcat(ones(size(X, 1)), X)  # Add intercept term
    return X * model.weights
end

end # module
