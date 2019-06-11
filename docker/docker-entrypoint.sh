#!/usr/bin/env sh

# Copy local_settings accepting env variables
cp docker/env_settings.py tapiriik/local_settings.py
# Write fresh public/private keypair to settings
python3 credentialstore_keygen.py >> tapiriik/local_settings.py

# Wait for rabbitmq to be available
while ! nc -q 1 rabbitmq 5672 </dev/null; do sleep 1; done

exec "$@"
