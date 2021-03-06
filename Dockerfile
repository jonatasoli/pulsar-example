FROM python:3-slim

RUN apt-get update && \
    apt-get install -y locales && \
    sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=pt_BR.UTF-8 && \
    apt update && \
    apt install -y libjpeg-dev zlib1g-dev python3-dev build-essential \
    libpcre3 libpcre3-dev
RUN apt-get install -y libxml2 libxslt-dev
COPY ./requirements.txt ./requirements.txt

#Copy repository
ADD . /src

WORKDIR /src

RUN pip install --upgrade pip && pip install -r requirements.txt
