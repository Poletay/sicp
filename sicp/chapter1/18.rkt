#lang racket/base

(require rackunit)

(define (even? n)
    (= (remainder n 2) 0))
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
    (*-iter a b 0))

(define (*-iter a b acc)
        (cond ((or (= a 0) (= b 0)) acc)
              ((< b 0) (- (*-iter a (- b) acc)))
              ((even? b) (*-iter (double a) (halve b) acc))
              (else (*-iter a (- b 1) (+ a acc)))))

(check-equal? (* 2 3) 6)
(check-equal? (* -2 4) -8)
(check-equal? (* 3 5) 15)
(check-equal? (* 4 -6) -24)
(check-equal? (* -4 -6) 24)