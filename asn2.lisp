#|
Authors: David Ogunbanjo & Denis Moroz
Description: This file contains the answers to the ASN2 assignment questions.
Date: 3/10/2026
|#

;; Question 1

;; 1a: Read three numbers and return a list composed of those three numbers.

(let ((num1 (read)) (num2 (read)) (num3 (read)))
    (list num1 num2 num3)
)


;; 1b: 
#|Read two numbers and return a cons in the format (sum . product), or in other words, the first 
element of the cons is the sum of both numbers, and the second element of the cons is the product of 
both numbers |#

(let ((num1 (read)) (num2 (read)))
    (let ((sum (+ num1 num2)) (product (* num1 num2)))
        (cons sum product)
    )   
)

;; 1c: 

;; Question 2

;; Question 3

;; Question 4