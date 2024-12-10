# Use the latest Alpine Linux image
FROM alpine:latest

# Update the package list
RUN apk update

# Install the X server 
RUN apk add --no-cache xorg-server

# Install a window manager (example: xfwm)
RUN apk add --no-cache xfwm4

# Set the display environment variable
ENV DISPLAY=:0

# Run the window manager on container startup
CMD ["xfwm4"] 
