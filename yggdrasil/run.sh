#!/usr/bin/with-contenv bashio
set -euo pipefail

echo "Starting Yggdrasil addon..."

CONFIG_NAME="$(bashio::config 'config_file')"
[ -n "${CONFIG_NAME}" ] || CONFIG_NAME="yggdrasil.conf"

USER_CONFIG="/config/${CONFIG_NAME}"
DATA_CONFIG="/data/yggdrasil.conf"

echo "User config path: ${USER_CONFIG}"
echo "Internal config path: ${DATA_CONFIG}"

# user config exists -> copy custom config to internal config
if [ -f "${USER_CONFIG}" ]; then
    echo "Using user provided config from ${USER_CONFIG}"
    cp "${USER_CONFIG}" "${DATA_CONFIG}"

# internal config exists -> use internal config
elif [ -f "${DATA_CONFIG}" ]; then
    echo "Using existing persistent config ${DATA_CONFIG}"

# no config exists -> generate to internal config and copy the custom config directory
else
    echo "No configuration found, generating default configuration..."
    yggdrasil -genconf > "${DATA_CONFIG}"

    echo "Copying generated config to user config directory..."
    cp "${DATA_CONFIG}" "${USER_CONFIG}"
fi

echo "Launching Yggdrasil..."
exec yggdrasil -useconffile "${DATA_CONFIG}"
