FROM alpine:3.14
RUN apk add --no-cache python3
RUN apk add install python3-pip
WORKDIR /app
ADD . /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN mkdir -p /home/Docker-proj
COPY ./Python.py /home/Docker-proj
RUN mkdir -p /home/Docker-proj/volume
WORKDIR /home/Docker-proj
CMD ["python3", "./Python.py"]
