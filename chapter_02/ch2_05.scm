(define (logb n base)
  (ceiling (/ (log n) (log base))))

(define (find-value value n)
  (if (= (remainder value n) 0)
      (find-value (/ value n) n)
      value))
 
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (logb (find-value z 3) 2))

(define (cdr z)
  (logb (find-value z 2) 3))

(car (cons 0 0)) ;0
(car (cons 0 1)) ;0
(car (cons 1 0)) ;1
(car (cons 1 1)) ;1
(cdr (cons 0 0)) ;0
(cdr (cons 0 1)) ;1
(cdr (cons 1 0)) ;0
(cdr (cons 1 1)) ;1
(cdr (cons 23 24)) ;24
(car (cons 23 24)) ;23
