#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(define (improve guess x)
(average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define counter 0)

;new-if is not suitable for this case because 
;new-if is a function that try to calculate it's argument
;(sqrt-iter (improve guess x) x)
;and we get the error - endless cycle.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
