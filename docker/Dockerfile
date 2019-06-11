FROM alpine:3.9

RUN apk add --no-cache python3 \
    python3-dev \
    build-base \
    libxslt-dev \
    libxml2-dev \
    netcat-openbsd \
    git

WORKDIR /tapiriik

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8000

ENTRYPOINT ["docker/docker-entrypoint.sh", "python3"]

CMD ["manage.py", "runserver", "0.0.0.0:8000"]
