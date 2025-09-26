FROM codercom/code-server:latest

# Set environment variables
ENV PASSWORD="@kira"
ENV SUDO_PASSWORD="@kira"

# Configure the existing coder user
USER root
RUN echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install additional tools (customize as needed)
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



# Start code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/home/coder/workspace"]
