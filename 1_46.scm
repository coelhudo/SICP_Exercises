(define (iterative-improve is-good-enough-func improve-then)
  (define (improve-iter guess)
    (if (is-good-enough-func guess)
  guess
	(improve-iter (improve-then guess))))
  (lambda (guess) (improve-iter guess)))

(define (is-good? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (sqrt x)
  ((iterative-improve
    (lambda (y) (is-good? y x))
    (lambda (y) (improve y x))) 1.0))

(display (sqrt 4))
