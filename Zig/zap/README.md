# Fibbas (Zig / Zap)

### Install and Run
```bash
zig build run
```

Test connection:
```bash
curl http://localhost:4000/10
```

Benchmark with:
```bash
wrk -c 64 -d 30s http://localhost:4000/10
```

### Docker
You can also build an image and run it with something like:

```bash
docker build -t fibaas:1.0.0 .
docker run --rm -it -p 4000:4000 fibaas:1.0.0
```
