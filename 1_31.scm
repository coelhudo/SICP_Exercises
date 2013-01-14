(define (product term a next b)
  (newline)
  (display a)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (inc x) 
  (+ x 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(factorial 4)

(define (even? x)
  (= (remainder x 2) 0))

(define (next x)
  (+ x 2))

(define (square x)
  (* x x))

(define (transform a)
  (square (/ a (- a 1))))

(define (fast-pi-app n)
  (define (evenizer)
    (if (even? n)
  n
	(+ n 1)))
  (* 4 (* (/ 2. (+ (evenizer) 3)) (product transform 4 next (+ n 2)))))

(fast-pi-app 50000)
