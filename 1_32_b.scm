(define (accumulate combiner term a next b)
  (define (accumulate-iter term-a next-a)
    (if (> next-a b)
          term-a
	        (accumulate-iter (combiner (term next-a) term-a) (next next-a))))
  (accumulate-iter a (next a)))
			 
(define (identity x) x)
(define (inc x) (+ x 1))
(accumulate + identity 0 inc 10) ;;55
(accumulate * identity 1 inc 6) ;;720
