(define zero 
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))
(define one
  (lambda (f) (lambda (x) (f x))))

;(add-1 one)
;(lambda (f) (lambda (x) (f ((one f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;(lambda (f) (lambda (x) (f (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (print-num num)
  (define (inc n)
    (+ 1 n))
  ((num inc) 0))

(print-num zero)
(print-num one)
(print-num two)

(define (add-num m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(print-num (add-num zero zero));0
(print-num (add-num zero one));1
(print-num (add-num one zero));1
(print-num (add-num one one));2
