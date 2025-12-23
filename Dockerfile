FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY pyproject.toml README.md LICENSE ./
COPY src/ src/

# Install package
RUN pip install --no-cache-dir -e .

# Create non-root user
RUN useradd -m -u 1000 appuser && \
    mkdir -p /data && \
    chown -R appuser:appuser /data /app && \
    chmod 755 /data

USER appuser

# Environment variables
ENV MCP_TRANSPORT=http
ENV MCP_HOST=0.0.0.0
ENV TASK_TRACKER_MCP_PORT=8000
ENV PYTHONUNBUFFERED=1

# Expose port for HTTP transport
EXPOSE 8000

# Health check: verify database is accessible
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import sqlite3; sqlite3.connect('tasks.db').execute('SELECT 1')" || exit 1

# Default command runs the MCP server (defaults to HTTP transport)
CMD ["python", "-m", "task_tracker_mcp.server"]
