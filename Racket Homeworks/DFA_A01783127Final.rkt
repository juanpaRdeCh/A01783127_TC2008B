;Created by Juan Pablo Ruiz de Chavez Diez de Urdanivia
; A01783127
; DFA Programming
; Program Finished on 4 / 26 / 2023

#lang racket

(define-struct dfa (func initial accept))

(define (char-operator? char)
  (member char '(#\+ #\- #\* #\/ #\= #\^))) ;Create the special symbol list in order to determine the states

(define (evaluate-dfa in-turn-DFA in-turn-string)
  (define char-list (string->list in-turn-string))
  (define-values (result tokens)
    (for/fold ([state (dfa-initial in-turn-DFA)] [tokens '()]) ;Create a loop in which the dfa's are going to be analyzed but also the string list and the list of states are going to be built
              ((char char-list))
      (begin
        (display char))
      (define-values (new-state found) ((dfa-func in-turn-DFA) state char))
      (values new-state (if found (cons found tokens) tokens))))
  (if (member result (dfa-accept in-turn-DFA))
      (reverse (cons result tokens))
      'invalid))

; DFA
(define (delta-arithmetic initial-state accept-states)
    " Transition function to validate the argument is a number
      Initial state: start
      Accept states: int float exp var space par_close"
    (cond 
        [(eq? initial-state 'start) (cond
            [(or (eq? accept-states #\+) (eq? accept-states #\-)) (values 'sign #f)]
            [(char-numeric? accept-states) (values 'int #f)]
            [(or (char-alphabetic? accept-states) (eq? accept-states #\_)) (values 'var #f)]
            [(eq? accept-states #\() (values 'par_open #f)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'sign) (cond
            [(char-numeric? accept-states) (values 'int #f)]
            [(eq? accept-states #\() (values 'par_open #f)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'int) (cond
            [(char-numeric? accept-states) (values 'int #f)]
            [(eq? accept-states #\.) (values 'dot #f)]
            [(or (eq? accept-states #\e) (eq? accept-states #\E)) (values 'e #f)]
            [(char-operator? accept-states) (values 'op 'int)]
            [(char=? accept-states #\space) (values 'space 'int)]
            [(eq? accept-states #\)) (values 'par_close 'int)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'dot) (cond
            [(char-numeric? accept-states) (values 'float #f)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'float) (cond
            [(char-numeric? accept-states) (values 'float #f)]
            [(or (eq? accept-states #\e) (eq? accept-states #\E)) (values 'e #f)]
            [(char=? accept-states #\space) (values 'space 'float)]
            [(char-operator? accept-states) (values 'op 'float)]
            [(eq? accept-states #\)) (values 'par_close 'float)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'e) (cond
            [(char-numeric? accept-states) (values 'exp #f)]
            [(or (eq? accept-states #\+) (eq? accept-states #\-)) (values 'e_sign #f)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'e_sign) (cond
            [(char-numeric? accept-states) (values 'exp #f)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'exp) (cond
            [(char-numeric? accept-states) (values 'exp #f)]
            [(char-operator? accept-states) (values 'op 'exp)]
            [(char=? accept-states #\space) (values 'space 'exp)]
            [(eq? accept-states #\)) (values 'par_close 'exp)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'var) (cond
            [(char-alphabetic? accept-states) (values 'var #f)]
            [(char-numeric? accept-states) (values 'var #f)]
            [(eq? accept-states #\_) (values 'var #f)]
            [(char-operator? accept-states) (values 'op 'var)]
            [(char=? accept-states #\space) (values 'space 'var)]
            [(eq? accept-states #\)) (values 'par_close 'var)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'op) (cond
            [(char-numeric? accept-states) (values 'int 'op)]
            [(or (eq? accept-states #\+) (eq? accept-states #\-)) (values 'sign 'op)]
            [(char-alphabetic? accept-states) (values 'var 'op)]
            [(eq? accept-states #\_) (values 'var 'op)]
            [(char=? accept-states #\space) (values 'space_op 'op)]
            [(eq? accept-states #\() (values 'par_open 'op)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'space) (cond
            [(char-operator? accept-states) (values 'op #f)]
            [(char=? accept-states #\space) (values 'space #f)]
            [(eq? accept-states #\() (values 'par_open #f)]
            [(eq? accept-states #\)) (values 'par_close #f)]
            [else (values 'inv #f)])]
            
        [(eq? initial-state 'space_op) (cond
            [(char-numeric? accept-states) (values 'int #f)]
            [(or (eq? accept-states #\+) (eq? accept-states #\-)) (values 'sign #f)]
            [(char-alphabetic? accept-states) (values 'var #f)]
            [(eq? accept-states #\_) (values 'var #f)]
            [(eq? accept-states #\space) (values 'space_op #f)]
            [(eq? accept-states #\() (values 'par_open #f)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'par_open) (cond
            [(eq? accept-states #\() (values 'par_open 'par_open)]
            [(or (eq? accept-states #\+) (eq? accept-states #\-)) (values 'sign 'par_open)]
            [(char-numeric? accept-states) (values 'int 'par_open)]
            [(char-alphabetic? accept-states) (values 'var 'par_open)]
            [(eq? accept-states #\_) (values 'var 'par_open)]
            [(char=? accept-states #\space) (values 'space 'par_open)]
            [(eq? accept-states #\)) (values 'par_close 'par_open)]
            [else (values 'inv #f)])]

        [(eq? initial-state 'par_close) (cond
            [(eq? accept-states #\)) (values 'par_close 'par_close)]
            [(char-numeric? accept-states) (values 'int 'par_close)]
            [(char-alphabetic? accept-states) (values 'var 'par_close)]
            [(eq? accept-states #\_) (values 'var 'par_close)]
            [(char-operator? accept-states) (values 'op 'par_close)]
            [(char=? accept-states #\space) (values 'space 'par_close)]
            [else (values 'inv #f)])]

        [else (values 'inv #f)]))

(define (arithmetic-lexer string-to-evaluate)
    (evaluate-dfa (dfa delta-arithmetic 'start '(int float exp var space par_close)) string-to-evaluate))