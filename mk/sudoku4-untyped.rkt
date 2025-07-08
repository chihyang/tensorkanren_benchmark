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

(defrel (n4 o46646) (disj (== o46646 '0) (== o46646 '1) (== o46646 '2) (== o46646 '3)))

(defrel (diffo n o)
  (n4 n) (n4 o)
  (=/= n o))

(defrel (valid_4x4 a b c d)
  (conj
   (diffo a b)
   (diffo a c)
   (diffo a d)
   (diffo b c)
   (diffo b d)
   (diffo c d)))

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

(run 1 (a b c d e f g h i j k l m n o p) (sudoku_4x4 3 b 0 d e f g h i j k l m 0 o 2))
