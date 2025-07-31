FROM python:3.9.7-slim-bullseye

# Install system dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git curl python3-pip ffmpeg && \
    apt-get clean

# Upgrade pip
RUN pip3 install --upgrade pip

# Copy app files
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --upgrade -r requirements.txt

# Start the app
CMD ["bash", "start.sh"]
