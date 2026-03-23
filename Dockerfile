FROM python:3.13
WORKDIR /app

# Copy and install requirements
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Expose port
EXPOSE 10000

# Start server
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:10000"]
