FROM python:3.12
WORKDIR /SIMPLE_APP
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . . 
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
        CMD curl -f http://localhost:80/health || exit 1
ENTRYPOINT ["python", "./src/app.py"]


