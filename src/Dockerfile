# Use an official Python runtime as the base image
FROM python:3.8-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# Set the working directory in the container to /app
WORKDIR /backend

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gcc \
    pkg-config \
    libmariadb-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt and install Python dependencies
COPY requirements.txt /backend/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /backend/

# Expose port 5000 for Django application
EXPOSE 5000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]
