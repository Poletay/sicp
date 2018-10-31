#lang racket/base

(require rackunit)

; f (n) = n, if n < 3
; f (n) = f (n − 1) + f (n − 2) + f (n − 3), if n ≥ 3

(define (solution_rec n)
  (cond ((< n 3) n)
        (else (+ (solution_rec (- n 1))
                  (solution_rec (- n 2))
                  (solution_rec (- n 3))))))


; a <- a + b + c
; b <- a
; c <- b

(define (solution_iter n)
  (define (iter a b c count)
    (if (= count 0)
      c
      (iter (+ a b c) a b (- count 1))))
  (iter 2 1 0 n))


(check-equal? (solution_rec 0) (solution_iter 0))
(check-equal? (solution_rec 1) (solution_iter 1))
(check-equal? (solution_rec 2) (solution_iter 2))
(check-equal? (solution_rec 3) (solution_iter 3))
(check-equal? (solution_rec 4) (solution_iter 4))
(check-equal? (solution_rec 5) (solution_iter 5))
