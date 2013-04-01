(define (iterative-improve is-good-enough-func improve-then)
  (define (improve-iter guess)
    (if (is-good-enough-func guess)
  guess
	(improve-iter (improve-then guess))))
  (lambda (guess) (improve-iter guess)))

;; sqrt

(define (is-good? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (sqrt x)
  ((iterative-improve
    (lambda (y) (is-good? y x))
    (lambda (y) (improve y x))) 1.0))

(display (sqrt 4)); 2.0000000929222947

;; fixed point

(define (is-good? f x)
  (< (abs (- (f x) x)) 0.00001))

(define (fixed-point f x)
    ((iterative-improve
    (lambda (y) (is-good? f y))
    (lambda (y) (f y))) x))

(fixed-point cos 1) ;.7390893414033927
(fixed-point (lambda (y) (+ (sin y) (cos y)))
	     1.0) ;1.2587228743052672
