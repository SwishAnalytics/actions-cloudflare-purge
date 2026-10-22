FROM python:3.13.2-alpine

# python:3.13.2-alpine ships ca-certificates 20241121, which still trusts the eMudhra roots distrusted in
# October 2026 (SEC-933). It is already installed, so a plain apk add does nothing: --upgrade moves it to
# 20261020-r0 or later.
RUN apk add --no-cache --upgrade ca-certificates

COPY main.py /app/main.py
ENTRYPOINT ["python", "/app/main.py"]