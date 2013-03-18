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

(define (pow x n)
  (if (= n 0) 
      1
      (* x (if (= n 1)
	       1
	       (pow x (- n 1))))))
  
(pow 2 0)

(define (n-root x n)
  (if (< n 4)
      (fixed-point (average-damp (lambda (y) (/ x (pow y (- n 1))))) 1.0)
      (fixed-point (average-damp (average-damp (lambda (y) (/ x (pow y (- n 1)))))) 1.0)))

(display (n-root 4 2)); 2.0000000929222947
(display (n-root 8 3)); 2.000003635062117
(display (n-root 16 4)); 2.000001711389449
(display (n-root 32 5)); 1.9999939482000788
(display (n-root 64 6)); 1.9999941331966569
(display (n-root 128 7)); 1.9999952615954668
