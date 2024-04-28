using Flux
using Flux: onehotbatch, onecold, crossentropy, throttle
using Statistics: mean
using Base.Iterators: repeated

# Example dataset (MNIST digits)
using Flux.Data.MNIST
imgs = MNIST.images()
labels = MNIST.labels()
train_data = [(imgs[i], onehot(labels[i], 0:9)) for i in 1:50000]
test_data = [(imgs[i], onehot(labels[i], 0:9)) for i in 50001:60000]

# Define the neural network model
model = Chain(
    Conv((5, 5), 1=>16, relu),
    MaxPool((2,2)),
    Conv((5, 5), 16=>8, relu),
    MaxPool((2,2)),
    x -> reshape(x, :, size(x, 4)),
    Dense(200, 120),
    Dense(120, 84),
    Dense(84, 10),
    softmax)

# Define loss function and optimizer
loss(x, y) = crossentropy(model(x), y)
opt = ADAM()

# Train the model
epochs = 10
for epoch in 1:epochs
    Flux.train!(loss, Flux.params(model), train_data, opt)
end

# Evaluate the model
accuracy(x, y) = mean(onecold(model(x)) .== onecold(y))
acc = accuracy(test_data...)
println("Accuracy: $acc")
