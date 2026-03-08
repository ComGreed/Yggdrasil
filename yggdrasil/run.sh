#!/usr/bin/with-contenv bashio
set -euo pipefail

CONFIG_NAME="$(bashio::config 'config_file')"
[ -n "${CONFIG_NAME}" ] || CONFIG_NAME="yggdrasil.conf"

USER_CONFIG="/config/${CONFIG_NAME}"
DATA_CONFIG="/data/yggdrasil.conf"

echo "Starting..."

if [ -f "${USER_CONFIG}" ]; then
    echo "Using user config: ${USER_CONFIG}"
    cp "${USER_CONFIG}" "${DATA_CONFIG}"
elif [ -f "${DATA_CONFIG}" ]; then
    echo "Using existing persistent config: ${DATA_CONFIG}"
else
    echo "No config found, generating default config..."
    yggdrasil -genconf > "${DATA_CONFIG}"
fi

echo "Launching Yggdrasil"
exec yggdrasil -useconffile "${DATA_CONFIG}"
