import multiprocessing

workers = multiprocessing.cpu_count()

bind = "0.0.0.0:4000"
worker_class = "meinheld.gmeinheld.MeinheldWorker"
