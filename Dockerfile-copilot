# Use the official Alpine Linux image
FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
	xfce4 \
	xfce4-terminal \
	dbus \
	ttf-dejavu \
	xvfb \
	x11vnc \
	fluxbox \
	curl \
	bash \
	sudo

# Install VS Code
RUN apk add --no-cache \
	libx11 \
	libxkbfile \
	libsecret \
	&& curl -L "https://update.code.visualstudio.com/latest/linux-arm64/stable" -o vscode.tar.gz \
	&& tar -xzf vscode.tar.gz -C /opt \
	&& ln -s /opt/VSCode-linux-arm64/code /usr/local/bin/code \
	&& rm vscode.tar.gz

# Create a user and set up sudo
RUN adduser -D vscode \
	&& echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the user to vscode
USER vscode

# Expose the VNC port
EXPOSE 5900

# Start the GUI
CMD ["sh", "-c", "xvfb-run -s '-screen 0 1024x768x16' fluxbox & x11vnc -forever -usepw -create"]
