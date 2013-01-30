(define (cont-frac f-n f-d k)
  (cont-frac-iter f-n f-d k 0))

(define (cont-frac-iter f-n f-d k count)
  (let ((fk (f-n count))
        (dk (f-d count)))
    (if (= count k)
	(/ fk dk)
	(/ fk (+ dk (cont-frac-iter f-n f-d k (+ count 1)))))))

;; output to find approximation with 4 decimal places
(define (loop)
  (define (loop-iter count max)
    (newline)
    (display (cont-frac (lambda (i) 1.)
			(lambda (i) 1.)
			count))
    (if (not (= count max))
	(loop-iter (+ count 1) max)))
  (loop-iter 0 13))
	
(loop)
;;1.
;;.5
;;.6666666666666666
;;.6000000000000001
;;.625
;;.6153846153846154
;;.6190476190476191
;;.6176470588235294
;;.6181818181818182
;;.6179775280898876
;;.6180555555555556
;;.6180257510729613
;;.6180371352785146
;;.6180327868852459 <- 13 iteration
