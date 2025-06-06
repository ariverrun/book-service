## Local usage in dev environment

1. Copy env file

```bash
cp docker/.env docker/.env.local
```

2. Copy dev docker compose config example to override the default one

```bash
cp docker/docker-compose.override.example.yaml docker/docker-compose.override.yaml
```

3. Build application

```bash
make dc_build
```

4. Run app containers

```bash
make dc_up
```