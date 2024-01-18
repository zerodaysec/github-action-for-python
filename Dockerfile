FROM python:3.12-alpine

LABEL "com.github.actions.name"="GitHub Action for python"
LABEL "com.github.actions.description"="Run pylint and other commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

RUN apk add --no-cache bash build-base gcc
RUN pip install --upgrade pip
RUN pip install pylint pipenv
RUN python --version ; pip --version ; pylint --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
