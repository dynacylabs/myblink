FROM python:3.12-slim

# Set working directory inside the container
WORKDIR /app

# Copy the startup script
COPY . /app

# Install dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Pip install
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install .

# Set entry point
CMD ["./startup.sh"]