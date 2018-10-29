#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (good-enough? guess new-guess)
(< (abs (- guess new-guess)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(define (improve guess x)
(average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define (sqrt-iter guess x)
  (define new-guess (improve guess x))
  (if (good-enough? guess new-guess)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 1000000000000000)