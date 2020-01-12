# k3s-heroku

## install

    ln -s $(pwd)/bin/k3s-heroku /usr/local/bin

## usage

    k3s-heroku init APP
    k3s-heroku deploy APP

    k3s-heroku kubeconfig APP > kubeconfig

    # edit kubeconfig host

    export KUBECONFIG=kubeconfig

## problemz

    ➜  k3s-heroku git:(master) ✗ kubectl get pod
    Unable to connect to the server: x509: certificate signed by unknown authority

    ➜  k3s-heroku git:(master) ✗ kubectl --insecure-skip-tls-verify=true get pod
    Error from server (BadRequest): the server rejected our request for an unknown reason
