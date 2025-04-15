# Use the official Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy files to the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8000 (Django default)
EXPOSE 8000

# Start Django dev server
CMD gunicorn --preload 'website.wsgi' --bind=0.0.0.0:8000
