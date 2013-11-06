(define (make-interval a b)
  (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x (make-interval
		   (/ 1 (lower-bound y))
		   (/ 1 (upper-bound y)))))

(lower-bound (add-interval (make-interval 1 2)
			   (make-interval 3 6))) ; 4

(upper-bound (add-interval (make-interval 1 2)
			   (make-interval 3 6))) ; 8

(lower-bound (mul-interval (make-interval 4 3)
			   (make-interval 4 7))) ; 12

(upper-bound (mul-interval (make-interval 4 3)
			   (make-interval 4 7))) ; 28

(lower-bound (div-interval (make-interval 4 21)
			   (make-interval 4 8))) ; 1/2

(upper-bound (div-interval (make-interval 4 21)
			   (make-interval 4 8))) ; 21/4
