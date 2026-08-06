#!/bin/sh

. /lib.subr

set -e

export FILEBROWSER_CONFIG=/usr/local/etc/filebrowser-quantum.yaml

create_user

change_owner \
    /usr/local/www/filebrowser-quantum \
    /var/db/filebrowser-quantum

if [ -w "${FILEBROWSER_CONFIG}" ]; then
    chown noroot:noroot "${FILEBROWSER_CONFIG}"
fi

exec su-exec noroot filebrowser-quantum "$@"
