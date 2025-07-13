#!/bin/sh

CONF_FILE="/tmp/qBittorrent/config/qBittorrent.conf"
WEBUI_DEFAULT_PASSWORD="@ByteArray(pwCLRtx4K6IL6tlIU9OcUA==:0UCcJlqpup59nL21mtlXozJl8GxrARBvwMdMuEsUzNE9EpCwVTywcA9EgCqOJeck7JRkXjpM6BjnkQ89Gf6UYQ==)"

[ -f "$CONF_FILE" ] && {
    if grep -Eq '[Preferences]' "$CONF_FILE"; then
        sed -Ei '/WebUI\\Password/d' "$CONF_FILE"
        grep -Eq 'WebUI\\Username' "$CONF_FILE" && sed -Ei "s/(WebUI\\\\Username.*)/\1\nWebUI\\\\Password_PBKDF2=\"${WEBUI_DEFAULT_PASSWORD}\"/" "$CONF_FILE"
    else
        echo "2"
    fi
}

exit