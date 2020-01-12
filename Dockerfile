FROM rancher/k3s

WORKDIR /heroku
COPY heroku ./

ENTRYPOINT [ "/heroku/entrypoint.sh" ]
CMD ["server"]
