using CSV
using DataFrames
using MLJ
using Random

# Load historical stock price data
data = CSV.read("stock_data.csv")  # Replace "stock_data.csv" with your dataset file path

# Split data into features and target variable
X = data[:, ["Feature1", "Feature2", ..., "FeatureN"]]  # Replace with your feature columns
y = data[:, "Target"]  # Replace with your target variable column

# Split data into training and testing sets
Random.seed!(123)  # Set random seed for reproducibility
train, test = partition(eachindex(y), 0.7, shuffle=true)  # 70% training, 30% testing

# Define and train the model
model = @load LinearRegressor pkg=MLJ
lr = LinearRegressor()
mach = machine(lr, X[train, :], y[train])
fit!(mach)

# Make predictions on the test set
y_pred = predict(mach, X[test, :])

# Evaluate the model
r2 = evaluate!(mach, resampling=Holdout(fraction_train=0.7), measure=rms)
println("R² score: ", r2)
