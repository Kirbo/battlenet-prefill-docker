@echo off
docker compose -f docker-compose.dev.yml run --rm battlenet-prefill %*
