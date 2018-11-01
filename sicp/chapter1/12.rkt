#lang racket/base

(require rackunit)

(define (solution row el)
  (cond ((or (= row 1) (>= el row) (= el 1)) 1)
        (else (+ (solution (- row 1) (- el 1))
                 (solution (- row 1) el)))))

(check-equal? (solution 5 2) 4)
(check-equal? (solution 5 3) 6)
