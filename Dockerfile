# Use the official Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt and install dependencies first (for caching purposes)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Collect static files (this is important for serving static files like CSS)
RUN python manage.py collectstatic --noinput

# Expose port 8000 (Django default)
EXPOSE 8000

# Start Django with Gunicorn (or any WSGI server you are using)
CMD gunicorn --preload 'website.wsgi' --bind=0.0.0.0:8000
