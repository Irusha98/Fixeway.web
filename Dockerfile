# Use Python 3.13 slim image
FROM python:3.13

# Install ffmpeg for moviepy/pydub
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all code
COPY . .

# Expose port (Render uses 10000)
EXPOSE 10000

# Start app
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:10000"]
