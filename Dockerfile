FROM python:3.9
COPY server.py /server.py
CMD ["python3", "-u", "server.py"]