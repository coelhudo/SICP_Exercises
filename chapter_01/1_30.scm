(define (inc a) 
  (+ a 1))

(define (cube x) (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (= a b)
  result
	(iter (next a) (+ (term (next a)) result))))
  (iter a (term a)))

(sum cube 0 inc 10)
