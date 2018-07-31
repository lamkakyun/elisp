;; 跑到行尾，执行C-x C-e 运行当前行
;;print a message
(message "hi")


;; printing variable values
(message "Her age is: %d" 16)
(message "Her name is: %s" "Vicky")
(message "My list is: %S" (list 8 2 3))


;;;;;;;;;;;Arithmetic ;;;;;;;;;;
(+ 4 5 1)  ; 10
(- 9 2)    ; 7
(- 9 2 3)  ; 4
(* 2 3)    ; 6
(* 2 3 2)  ; 12
(/ 7 2)    ; 3
(/ 7 2.0)  ; 3.5
(% 7 4)    ; 3
;; power; exponential
(expt 2 3) ; 8
;; 3. is a integer, 3.0 is a float
(integerp 3.) ;  true
(floatp 3.) ;  nil
(floatp 3.0) ;  true


;;;;;;;;;; Convert Float/Integer ;;;;;;;;;;
;; int to float
(float 3) ; 3.0
(truncate 3.3) ; 3
(floor 3.3) ; 3
(ceiling 3.3) ; 4
(round 3.4) ; 3
(string-to-number "3")
(number-to-string 3)


;;;;;;;;;; True, False ;;;;;;;;;;
(if nil "yes" "no") ;  "no"
(if () "yes" "no") ;  "no"
(if '() "yes" "no") ;  "no"
(if (list) "yes" "no") ;  "no", because (list) eval to a empty list, same as ()
(if t "yes" "no") ;  "yes"
(if 0 "yes" "no") ;  "yes"
(if "" "yes" "no") ;  "yes"
(if [] "yes" "no") ;  "yes". The [] is vector of 0 elements


;;;;;;;;;; Boolean Functions ;;;;;;;;;;
(and t nil) ;  nil
(or t nil) ;  t
(and t nil t t t t) ;  nil
(< 3 4) ; less than
(> 3 4) ; greater than
(<= 3 4) ; less or equal to
(>= 3 4) ; greater or equal to0
(= 3 3)   ;  t
(= 3 3.00000000000000001) ;  t
(/= 3 4) ; not equal. ⇒ t
(equal "abc" "abc") ;  t
(string-equal "abc" "abc") ;  t
(string-equal "abc" "Abc") ;  nil. Case matters
(string-equal "abc" 'abc) ;  t
(equal 3 3) ;  t
(equal 3.0 3.0) ;  t
(equal 3 3.0) ;  nil. Because datatype doesn't match.
(equal '(3 4 5) '(3 4 5))  ;  t
(equal '(3 4 5) '(3 4 "5")) ;  nil
(equal "e" "e") ;  t
(equal 'abc 'abc) ;  t
(not (= 3 4)) ;  t
(/= 3 4)
(not (equal 3 4))

(= (% n 2) 0) ; test even
(= (% n 2) 1) ; test odd

