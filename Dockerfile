FROM python:3.15.0a5-alpine

LABEL "com.github.actions.name"="GitHub Action for python"
LABEL "com.github.actions.description"="Run pylint and other commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

RUN apk add --no-cache bash build-base gcc && \
pip install --upgrade pip && \
pip install pylint pipenv && \
python --version ; pip --version ; pylint --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
