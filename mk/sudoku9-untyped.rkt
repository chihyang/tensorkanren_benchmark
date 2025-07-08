#lang racket
(require "mk.rkt")

(define-syntax disj
  (syntax-rules ()
    ((disj g ...)
     (conde (g) ...))))

(defrel (n9 o55972)
  (disj
   (== o55972 '0)
   (== o55972 '1)
   (== o55972 '2)
   (== o55972 '3)
   (== o55972 '4)
   (== o55972 '5)
   (== o55972 '6)
   (== o55972 '7)
   (== o55972 '8)))

(defrel (diffo n o)
  (n9 n)
  (n9 o)
  (=/= n o))

(defrel
  (valid_9x9 r1 r2 r3 r4 r5 r6 r7 r8 r9)
  (diffo r1 r2)
  (diffo r1 r3)
  (diffo r1 r4)
  (diffo r1 r5)
  (diffo r1 r6)
  (diffo r1 r7)
  (diffo r1 r8)
  (diffo r1 r9)
  (diffo r2 r3)
  (diffo r2 r4)
  (diffo r2 r5)
  (diffo r2 r6)
  (diffo r2 r7)
  (diffo r2 r8)
  (diffo r2 r9)
  (diffo r3 r4)
  (diffo r3 r5)
  (diffo r3 r6)
  (diffo r3 r7)
  (diffo r3 r8)
  (diffo r3 r9)
  (diffo r4 r5)
  (diffo r4 r6)
  (diffo r4 r7)
  (diffo r4 r8)
  (diffo r4 r9)
  (diffo r5 r6)
  (diffo r5 r7)
  (diffo r5 r8)
  (diffo r5 r9)
  (diffo r6 r7)
  (diffo r6 r8)
  (diffo r6 r9)
  (diffo r7 r8)
  (diffo r7 r9)
  (diffo r8 r9))

(defrel
  (sudoku_9x9
   r11
   r12
   r13
   r14
   r15
   r16
   r17
   r18
   r19
   r21
   r22
   r23
   r24
   r25
   r26
   r27
   r28
   r29
   r31
   r32
   r33
   r34
   r35
   r36
   r37
   r38
   r39
   r41
   r42
   r43
   r44
   r45
   r46
   r47
   r48
   r49
   r51
   r52
   r53
   r54
   r55
   r56
   r57
   r58
   r59
   r61
   r62
   r63
   r64
   r65
   r66
   r67
   r68
   r69
   r71
   r72
   r73
   r74
   r75
   r76
   r77
   r78
   r79
   r81
   r82
   r83
   r84
   r85
   r86
   r87
   r88
   r89
   r91
   r92
   r93
   r94
   r95
   r96
   r97
   r98
   r99)
  (valid_9x9 r11 r12 r13 r14 r15 r16 r17 r18 r19)
  (valid_9x9 r11 r21 r31 r41 r51 r61 r71 r81 r91)
  (valid_9x9 r11 r21 r31 r12 r22 r32 r13 r23 r33)
  (valid_9x9 r21 r22 r23 r24 r25 r26 r27 r28 r29)
  (valid_9x9 r12 r22 r32 r42 r52 r62 r72 r82 r92)
  (valid_9x9 r14 r15 r16 r24 r25 r26 r34 r35 r36)
  (valid_9x9 r31 r32 r33 r34 r35 r36 r37 r38 r39)
  (valid_9x9 r13 r23 r33 r43 r53 r63 r73 r83 r93)
  (valid_9x9 r17 r18 r19 r27 r28 r29 r37 r38 r39)
  (valid_9x9 r41 r42 r43 r44 r45 r46 r47 r48 r49)
  (valid_9x9 r14 r24 r34 r44 r54 r64 r74 r84 r94)
  (valid_9x9 r41 r42 r43 r51 r52 r53 r61 r62 r63)
  (valid_9x9 r51 r52 r53 r54 r55 r56 r57 r58 r59)
  (valid_9x9 r15 r25 r35 r45 r55 r65 r75 r85 r95)
  (valid_9x9 r44 r45 r46 r54 r55 r56 r64 r65 r66)
  (valid_9x9 r61 r62 r63 r64 r65 r66 r67 r68 r69)
  (valid_9x9 r16 r26 r36 r46 r56 r66 r76 r86 r96)
  (valid_9x9 r47 r48 r49 r57 r58 r59 r67 r68 r69)
  (valid_9x9 r71 r72 r73 r74 r75 r76 r77 r78 r79)
  (valid_9x9 r17 r27 r37 r47 r57 r67 r77 r87 r97)
  (valid_9x9 r71 r72 r73 r81 r82 r83 r91 r92 r93)
  (valid_9x9 r81 r82 r83 r84 r85 r86 r87 r88 r89)
  (valid_9x9 r18 r28 r38 r48 r58 r68 r78 r88 r98)
  (valid_9x9 r74 r75 r76 r84 r85 r86 r94 r95 r96)
  (valid_9x9 r91 r92 r93 r94 r95 r96 r97 r98 r99)
  (valid_9x9 r19 r29 r39 r49 r59 r69 r79 r89 r99)
  (valid_9x9 r77 r78 r79 r87 r88 r89 r97 r98 r99))

(run
 1
 (r11
  r12
  r13
  r16
  r17
  r19
  r22
  r23
  r25
  r26
  r27
  r28
  r29
  r31
  r33
  r34
  r35
  r38
  r39
  r41
  r42
  r44
  r46
  r47
  r52
  r53
  r55
  r57
  r58
  r63
  r64
  r66
  r68
  r69
  r71
  r72
  r75
  r76
  r77
  r79
  r82
  r83
  r84
  r85
  r87
  r88
  r91
  r92
  r93
  r94
  r97
  r98
  r99)
 (sudoku_9x9
  r11
  r12
  r13
  8
  0
  r16
  r17
  5
  r19
  3
  r22
  r23
  2
  r25
  r26
  r27
  r28
  r29
  r31
  4
  r33
  r34
  r35
  6
  0
  r38
  r39
  r41
  r42
  3
  r44
  7
  r46
  r47
  8
  4
  4
  r52
  r53
  1
  r55
  3
  r57
  r58
  7
  7
  1
  r63
  r64
  8
  r66
  5
  r68
  r69
  r71
  r72
  0
  4
  r75
  r76
  r77
  1
  r79
  8
  r82
  r83
  r84
  r85
  0
  r87
  r88
  5
  r91
  r92
  r93
  r94
  5
  1
  r97
  r98
  r99))
