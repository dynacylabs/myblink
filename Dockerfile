FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy the startup script
COPY . /app
COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# Set entry point
CMD ["/startup.sh"]