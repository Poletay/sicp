#lang racket/base

(require rackunit)

(define (even? n)
    (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (* a b)
    (cond ((or (= a 0) (= b 0)) 0)
          ((= b 1) a)
          ((even? b) (* (double a) (halve b)))
          (else (+ a (* a (- b 1))))))

(check-equal? (* 2 4) 8)
(check-equal? (* 3 5) 15)
