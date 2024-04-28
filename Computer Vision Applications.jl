using Images
using TestImages

# Load test image (example: Lena image)
img = testimage("lena")

# Display the image
display(img)

# Convert the image to grayscale
gray_img = Gray.(img)

# Display the grayscale image
display(gray_img)

# Perform edge detection using the Canny edge detector
edge_img = canny(gray_img)

# Display the edge-detected image
display(edge_img)
