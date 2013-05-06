(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (or (and (> g 0) (< d 0)) (and (< g 0) (> d 0)))
	(cons (/ n (* g -1)) (/ d (* g -1)))
	(cons (/ n g) (/ d g)))))

(print-rat (make-rat 10 20))
(print-rat (make-rat -10 20))
(print-rat (make-rat -10 -20))
(print-rat (make-rat 10 -20))
