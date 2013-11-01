(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

;first representation - bottom-left top-right corners
(define (make-rectangle bottom-left top-right)
  (cons bottom-left top-right))

(define (width rectangle)
  (- (x-point (cdr rectangle)) (x-point (car rectangle))))

(define (height rectangle)
  (- (y-point (cdr rectangle)) (y-point (car rectangle))))

(define (rectangle-sample)
  (make-rectangle (make-point 0 0) (make-point 5 2)))

;second representation - width height
(define (make-rectangle width height)
  (cons width height))

(define (width rectangle)
  (- (x-point (end-segment (car rectangle))) (x-point (start-segment (car rectangle)))))

(define (height rectangle)
  (- (y-point (end-segment (cdr rectangle))) (y-point (start-segment (cdr rectangle)))))

(define (rectangle-sample)
  (make-rectangle (make-segment (make-point 0 0) (make-point 5 0))
		  (make-segment (make-point 5 0) (make-point 5 2))))

(display (width (rectangle-sample)))
(display (height (rectangle-sample)))

(define (area rectangle)
  (* (width rectangle) (height rectangle)))

(define (perimeter rectangle)
  (* (+ (width rectangle) (height rectangle)) 2))

(display (area (rectangle-sample)))
(display (perimeter (rectangle-sample)))
