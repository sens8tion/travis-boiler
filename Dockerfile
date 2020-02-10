FROM python:3.8-slim-buster as builder

ADD hello.py /

CMD ["python", "./hello.py"]