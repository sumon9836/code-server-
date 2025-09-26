# Use official code-server image
FROM codercom/code-server:latest

# Clear existing ENTRYPOINT
ENTRYPOINT []

# Set environment variables
ENV PASSWORD="@kira"
ENV SUDO_PASSWORD="@kira"

# Configure the existing coder user for sudo without password
USER root
RUN echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install additional tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    nano \
    htop \
    python3 \
    python3-pip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Switch to coder user
USER coder
WORKDIR /home/coder

# Create workspace directory
RUN mkdir -p /home/coder/workspace

# Expose port (metadata)
EXPOSE 8080

# Start code-server on Railway's assigned port
CMD ["sh", "-c", "code-server --bind-addr 0.0.0.0:${PORT:-8080} --auth password /home/coder/workspace"]
