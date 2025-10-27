FROM python:3.9.7-slim-bullseye

# Install system dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    git \
    curl \
    python3-pip \
    ffmpeg \
    pkg-config \
    libcairo2-dev \
    libgirepository1.0-dev \
    build-essential \
    && pip3 install --upgrade pip \
    && pip3 install --upgrade -r requirements.txt \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Copy app files
COPY . /app/
WORKDIR /app/

# Start the app
CMD ["bash", "start.sh"]
