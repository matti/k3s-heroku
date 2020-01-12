#!/bin/sh
set -e

# echo "hang"
# tail -f /dev/null &
# wait $!

#mkdir /tmp /var/run

export K3S_DATASTORE_ENDPOINT=${DATABASE_URL}?sslmode=disable
export K3S_TOKEN=${K3S_TOKEN:-abbacdabbacdacdc}

case ${1:-} in
  server)
    export

    opts="--https-listen-port $PORT"
    exec /bin/k3s $@ $opts
  ;;
  *)
    exec $0
  ;;
esac
