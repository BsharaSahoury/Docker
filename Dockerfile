FROM alpine:3.14
RUN apk add --no-cache python3
WORKDIR /app
ADD . /app
RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN mkdir -p /home/Docker-proj
COPY ./Python.py /home/Docker-proj
RUN mkdir -p /home/Docker-proj/volume
WORKDIR /home/Docker-proj
CMD ["python3", "./Python.py"]
