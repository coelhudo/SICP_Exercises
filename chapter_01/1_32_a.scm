;;(define (product term a next b)
;;  (if (> a b)
;;      1
;;      (* (term a) 
;;   (product term (next a) next b))))

;;(define (sum term a next b)
;;  (if (> a b)
;;      0
;;      (+ (term a)
;;	 (sum term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(accumulate + 0 identity 0 inc 10) ;;55
(accumulate * 1 identity 1 inc 5) ;;120
