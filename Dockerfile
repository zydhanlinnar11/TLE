FROM python:3.9.15-bullseye as poetry
WORKDIR /TLE
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && \
    apt-get install -y libcairo2-dev libgirepository1.0-dev \
    libpango1.0-dev pkg-config python3-dev gir1.2-pango-1.0 libjpeg-dev zlib1g-dev && \
    pip install poetry
COPY ./poetry.lock ./poetry.lock
COPY ./pyproject.toml ./pyproject.toml
RUN poetry install --no-interaction --no-ansi -vvv

FROM python:3.9.15-slim-bullseye as runtime
COPY --from=poetry /TLE/.venv /TLE/.venv
ENV PATH="/TLE/.venv/bin:$PATH"
COPY . /TLE

ENTRYPOINT ["bash", "/TLE/run-docker.sh"]
