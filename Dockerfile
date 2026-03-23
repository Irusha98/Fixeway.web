# Use full Python image (not slim) so gcc + audioop are included
FROM python:3.13

WORKDIR /app

# Install system dependencies for moviepy/pydub
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy all code
COPY . .

# Expose port
EXPOSE 10000

# Start Gunicorn
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:10000"]
