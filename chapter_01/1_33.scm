(define (identity x) x)
(define (inc x) (+ x 1))
(define (less-than a b) (not (> a b)))
(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
	((filter a b) (combiner (term a) 
				(filtered-accumulate combiner null-value term (next a) next b filter)))
	(else (combiner null-value
			(filtered-accumulate combiner null-value term (next a) next b filter)))))
		      

(filtered-accumulate * 1 identity 1 inc 5 less-than) ;;120

(define (sum-of-square-of-prime-number a b)
  (define (prime-filter a b)
    (prime? a))
  (filtered-accumulate + 0 square a inc b prime-filter))

(sum-of-square-of-prime-number 0 10) ;;88 (1^2 + 2^2 + 3^2 + 5^2 + 7^2)
