# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to the home folder
WORKDIR /app

# Create a directory named 'app' inside the home folder
RUN mkdir app

# Switch the working directory to /app
WORKDIR /app

# Clone the GitHub repository
RUN git clone https://github.com/viper-18/cv-site.git .

# Install Django and other dependencies
RUN pip install django

# Expose port 8000 for Django
EXPOSE 8000

# Define the command to run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
