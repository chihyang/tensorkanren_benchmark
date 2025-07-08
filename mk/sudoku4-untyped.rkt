#lang racket
(require "mk.rkt")

(define-syntax disj
  (syntax-rules ()
    ((disj g ...)
     (conde (g) ...))))

(define-syntax conj
  (syntax-rules ()
    ((conj g ...)
     (conde (g ...)))))

(defrel (n4 o256556) (disj (== o256556 '0) (== o256556 '1) (== o256556 '2) (== o256556 '3)))

(defrel (diffo n o)
  (n4 n) (n4 o)
  (=/= n o))

(defrel (valid_4x4 a b c d) (conj (diffo a b) (diffo a c) (diffo a d) (diffo b c) (diffo b d) (diffo c d)))

(defrel
  (sudoku_4x4 a b c d e f g h i j k l m n o p)
  (conj
   (valid_4x4 a b c d)
   (valid_4x4 a b e f)
   (valid_4x4 a e i m)
   (valid_4x4 i j m n)
   (valid_4x4 i j k l)
   (valid_4x4 k l o p)
   (valid_4x4 m n o p)
   (valid_4x4 b f j n)
   (valid_4x4 e f g h)
   (valid_4x4 c d g h)
   (valid_4x4 d h l p)
   (valid_4x4 c g k o)))

(run 1 (r12 r14 r21 r22 r23 r24 r31 r32 r33 r34 r41 r43)
  (sudoku_4x4 3 r12 0 r14 r21 r22 r23 r24 r31 r32 r33 r34 r41 0 r43 2)
