FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
	bash \
	xvfb \
	x11vnc \
	xfce4 \
	xfce4-terminal \
	dbus \
	mesa-gl \
	nodejs \
	npm \
	wget \
	libc6-compat \
	libstdc++ \
	gtk+3.0 \
	nss

# Create a non-root user
RUN adduser -D dev

# Old wget URL
# https://code.visualstudio.com/sha/download?build=stable&os=linux-alpine

# Install VS Code
RUN wget -O vscode.tar.gz "https://update.code.visualstudio.com/latest/linux-arm64/stable" && \
	tar -xf vscode.tar.gz -C /opt && \
	rm vscode.tar.gz

# Set up environment
ENV DISPLAY=:0
ENV HOME=/home/dev
WORKDIR /home/dev

# Switch to non-root user
USER dev

# Expose VNC port
EXPOSE 5900

# Start script
COPY start.sh /start.sh
# RUN chmod +x /start.sh

# CMD ["/start.sh"]