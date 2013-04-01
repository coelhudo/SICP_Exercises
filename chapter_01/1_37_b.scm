(define (cont-frac f-n f-d k)
  (cont-frac-iter f-n f-d 1 k 0))

(define (inc x)
  (+ x 1))

(define (cont-frac-iter f-n f-d result iterations limit)
  (newline)
  (display (f-n iterations))
  (display " / ( ")
  (display (f-d iterations))
  (display " + ")
  (display result)
  (display " )")
  (let ((nk (f-n iterations))
	(dk (f-d iterations)))
    (if (= (inc iterations) limit)
	result
	(cont-frac-iter f-n f-d (/ nk (+ dk result)) (- iterations 1) limit))))

(define (loop)
  (define (loop-iter count max)
    (newline)
    (display (cont-frac (lambda (i) 1.)
			(lambda (i) 1.)
			count))
    (if (not (= count max))
	(loop-iter (+ count 1) max)))
  (loop-iter 0 13))

(loop)
;; Same as 1_37_a.scm
