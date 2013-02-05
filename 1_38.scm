(define (cont-frac f-n f-d k)
  (cont-frac-iter f-n f-d k 0))

(define (cont-frac-iter f-n f-d k count)
  (let ((fk (f-n count))
        (dk (f-d count)))
    (if (= count k)
	(/ fk dk)
	(/ fk (+ dk (cont-frac-iter f-n f-d k (+ count 1)))))))

(define (euler-approx k)
  (+ 2 (/ 1 (+ 1 (cont-frac (lambda (i) 1.)
			    (lambda (i) (if (not (= (remainder i 3) 0))
					    1
					    (+ (* 2 (/ i 3)) 2))) k)))))

(euler-approx 100) ;;2.7182818284590455
