# Use official code-server image
FROM codercom/code-server:latest

# Railway sets $PORT automatically, we’ll pass it to code-server
ENV PASSWORD=@kira

# Expose the Railway port
EXPOSE 8080

# Start code-server with auth
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/home/coder/project"]
