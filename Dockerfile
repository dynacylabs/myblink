FROM python:3.12-slim

# Set working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy the startup script
COPY . /app

# Set entry point
CMD ["./startup.sh"]