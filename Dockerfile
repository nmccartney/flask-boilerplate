FROM python:3.9-slim as builder

WORKDIR /flask-api

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .

# install python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# COPY ./gunicorn-cfg.py .
COPY . .

# Cache is invalidated when ARG is USED so put this low in stage
ARG BUILD_DATE
ENV BUILD_DATE="$BUILD_DATE"
ARG GIT_HASH
ENV GIT_HASH="$GIT_HASH"
ARG GIT_TAG=""
ENV GIT_TAG="$GIT_TAG"
ARG BUILD_TYPE=
ENV BUILD_TYPE="$BUILD_TYPE"

EXPOSE 5005


FROM builder as dev
# gunicorn
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "run:app"]



FROM builder as watch-dev

COPY --from=builder /flask-api /flask-api

WORKDIR /flask-api

ENTRYPOINT python ./run.py
# watchmedo auto-restart --recursive --pattern="*.py" --directory="." python mypackage/run.py
# CMD [ "watchmedo","auto-restart", "--recursive",  "--pattern='*.py'", "--directory='.'", "python", "run.py" ]

