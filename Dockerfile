# Use the latest Alpine Linux image
FROM alpine:latest

# Update the package list
RUN apk update

# Install the X server 
RUN apk add --no-cache xorg-server xfwm4

# Install a window manager (example: xfwm)
# RUN apk add --no-cache xfwm4

# Set the display environment variable
ENV DISPLAY=:0

# Print environment variables for debugging
RUN env

# Run the window manager on container startup
CMD ["xfwm4"] 
