# stage 1: Build Fastapi time app 
FROM python:3.9-slim as app 

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY app/  /app

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip 
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]

# stage 2: Set up nginx and certbot

FROM nginx:stable-alpine as nginx

COPY /nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/certbot

# Copy Certbot script
COPY /nginx/certbot.sh /usr/bin/certbot.sh

RUN chmod +x /usr/bin/certbot.sh

# Run Certbot before starting Nginx
CMD /usr/bin/certbot.sh && nginx -g "daemon off;"
