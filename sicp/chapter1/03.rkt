#lang racket/base

(require rackunit)

(define (square x) (* x x))
(define (sum-of-squares a b)
  (+ (square a) (square b)))
(define (sum-squares-of-two-max a b c)
  (cond ((and (>= a c) (>= b c)) (sum-of-squares a b))
        ((and (>= a b) (>= c b)) (sum-of-squares a c))
        ((and (>= b a) (>= c a)) (sum-of-squares b c))))

(check-equal? (sum-squares-of-two-max 6 4 3) 52)
