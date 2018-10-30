#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (good-enough? guess new-guess)
(< (abs (- guess new-guess)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(define (improve x y)
  (/ (+ (/ x (* y y))
        (* 2 y))
      3))

(define (sqrt-iter guess x)
  (define new-guess (improve x guess))
  (if (good-enough? guess new-guess)
    guess
    (sqrt-iter (improve x guess) x)))

(define (cubert x)
  (sqrt-iter 1.0 x))

(cubert 64)