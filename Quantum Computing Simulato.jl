using Yao

# Define a quantum circuit
circuit = chain(H(1), H(2), control(1, 2, X), H(1), H(2))

# Define a quantum state
state = zero_state(2)  # 2 qubits

# Apply the circuit to the state
result = circuit * state

# Display the result
println("Final quantum state after applying the circuit:")
println(result)
