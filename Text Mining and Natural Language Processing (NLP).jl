using TextAnalysis

# Example text data
text_data = ["This is the first document.",
             "This document is the second document.",
             "And this is the third one.",
             "Is this the first document?"]

# Tokenization
tokens = map(lowercase, tokenize.(text_data))

# Build a document-term matrix
dtm = DocumentTermMatrix(tokens)

# Extract term frequency-inverse document frequency (tf-idf) features
tfidf_matrix = tfidf(dtm)

# Perform topic modeling (Latent Dirichlet Allocation)
model = LDA(tfidf_matrix, 2)  # 2 topics
fit!(model)

# Get topics and their top words
topics = get_topics(model)

# Display topics
for (topic_idx, words) in enumerate(topics)
    println("Topic $topic_idx: $(join(words, ", "))")
end
