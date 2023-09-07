# Fibbas (NestJS)

### Installation

```bash
$ yarn install
```

### Running the app

```bash
# development
$ yarn run start

# watch mode
$ yarn run start:dev

# production mode
$ yarn run start:prod
```

### Benchmark

```bash
wrk -c 64 -d 30s http://localhost:4000/10
```

### Docker

```bash
docker build -t fibaas:1.0.0 .
docker run --rm -it -p 4000:4000 fibaas:1.0.0
```
