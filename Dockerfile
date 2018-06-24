FROM drone/drone:0.8.5

EXPOSE 8000
EXPOSE 9000

ARG DRONE_SECRET

ENV DRONE_OPEN=true # <-- remember to change to false after you successfully login for the first time!
ENV DRONE_HOST=https://drone.dokku.me # <-- change to your domain for the dokku app
ENV DRONE_GOGS=true
ENV DRONE_GOGS_PRIVATE_MODE=true
ENV DRONE_GOGS_URL=https://gogs.dokku.me # <-- change to your Gogs URL
ENV DRONE_SECRET=$DRONE_SECRET

ENTRYPOINT ["/bin/drone-server"]
