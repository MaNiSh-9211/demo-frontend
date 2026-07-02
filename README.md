# demo-frontend

**Dev/test repo** — browser test console SPA. Use on Render to validate gateway + UAM + demo-backend.

## Build

```bash
docker build -t demo-frontend:latest .
```

## Run (local)

```bash
cd ../dev
docker compose -f docker-compose.yml -f docker-compose.testing.yml up --build
```

Console URL: http://localhost:8090 (default `FRONTEND_TEST_PORT`).

## Render

Set in the **Render dashboard** (not in git):

| Variable | Example |
|----------|---------|
| `GATEWAY_PROXY_URL` | `https://YOUR-GATEWAY.onrender.com` |
| `GATEWAY_PROXY_HOST` | `YOUR-GATEWAY.onrender.com` |
| `UAM_FRONTEND_URL` | `https://YOUR-UAM-FRONTEND.onrender.com` |

`nginx.conf.template` and `runtime-config.js` are rendered at container start via `docker-entrypoint.sh`.
Local Compose keeps defaults (`http://gateway:8080`).

### Test flow

1. Open demo-frontend home → **Gateway health** (`/gw/health`)
2. **Sign in with UAM** → uam-frontend login
3. After login, call protected API via gateway: `GET /api/v1/users` with Bearer token

Full stack docs: [`../dev/README.md`](../dev/README.md)
