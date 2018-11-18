#lang racket/base

(require rackunit)

(define (even? n)
    (= (remainder n 2) 0))

(define (square x) (* x x))

; recursion version (from the sicp-book):
(define (fast-expt b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(check-equal? (fast-expt 2 4) 16)
(check-equal? (fast-expt 2 5) 32)

; iterative process version:
(define (expt b n)
    (expt-iter b n 1))

(define (expt-iter b n a)
        (cond ((= n 0) a)
              ((even? n) (expt-iter (square b) (/ n 2) a))
              (else (expt-iter b (- n 1) (* b a)))))

(check-equal? (expt 2 4) 16)
(check-equal? (expt 2 5) 32)
