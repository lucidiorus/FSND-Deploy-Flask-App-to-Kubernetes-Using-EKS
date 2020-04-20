FROM python:stretch

COPY . /app
WORKDIR /app

RUN apt-get update -y
RUN pip install --upgrade pip
ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]