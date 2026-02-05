FROM jlesage/baseimage-gui:ubuntu-24.04

ARG APP_VERSION=latest

ENV APP_NAME="Simpler FileBot" \
    APP_VERSION="${APP_VERSION}" \
    XDG_DATA_HOME="/config" \
    XDG_CONFIG_HOME="/config"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        libegl1 \
        libgl1 \
        libxkbcommon-x11-0 \
        libxcb-cursor0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r /app/requirements.txt

COPY . /app
COPY docker/startapp.sh /startapp.sh
RUN chmod +x /startapp.sh
