FROM python:3.9.15-bullseye
USER root
WORKDIR /TLE

RUN apt-get update
RUN apt-get install -y git apt-utils sqlite3
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y libcairo2-dev libgirepository1.0-dev libpango1.0-dev pkg-config python3-dev gir1.2-pango-1.0 libjpeg-dev zlib1g-dev
RUN pip install poetry

COPY ./poetry.lock ./poetry.lock
COPY ./pyproject.toml ./pyproject.toml

RUN python3 -m poetry install

COPY . .

ENTRYPOINT ["/TLE/run.sh"]
