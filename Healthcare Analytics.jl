using CSV
using DataFrames
using Statistics

# Load healthcare data (example: patient blood pressure readings)
data = CSV.read("healthcare_data.csv")  # Replace "healthcare_data.csv" with your dataset file path

# Calculate statistics
mean_bp = mean(data.blood_pressure)
std_bp = std(data.blood_pressure)
min_bp = minimum(data.blood_pressure)
max_bp = maximum(data.blood_pressure)

# Display statistics
println("Mean Blood Pressure: $mean_bp")
println("Standard Deviation of Blood Pressure: $std_bp")
println("Minimum Blood Pressure: $min_bp")
println("Maximum Blood Pressure: $max_bp")
