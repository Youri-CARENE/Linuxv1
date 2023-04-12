# Base image
FROM python:3.9-slim-buster

# Install required packages
RUN apt-get update && apt-get install -y nginx

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the required packages
RUN pip install -r requirements.txt

# Copy the nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the application code
COPY app /app

# Expose the application port
EXPOSE 5000

# Launch the nginx server
CMD ["nginx", "-g", "daemon off;"]
