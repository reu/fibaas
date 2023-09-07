(add-to-list 'load-path "./packages")
(require 'simple-httpd)

(setq httpd-host "0.0.0.0")
(setq httpd-port 4000)

(defun fib (n)
  (if (< n 2)
      n
    (+ (fib (- n 1)) (fib (- n 2)))))


(defservlet* :number text/plain (verbose)
   (insert (format "%d\n" (fib (string-to-number number)))))


(httpd-start)

(message "Server running on port %d" httpd-port)

(while t
  (sleep-for 5))
