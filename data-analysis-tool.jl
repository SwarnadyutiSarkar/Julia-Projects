using CSV
using DataFrames
using Statistics
using Plots

# Read data from CSV file
function read_data(filename)
    df = CSV.read(filename, DataFrame)
    return df
end

# Perform statistical analysis
function analyze_data(df)
    summary_stats = describe(df)
    return summary_stats
end

# Generate histograms for numerical columns
function generate_histograms(df)
    numeric_cols = names(df, Number)
    for col in numeric_cols
        histogram(df[col], title=col, xlabel="Value", ylabel="Frequency", legend=false)
    end
    plot!()
end

# Generate box plots for numerical columns
function generate_boxplots(df)
    numeric_cols = names(df, Number)
    for col in numeric_cols
        boxplot!(df[col], title=col, xlabel="Column", ylabel="Value", legend=false)
    end
    plot!()
end

# Main function
function main()
    println("Welcome to the Data Analysis Tool in Julia!")

    # Read data from CSV file
    filename = "data.csv"
    println("Reading data from file: $filename")
    df = read_data(filename)
    println("Data loaded successfully.")

    # Perform statistical analysis
    println("Performing statistical analysis...")
    summary_stats = analyze_data(df)
    println(summary_stats)

    # Generate histograms
    println("Generating histograms...")
    generate_histograms(df)
    title!("Histograms")
    savefig("histograms.png")
    println("Histograms saved as histograms.png")

    # Generate box plots
    println("Generating box plots...")
    generate_boxplots(df)
    title!("Box Plots")
    savefig("boxplots.png")
    println("Box plots saved as boxplots.png")

    println("Data analysis complete.")
end

# Run main function
main()
