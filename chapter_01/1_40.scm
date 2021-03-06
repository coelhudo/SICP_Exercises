(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? next guess)
    guess
	  (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a (* x x)) (* b x) c)))

(newtons-method (cubic 3 -2.4 6) 1.); -3.981336708489653 - Same as on billthelizard.com
;http://www.1728.org/cubic.htm - for results comparation
