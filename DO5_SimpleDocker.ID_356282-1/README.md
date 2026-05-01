# DO5 — Simple Docker

> School 21 DevOps Track · January 2026

Working with Docker from scratch — pulling images, running containers, configuring Nginx, writing Dockerfiles, and using Docker Compose.

---

## What Was Done

**Part 1 — Docker basics**
- Pulled official `nginx` image with `docker pull`
- Ran container, checked status with `docker ps`
- Inspected container: size, mapped ports, IP address
- Mapped ports 80 and 443, verified Nginx start page at `localhost:80`
- Stopped, restarted, and managed containers

**Part 2 — Custom Nginx config**
- Read default `nginx.conf` inside the container via `docker exec -it`
- Wrote a custom config with `/status` endpoint (Nginx stub status)
- Copied config into the container with `docker cp`
- Verified `localhost:80/status` returns server status page
- Exported container to `container.tar`, deleted image and container
- Imported it back and re-launched successfully

**Part 3 — Mini server + Dockerfile**
- Wrote a simple C server (`server.c`)
- Built a custom Docker image with a `Dockerfile`
- Configured Nginx as a reverse proxy to the server

**Part 4 — Docker Compose**
- Wrote `docker-compose.yml` for a multi-container setup
- Launched services together, verified communication

## Files

```
src/
├── Dockerfile
├── docker-compose.yml
├── nginx/nginx.conf
└── server/
    ├── server.c
    └── nginx/nginx.conf
```

## Tools Used

`docker` · `docker compose` · `nginx` · `C`
