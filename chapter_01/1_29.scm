(define (cube x) (* x x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (succ x)
  (+ x 1))

(define (h-function a b n) (/ (- b a) n))
(define (y-function f a k h-result) (f (+ a (* k h-result))))

(define (simpson-func mult f a max count h-result)
  (+ (* mult (y-function f a count h-result)) (simpson-iter f a max h-result (succ count))))

(define (simpson-iter f a max h-result count)
  (cond ((= count max) (y-function f a count h-result))
        ((= count 0) (simpson-func 1 f a max count h-result))
	((even? count) (simpson-func 2 f a max  count h-result))
	(else (simpson-func 4 f a max count h-result))))

(define (simpson f a max h-result )
  (simpson-iter f a max h-result 0))

(define (integral-func f a n h-result)
  (* ( / h-result 3 )
     (simpson f a n h-result)))

(define (integral f a b n)
  (integral-func f a n (h-function a b n)))

(integral cube 0 1 100)
