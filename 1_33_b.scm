(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a b) (combiner (term a) 
				(filtered-accumulate combiner null-value term (next a) next b filter)))
	(else (combiner null-value
			(filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (product-of-positive-intergers-less-than-and-relatively-prime-to n)
  (define (relatively-prime a b)
    (= (gcd a b) 1))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime))

(product-of-positive-intergers-less-than-and-relatively-prime-to 10) ;;189 -> 1 * 3 * 7 * 9
(product-of-positive-intergers-less-than-and-relatively-prime-to 7) ;;720 -> 1 * 2 * 3 * 4 * 5 * 6
