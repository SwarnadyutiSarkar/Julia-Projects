module BioinformaticsToolkit

export reverse_complement, gc_content, count_nucleotides

# Function to compute the reverse complement of a DNA sequence
function reverse_complement(sequence::String)
    complement = Dict('A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C')
    rev_comp = reverse([complement[base] for base in sequence])
    return join(rev_comp)
end

# Function to compute the GC content of a DNA sequence
function gc_content(sequence::String)
    gc_count = count(x -> (x == 'G' || x == 'C'), sequence)
    gc_percent = (gc_count / length(sequence)) * 100
    return gc_percent
end

# Function to count the occurrences of each nucleotide in a DNA sequence
function count_nucleotides(sequence::String)
    counts = Dict('A' => 0, 'T' => 0, 'C' => 0, 'G' => 0)
    for base in sequence
        counts[base] += 1
    end
    return counts
end

end # module
