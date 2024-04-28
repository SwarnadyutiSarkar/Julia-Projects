using BioAlignments
using BioSequences
using BioSymbols

# Example genomic data (DNA sequences)
seq1 = DNASequence("ACGTACGTACGT")
seq2 = DNASequence("ACCTACGTAGGT")
seq3 = DNASequence("ACATACATACAT")

# Perform pairwise sequence alignment
alignment = pairwisealign(seq1, seq2, algorithm=SmithWaterman())

# Display alignment
println(alignment)

# Calculate pairwise sequence identity
identity1_2 = sequenceidentity(seq1, seq2)
identity1_3 = sequenceidentity(seq1, seq3)

# Display sequence identities
println("Sequence Identity between seq1 and seq2: $identity1_2")
println("Sequence Identity between seq1 and seq3: $identity1_3")
