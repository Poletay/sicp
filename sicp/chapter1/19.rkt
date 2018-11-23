#lang racket/base

(require rackunit)

; 1) Show
; that if we apply such a transformation T pq twice, the effect
; is the same as using a single transformation T p ′ q ′ of the
; same form, and compute p ′ and q ′ in terms of p and q

; T(a, b) <- (a + b, a)
; Tpq(a, b) <- (bq + aq + ap, bp + aq)
; Tpq(Tpq(a,b)) <- Tpq(bq + aq + ap, bp + aq)

; So the expression "bq + aq + ap" now is "a" and "bp + aq" is "b" for next Tpq()

; Combine our expresstions to get something like (bq + aq + ap, bp + aq):
; Tpq(bq + aq + ap, bp + aq) <- ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q)
; Tpq(bq + aq + ap, bp + aq) <- (bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2, bp^2 + apq + bq^2 + aq^2 + apq)
; Tpq(bq + aq + ap, bp + aq) <- (b(2pq + q^2) + a(2pq + q^2) + a(q^2 + p^2), b(q^2 + p^2) + a(2pq + q^2))

; Now we can write this expression like this:
; Tpq(Tpq(a, b)) = (bq' + aq' + ap', bp' + aq')

; Where are
; p' =  q^2 + p^2
; q' = 2pq + q^2

; Done

; Use this decision to complete the procedure:

(define (square x) (* x x))

(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (square q) (square p)); compute p ′
                     (+ (* 2 p q) (square q)); compute q ′
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))

(check-equal? (fib 0) 0)
(check-equal? (fib 1) 1)
(check-equal? (fib 3) 2)
(check-equal? (fib 8) 21)
