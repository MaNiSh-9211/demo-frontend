# demo-frontend

**Dev-only repo** — browser test console SPA. **Do not deploy to production.**

## Build

```bash
docker build -t demo-frontend:latest .
```

## Run

This repo has no standalone `compose.yaml`. Use the dev orchestration stack:

```bash
cd ../dev
docker compose -f docker-compose.yml -f docker-compose.testing.yml up --build
```

Console URL: http://localhost:8090 (default `FRONTEND_TEST_PORT`).

Full stack docs: [`../dev/README.md`](../dev/README.md)
