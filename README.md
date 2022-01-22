## Website Mirror with Cache ([GitHub](https://github.com/guyskk/website-mirror))

Run mirror with cache for any website, useful for packaging registry, eg: PyPI, NPM.

| Environment variable | Default value | description |
| -------------------- | ------------- | ----------- |
| CACHE_MAX_SIZE       | `10g` (10 GB)   | Cache storage size |
| CACHE_INACTIVE       | `180d` (180 days) | Cached data will removed when inactive |
| CACHE_KEYS_ZONE_SIZE | `50m` (50 MB)     | Nginx keys_zone, 1MB zone can store about 8K keys |
| CACHE_VALID | `10m` (10 minutes) | Unconditional cache time, will fallback to HTTP cache-control / ETags when expired |

### Usage: PyPI mirror

```bash
docker volume create pypi-mirror-volume
docker rm -f pypi-mirror
docker run -d \
    --name pypi-mirror \
    --restart unless-stopped \
    --log-driver json-file --log-opt max-size=50m --log-opt max-file=10 \
    --memory=500M \
    --cpus=0.5 \
    -p 127.0.0.1:8001:80 \
    -v pypi-mirror-volume:/data \
    guyskk/pypi-mirror:latest
docker logs --tail 100 -f pypi-mirror
```

```bash
pip install cowsay -i http://127.0.0.1:8001/simple/
```

### Usage: NPM mirror

```bash
docker volume create npm-mirror-volume
docker rm -f npm-mirror
docker run -d \
    --name npm-mirror \
    --restart unless-stopped \
    --log-driver json-file --log-opt max-size=50m --log-opt max-file=10 \
    --memory=500M \
    --cpus=0.5 \
    -p 127.0.0.1:8002:80 \
    -v npm-mirror-volume:/data \
    guyskk/npm-mirror:latest
docker logs --tail 100 -f npm-mirror
```

```bash
npm install lodash --registry=http://127.0.0.1:8002
```

### References

- https://docs.nginx.com/nginx/admin-guide/content-cache/content-caching/
- https://github.com/guyskk/envsub-njs
- https://github.com/ossobv/pypi-nginx-cache
