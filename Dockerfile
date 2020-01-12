FROM rancher/k3s

# nc is missing in the original k3s busybox
COPY --from=busybox:musl /bin/busybox /bin/busybox

WORKDIR /app
COPY app ./

ENTRYPOINT []
CMD [ "/app/entrypoint.sh", "server" ]
