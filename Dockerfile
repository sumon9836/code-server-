FROM codercom/code-server:latest

# Railway sets $PORT automatically
ENV PASSWORD=railwaypassword

EXPOSE 8080

# Use shell form so $PORT expands correctly
CMD sh -c "code-server --bind-addr 0.0.0.0:${PORT} --auth password /home/coder/project"
