#!/bin/sh
set -e

export K3S_DATASTORE_ENDPOINT=${DATABASE_URL}?sslmode=disable
export K3S_TOKEN=${K3S_TOKEN:-abbacdabbacdacdc}
export K3S_KUBECONFIG_OUTPUT=${K3S_KUBECONFIG_OUTPUT:-/tmp/kubeconfig.yaml}


echo "export:"
export
opts="--disable-agent --https-listen-port $PORT"
echo "opts: $opts"

(
  while true; do
    [ -f "$K3S_KUBECONFIG_OUTPUT" ] && break
    echo "waiting for $K3S_KUBECONFIG_OUTPUT"
    sleep 1
  done

  /app/kubeconfig set "$K3S_KUBECONFIG_OUTPUT"
  echo """

    KUBECONFIG written to redis

"""
) &

#tail -f /dev/null &
/bin/k3s $@ $opts &
wait $!
