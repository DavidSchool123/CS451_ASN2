#|
Authors: David Ogunbanjo & Denis Moroz
Description: This file contains the answers to the ASN2 assignment questions.
Date: 3/10/2026
|#

;; Question 1
#|
;; 1a: Read three numbers and return a list composed of those three numbers.

(let ((num1 (read)) (num2 (read)) (num3 (read))) ;; reads input
    (list num1 num2 num3)                        ;; return as list
)


;; 1b: 
#|Read two numbers and return a cons in the format (sum . product), or in other words, the first 
element of the cons is the sum of both numbers, and the second element of the cons is the product of 
both numbers |#

(let ((num1 (read)) (num2 (read)))                     ;; reads input
    (let ((sum (+ num1 num2)) (product (* num1 num2))) ;; perform operations
        (cons sum product)                             ;; returns cons in (sum . product) format
    )   
)
|#
;; 1c: 
#|Read one positive integer and return a list composed of all positive odd numbers less or equal to 
it (if the number is odd).   For example, if you read the value 8 or 7 the return should be (1 3 5 7) |#

(let ((*num* (read)) (oddList '()) (*dec* 1))  ;; read the number, make the empty list, and the decrement value
    (if (plusp *num*)   ;; check if it is positive
        (loop while (> *num* 0) do   ;; loop break condition
            (if (not (zerop (rem *num* 2)))    ;; if the number is odd, add to the list
                (push *num* oddList)
            ) 
            (setq *num* (- *num* (abs *dec*)))  ;; decrement num by 1
        )
    ) ;; update the value of num
    (print oddList)
    oddList
)


;; Question 2

;; Question 3

;; Question 4