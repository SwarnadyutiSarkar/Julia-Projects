using Images

# Load an image
img = load("image.jpg")  # Replace "image.jpg" with the path to your image file

# Display the image
display(img)

# Convert the image to grayscale
gray_img = Gray.(img)

# Display the grayscale image
display(gray_img)

# Resize the image
resized_img = imresize(gray_img, 0.5)

# Display the resized image
display(resized_img)

# Apply a Gaussian blur
blurred_img = imfilter(resized_img, Kernel.gaussian(3))

# Display the blurred image
display(blurred_img)
