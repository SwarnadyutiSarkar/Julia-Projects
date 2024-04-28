using Plots

function simulate_stock_price(S0, r, σ, T, dt, N)
    # Initialize arrays to store stock prices and time steps
    prices = zeros(N)
    times = zeros(N)
    
    # Set initial stock price
    prices[1] = S0
    
    # Simulate stock prices using geometric Brownian motion
    for i in 2:N
        drift = r * prices[i-1] * dt
        diffusion = σ * prices[i-1] * sqrt(dt) * randn()
        prices[i] = prices[i-1] + drift + diffusion
        times[i] = times[i-1] + dt
    end
    
    return times, prices
end

function main()
    # Parameters
    S0 = 100.0  # Initial stock price
    r = 0.05    # Annual risk-free rate
    σ = 0.2     # Annual volatility (standard deviation of returns)
    T = 1.0     # Time horizon (in years)
    dt = 1/252  # Time step (in years)
    N = Int(T / dt) + 1  # Number of time steps
    
    # Simulate stock prices
    times, prices = simulate_stock_price(S0, r, σ, T, dt, N)
    
    # Plot simulated stock prices
    plot(times, prices, xlabel="Time", ylabel="Stock Price", title="Stock Price Simulation", label="Stock Price", legend=:topleft)
end

# Run main function
main()
