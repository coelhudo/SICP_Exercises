(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeat f n)
  (if (= n 1)
      f
      (compose f (repeat f (- n 1)))))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

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

(define (square-root x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

(define (fourth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y))))) 1.0))

(define (fifth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y))))) 1.0))

(define (sixth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y))))) 1.0))

(define (seventh-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y y))))) 1.0))

(define (pow x n)
  (* x (if (< n 3)
	   x
	   (pow x (- n 1)))))

(define (n-root x n)
  (if (< n 4)
      (fixed-point (average-damp (lambda (y) (/ x (pow y (- n 1))))) 1.0)
      (fixed-point (average-damp (average-damp (lambda (y) (/ x (pow y (- n 1))))) 1.0))))

(square-root 4)
(cube-root 8)
(fourth-root 16)
(fifth-root 32)
(sixth-root 64)
(seventh-root 128)

(n-root 4 2)
(n-root 8 3)
(n-root 16 4)
(n-root 32 5)
(n-root 64 6)
(n-root 128 7)
