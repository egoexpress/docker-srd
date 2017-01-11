#!/bin/bash

if [ -z "$SRK_KNOWN_URL" ]; then
    echo >&2 "$me: error: The following environment variables must be set:"
    echo >&2 "$me:      \$SRK_KNOWN_URL"
    echo >&2 "$me:   Add them using the -e option to docker run"
    exit 1
fi

echo "  site_url: $SRK_KNOWN_URL" >> /root/.sifttter_redux
echo "  username: $SRK_KNOWN_USER" >> /root/.sifttter_redux
echo "  api_key: $SRK_KNOWN_API_KEY" >> /root/.sifttter_redux
echo "OAUTH_ACCESS_TOKEN=${SRK_DROPBOX_TOKEN}" >> /root/.dropbox_uploader

# start cron daemon
/usr/sbin/cron

exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
