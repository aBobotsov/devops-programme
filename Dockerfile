FROM ubuntu:22.04

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip

# Since requirements changes are less frequent
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r app/requirements.txt

# Copy just the app w/o the test
COPY app/app.py /app
WORKDIR /app

# App running on default Flask port - 5000
EXPOSE 5000

CMD [ "python3", "app.py" ]