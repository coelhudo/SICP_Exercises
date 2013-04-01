(define (product term a next b)
  (define (product-iter term-a next-a )
    (if (> next-a b)
  term-a
	(product-iter (* (term next-a) term-a) (next next-a))))

  (product-iter a (next a)))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)

(define (cube x) (* x x x))
(product cube 1 inc 4) 
