using DataFrames
using DecisionTree

# Load historical maintenance data
maintenance_data = DataFrame(
    Equipment = ["Machine1", "Machine2", "Machine3", "Machine4"],
    LastMaintenance = [90, 120, 150, 180],  # Days since last maintenance
    Failures = [0, 1, 0, 1]  # Binary indicator: 0 - No failure, 1 - Failure occurred
)

# Train a predictive maintenance model
X = maintenance_data[[:LastMaintenance]]
y = maintenance_data[:Failures]
model = DecisionTreeClassifier()
fit!(model, X, y)

# Predict failure probability for a new observation
new_observation = DataFrame(LastMaintenance = [100])
predicted_failure_prob = predict_proba(model, new_observation)

# Display predicted failure probability
println("Predicted failure probability: ", predicted_failure_prob[1][2])
