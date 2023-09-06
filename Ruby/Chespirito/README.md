## Ruby - Chespirito

The Ruby fibaas®️  version using [Chespirito](https://github.com/leandronsp/chespirito).

## Stack

* Ruby 3.3.0-preview0 +YJIT
* Puma
* Chespirito

## Requirements

Docker

## Running
```bash
$ cd Ruby/Chespirito
$ docker compose up

# or 

$ docker build -t fibaas-ruby-chespirito --target prod
$ docker run -p 4000:4000 fibaas-ruby-chespirito
```

## Stressing

Puma (Threads: 0:5 | Forks: 0)
```bash
$ wrk -c 64 -d 30s http://localhost:4000/10

Running 30s test @ http://localhost:4000/10 
  2 threads and 64 connections          
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   653.97us  440.89us  48.48ms   98.48%
    Req/Sec     3.07k   206.26     3.36k    89.33%
  183318 requests in 30.01s, 11.54MB read                                             
Requests/sec:   6109.51                                                               
Transfer/sec:    393.78KB
```

Puma (Threads: 0:16 | Forks: 8)
```bash
$ wrk -c 64 -d 30s http://localhost:4000/10

Running 30s test @ http://localhost:4000/10
  2 threads and 64 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     3.34ms    4.12ms 130.04ms   93.19%
    Req/Sec    11.69k     1.03k   14.03k    79.50%
  698312 requests in 30.01s, 43.95MB read
Requests/sec:  23267.97
Transfer/sec:      1.46MB
```
