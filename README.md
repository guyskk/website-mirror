## Website Mirror with Cache

Run mirror with cache for any website, useful for packaging mirrors.

Docker Image: `guyskk/website-mirror:latest`  
Volume Path: `/data`  
HTTP Port: `80`  

| Environment variable | Default value | description |
| -------------------- | ------------- | ----------- |
| PROXY_URL   | `https://www.nginx.com`  | Proxy website url |
| PROXY_HOST  | `www.nginx.com`          | Proxy website host |
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
    -e PROXY_URL=https://pypi.org \
    -e PROXY_HOST=pypi.org \
    guyskk/website-mirror:latest
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
    -e PROXY_URL=https://registry.npmjs.com \
    -e PROXY_HOST=registry.npmjs.com \
    guyskk/website-mirror:latest
docker logs --tail 100 -f npm-mirror
```

```bash
npm install lodash --registry=http://127.0.0.1:8002
```

### References

- https://docs.nginx.com/nginx/admin-guide/content-cache/content-caching/
- https://github.com/guyskk/envsub-njs
