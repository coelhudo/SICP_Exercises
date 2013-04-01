(define (cont-frac f-n f-d k)
  (cont-frac-iter f-n f-d k 0))

(define (cont-frac-iter f-n f-d k count)
  (let ((fk (f-n count))
        (dk (f-d count)))
    (if (= count k)
        (/ fk dk)
      	(/ fk (+ dk (cont-frac-iter f-n f-d k (+ count 1)))))))

(define (square x)
  (* x x))

(define (tan x k)
  (* -1 (/ (cont-frac (lambda (i) (* -1 (square x)))
		                  (lambda (i) (+ 1 (* i 2)))
		                 k) x)))

(tan 60. 10001) ;.3200403893795631
