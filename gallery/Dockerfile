# Google AI Edge Gallery - Dockerfile
# Base image with Node.js and Python (for React frontend and Python backend)
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y git curl wget unzip ffmpeg build-essential python3 python3-pip nodejs npm openjdk-17-jdk && \
    ln -s /usr/bin/python3 /usr/bin/python

# Set working directory
WORKDIR /app

# Clone the repo
RUN git clone https://github.com/google-ai-edge/gallery.git .

# Install Python dependencies (if any)
RUN if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Install Node.js dependencies (assuming React frontend in /app/gallery_web)
WORKDIR /app/gallery_web
RUN npm install && npm run build

# Go back to app root
WORKDIR /app

# Expose port (change according to app requirements)
EXPOSE 3000

# Default command (adjust according to project’s actual start command)
CMD ["npm", "start"]
