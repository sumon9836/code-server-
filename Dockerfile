# Use official code-server image
FROM codercom/code-server:latest

# Railway sets $PORT automatically
ENV PASSWORD=railwaypassword

# Expose the port Railway provides (default 8080, but we use $PORT dynamically)
EXPOSE 8080

# Start code-server, binding to Railway's $PORT
CMD ["sh", "-c", "code-server --bind-addr 0.0.0.0:${PORT} --auth password /home/coder/project"]
