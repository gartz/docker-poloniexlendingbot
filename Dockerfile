FROM python:2.7
LABEL maintainer="Gabriel Reitz Giannattasio <g@gartz.me>" \
    description="Poloniexlendingbot is an open-source program for automated lending on the Poloniex cryptocurrency exchange."

ARG BRANCH=master

EXPOSE 80
WORKDIR /code

RUN git clone --branch ${BRANCH} https://github.com/Mikadily/poloniexlendingbot.git /code \
    && rm -Rf /code/.git \
    && rm -Rf /code/.github

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        vim-tiny \

    && pip install -U pip \
    && pip install numpy \

    && (rm -rf /code/.env* || true) \
    && (find /code  -type d -name __pycache__ -exec rm -rf "{}" \; || true) \
    && (find /code -type f -name \*.pyc -exec rm -f {} \; || true) \

    # Clean up cached files and git repo
    && (rm -rf /code/.git) \
    && (rm -rf ~/.cache/pip) \
    && rm -rf /var/lib/apt/lists/*

CMD python lendingbot.py
