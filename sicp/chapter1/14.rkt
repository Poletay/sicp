#lang racket/base

(require rackunit)

; Draw the tree illustrating the process gen-
; erated by the count-change procedure of Section 1.2.2 in
; making change for 11 cents. What are the orders of growth
; of the space and number of steps used by this process as
; the amount to be changed increases?

; Look at 14.ods in the current folder

; (count-change 11) result: 4
;   (cc 11 5) result: 4
;     (cc -39 5) result: 0
;     (cc 11 4) result: 4
;       (cc -14 4) result: 0
;       (cc 11 3) result: 4
;           (cc 1 3) result: 1
;               (cc -9 3) result: 0
;               (cc 1 2) result: 1
;                   (cc -4 2) result: 0
;                   (cc 1 1) result: 1
;                       (cc 0 1) result: 1
;                       (cc 1 0) result: 0
;           (cc 11 2) result: 3
;               (cc 6 2) result: 2
;                   (cc 1 2) result: 1
;                       (cc -4 2) result: 0
;                       (cc 1 1) result: 1
;                           (cc 0 1) result: 1
;                           (cc 1 0) result: 0
;                   (cc 6 1) result: 1
;                       (cc 5 1) result: 1
;                            (cc 4 1) result: 1
;                               (cc 3 1) result: 1
;                                   (cc 2 1) result: 1
;                                       (cc 1 1) result: 1
;                                           (cc 0 1) result: 1
;                                           (cc 1 0) result: 0
;                                       (cc 2 0) result: 0
;                                   (cc 3 0) result: 0
;                               (cc 4 0) result: 0
;                             (cc 5 0) result: 0
;                        (cc 6 0) result: 0
;               (cc 11 1) result: 1
;                   (cc 10 1) result 1
;                       (cc 9 1) result: 1
;                           (cc 8 1) result: 1
;                               (cc 7 1) result: 1
;                                   (cc 6 1) result: 1
;                                       (cc 5 1) result: 1
;                                           (cc 4 1) result: 1
;                                               (cc 3 1) result: 1
;                                                   (cc 2 1) result: 1
;                                                       (cc 1 1) result: 1
;                                                           (cc 0 1) result: 1
;                                                           (cc 1 0) result: 0
;                                                       (cc 2 0) result: 0
;                                                   (cc 3 0) result: 0
;                                               (cc 4 0) resutlt: 0
;                                           (cc 5 0) result: 0
;                                       (cc 6 0) result: 0
;                                   (cc 7 0) result: 0
;                               (cc 8 0) result: 0
;                           (cc 9 0) result: 0
;                       (cc 10 0) result: 0
;                   (cc 11 0) result 0

; We have to handle "amount" number ot times equal number of coins types
; So. We have number of coins - 5;
; So. There are the orders of growth of the space and number of steps is Theta(n^5)
; 

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
      ((or (< amount 0) (= kinds-of-coins 0)) 0)
      (else (+ (cc amount
                  (- kinds-of-coins 1))
               (cc (- amount
                  (first-denomination kinds-of-coins))
                   kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
    ((= kinds-of-coins 2) 5)
    ((= kinds-of-coins 3) 10)
    ((= kinds-of-coins 4) 25)
    ((= kinds-of-coins 5) 50)))

(check-equal? (count-change 11) 4)
(check-equal? (count-change 100) 292)
