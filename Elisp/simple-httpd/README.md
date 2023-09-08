# Fibaas (ELisp - simple-httpd)

ELisp implementation of Fibaas.

An ELisp (Emacs Lisp) implementation of Fibaas that can be executed in
both a standard Emacs environment and as from ELISP REPL. The
instructions below are for the latter method, which does not involve
using Emacs in editor mode.

### Requirements
- Emacs >= 29

### Running the app

```bash
$ emacs -Q -batch -l server.el
```

### Benchmark

```bash
$ wrk -t 4 -c 300 -d 10s http://localhost:4000/10
```

### Docker

```bash
docker build -t fibaas:1.0.0 .
docker run --rm -it -p 4000:4000 fibaas:1.0.0
```

