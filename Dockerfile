FROM alpine:3.14
RUN apk add --no-cache python3
COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN pip install -r requirements.txt
COPY . /opt/app
RUN mkdir -p /home/Docker-proj
COPY ./Python.py /home/Docker-proj
RUN mkdir -p /home/Docker-proj/volume
WORKDIR /home/Docker-proj
CMD ["python3", "./Python.py"]
