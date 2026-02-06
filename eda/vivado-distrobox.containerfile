FROM ubuntu:24.04

LABEL maintainer="Justin Beaurivage <code@beaurivage.io>"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    libxinerama1 \
    libxcomposite1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libasound2t64 \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgbm1 \
    libdrm2 \
    libstdc++6 \