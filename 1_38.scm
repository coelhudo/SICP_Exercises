(define (cont-frac f-n f-d k)
  (cont-frac-iter f-n f-d 1 k 0))

(define (inc x)
  (+ x 1))

(define (cont-frac-iter f-n f-d result k count)
  (let ((nk (f-n count))
       (dk (f-d count)))
    (if (= count k)
  result
	(cont-frac-iter f-n f-d (/ nk (+ dk result)) k (inc count)))))

(define (loop)
  (define (loop-iter count max)
    (newline)
    (display (cont-frac (lambda (i) 1.)
			(lambda (i) (if (= (/ i 3) 0)
					1
					(+ (* 2 (/ i 3)) 2)))
			count))
    (if (not (= count max))
	(loop-iter (+ count 1) max)))
  (loop-iter 0 100))

(loop)

(define (loop)
  (define (loop-iter count max)
    (newline)
    (display ((lambda (i) (if (= (/ i 3) 0)
			      1
			      (+ (* 2 (/ i 3)) 2))) count))
    (if (not (= count max))
	(loop-iter (+ count 1) max)))
  (loop-iter 0 100))

(loop)
