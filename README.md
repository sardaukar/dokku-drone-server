# Drone (server) on Dokku

Companion blog post [here]. Counterpart agent repo [is here].

Steps:

* `dokku apps:create drone-server`
* `dokku storage:mount /var/lib/dokku/data/storage/drone-server/:/var/lib/drone`
* `dokku docker-options:add build "--build-arg DRONE_SECRET=<YOUR SECRET>"`
* `dokku docker-options:add deploy "--network drone_network"`
* `dokku docker-options:add run "--network drone_network"`
* `dokku config:set --no-restart DOKKU_LETSENCRYPT_EMAIL=<YOUR EMAIL>`
* `dokku proxy:ports-add http:80:8000`
* `dokku domains:add <custom domain>` (optional)
* `git push dokku`
* `dokku letsencrypt`

Don't forget to deploy again after logging in to Gogs and change `ENV DRONE_OPEN` to `false` in the Dockerfile.

[here]: https://blog.nootch.net/post/self-hosted-developer-bliss/
[is here]: https://github.com/sardaukar/dokku-drone-agent
