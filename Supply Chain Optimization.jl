using JuMP
using GLPK

# Define supply chain optimization model
m = Model(with_optimizer(GLPK.Optimizer))

# Define decision variables
@variable(m, x1 >= 0)  # Quantity of product 1 to produce
@variable(m, x2 >= 0)  # Quantity of product 2 to produce

# Define objective function (e.g., maximize profit)
@objective(m, Max, 5x1 + 3x2)  # Profit function

# Define constraints (e.g., production capacity)
@constraint(m, 2x1 + 3x2 <= 50)  # Machine constraint
@constraint(m, x1 + x2 <= 40)  # Labor constraint

# Solve the optimization problem
optimize!(m)

# Display results
println("Optimal quantity of product 1 to produce: ", value(x1))
println("Optimal quantity of product 2 to produce: ", value(x2))
println("Optimal total profit: ", objective_value(m))
