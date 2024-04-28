using Distributed

# Add worker processes
addprocs(4)  # Add 4 worker processes

# Function to calculate the sum of squares
function sum_of_squares(start, stop)
    total = 0
    for i in start:stop
        total += i^2
    end
    return total
end

# Main function to distribute the task
function main()
    println("Parallel and Distributed Computing Framework in Julia")

    # Define range of numbers
    n = 1000
    chunk_size = n ÷ nworkers()  # Divide the work evenly among worker processes
    
    # Distribute the task across worker processes
    futures = Vector{Future}()
    for p in workers()
        start_idx = (p - 1) * chunk_size + 1
        stop_idx = p * chunk_size
        push!(futures, @spawn sum_of_squares(start_idx, stop_idx))
    end

    # Wait for all futures to complete and collect results
    results = fetch.(futures)

    # Combine results from all worker processes
    total_sum = sum(results)
    
    println("Total sum of squares:", total_sum)
end

# Run main function
main()
