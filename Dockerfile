# Use a base image with Node.js
FROM node:20-bullseye-slim

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Install supervisord
RUN apt-get update && apt-get install -y supervisor && apt-get clean

# Set the working directory
WORKDIR /app

# Copy Python app files and install dependencies
COPY ./python-app /app/python-app
RUN pip3 install -r /app/python-app/requirements.txt

# Copy Node.js app files and install dependencies
COPY ./nodejs-app /app/nodejs-app
RUN cd /app/nodejs-app && npm install

# Copy the supervisord config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 8080 5000

# Run both applications with supervisord
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
