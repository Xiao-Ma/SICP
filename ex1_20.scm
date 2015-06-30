;The process that a procedure generates is of course dependent on the rules
;used by the interpreter. As an example, consider the iterative gcd procedure
;given above. Suppose we were to interpret this procedure using normal-order
;evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule
;for if is described in exercise 1.5.) Using the substitution method (for 
;normal order), illustrate the process generated in evaluating (gcd 206 40) and
;indicate the remainder operations that are actually performed in the normal-
;order evaluation of (gcd 206 40)? In the applicative-order evaluation?

;****************Solution******************
;normal-order: 18 times
(gcd 206 40)
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;1
(if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0) 
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;1+2 = 3
(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;3+4 = 7
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))
;7 + 7 = 14
(if (= 0 0) ....)
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;14 + 4 = 18
2

;applicative-order: 4 times
(gcd 206 40)
(gcd 40 (remainder 206 40))
;1
(gcd 40 6)
(gcd 6 (remainder 40 6))
;1 + 1 = 2
(gcd 6 4)
(gcd 4 (remainder 6 4))
;2 + 1 = 3
(gcd 4 2)
(gcd 2 (remainder 4 2))
;3 + 1 = 4
(gcd 2 0)
2