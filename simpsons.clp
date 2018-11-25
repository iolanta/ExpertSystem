(deftemplate fact
	(slot id)
	(slot name)
)
 
(deftemplate terminal_fact
	(slot id)
	(slot name)
)

;r1 : f17, f19 : s7
(defrule r1
	(declare (salience 500))
	(fact (id f17)) 
	(fact (id f21))
	=>
	(assert (fact (id s7) (name "Работает.")))
)
;r2 : f9 : s6
(defrule r2
	(declare (salience 500))
	(fact (id f9))
	=>
	(assert (fact (id s6) (name "Тупой.")))
)
;r3 : f10 : s8
(defrule r3
	(declare (salience 500))
	(fact (id f10))
	=>
	(assert (fact (id s8) (name "Влюблённый.")))
)
;r4 : f11, f12 : s1
(defrule r4
	(declare (salience 500))
	(fact (id f11)) 
	(fact (id f12))
	=>
	(assert (fact (id s1) (name "Любит покушать.")))
)
;r5 : f8 : s10   
(defrule r5
	(declare (salience 500))
	(fact (id f8))
	=>
	(assert (fact (id s10) (name "Родитель.")))
)
;r6 : f6, f21 : s9
(defrule r6
	(declare (salience 500))
	(fact (id f6)) 
	(fact (id f19))
	=>
	(assert (fact (id s9) (name "Неудачник.")))
)
;r7 : f12 : s12
(defrule r7
	(declare (salience 500))
	(fact (id f12)) 
	=>
	(assert (fact (id s12) (name "Имеет вредные привычки.")))
)
;r8 : f6, s12 : s13
(defrule r8
	(declare (salience 500))
	(fact (id f6)) 
	(fact (id s12))
	=>
	(assert (fact (id s13) (name "Любит выпить.")))
)
;r9 : s1, s7, s10, s13: t1
(defrule r9
	(declare (salience 500))
	(fact (id s1)) 
	(fact (id s7))
	(fact (id s10))
	(fact (id s13))
	=>
	(assert (terminal_fact (id t1) (name "Гомер Симпсон")))
)
;r10 : f6, f13 : s14, s9
(defrule r10
	(declare (salience 500))
	(fact (id f6)) 
	(fact (id f13))
	=>
	(assert (fact (id s14) (name "Доверчив.")))
	(assert (fact (id s9) (name "Неудачник.")))
)
;r11 : s14, s9 : s15
(defrule r11
	(declare (salience 500))
	(fact (id s14)) 
	(fact (id s9))
	=>
	(assert (fact (id s15) (name "Попадает под влияние других людей.")))
)
;r12 : f12, f16 : s16
(defrule r12
	(declare (salience 500))
	(fact (id f12)) 
	(fact (id f16))
	=>
	(assert (fact (id s16) (name "Плохое зрение.")))
)
;r13 : f15, f17 : s17
(defrule r13
	(declare (salience 500))
	(fact (id f15)) 
	(fact (id f17))
	=>
	(assert (fact (id s17) (name "Школьник.")))
)
;r14 : s15, s16, s17 : t8
(defrule r14
	(declare (salience 500))
	(fact (id s15)) 
	(fact (id s16))
	(fact (id s17))
	=>
	(assert (terminal_fact (id t8) (name "Милхаус Ван Хутен")))
)
;r15 : f7, f11 : s2
(defrule r15
	(declare (salience 500))
	(fact (id f7)) 
	(fact (id f11))
	=>
	(assert (fact (id s2) (name "Хорошо готовит.")))
)
;r16 : f18, f19, s2 : s18
(defrule r16
	(declare (salience 500))
	(fact (id s2))
	(fact (id f20))
	(fact (id f21))
	=>
	(assert (fact (id s18) (name "Домохозяйка.")))
)
;r17 : s2, s8, s10, s18 : t2
(defrule r17
	(declare (salience 500))
	(fact (id s2)) 
	(fact (id s8))
	(fact (id s10))
	(fact (id s18))
	=>
	(assert (terminal_fact (id t2) (name "Мардж Симпсон")))
)
;r18 : f4, s12 : s19
(defrule r18
	(declare (salience 500))
	(fact (id f4)) 
	(fact (id s12))
	=>
	(assert (fact (id s19) (name "Курит.")))
)
;r19 : f4, f14 : s3
(defrule r19
	(declare (salience 500))
	(fact (id f4)) 
	(fact (id f14))
	=>
	(assert (fact (id s3) (name "Задира.")))
)
;r20 : s3, s7, s19 : t7
(defrule r20
	(declare (salience 500))
	(fact (id s3)) 
	(fact (id s7))
	(fact (id s19))
	=>
	(assert (terminal_fact (id t7) (name "Пэтти Бувье")))
)
;r21 : f14, f6 : s3
(defrule r21
	(declare (salience 500))
	(fact (id f14)) 
	(fact (id f6))
	=>
	(assert (fact (id s3) (name "Задира.")))
)
;r22 : s3, s8, s17 : t3
(defrule r22
	(declare (salience 500))
	(fact (id s3)) 
	(fact (id s8))
	(fact (id s17))
	=>
	(assert (terminal_fact (id t3) (name "Барт Симпсон")))
)
;r23 : f2, s3, s17 : t9
(defrule r23
	(declare (salience 500))
	(fact (id f2)) 
	(fact (id s3))
	(fact (id s17))
	=>
	(assert (terminal_fact (id t9) (name "Нельсон Манц")))
)
;r24 : f2, s8 : s20
(defrule r24
	(declare (salience 500))
	(fact (id f2)) 
	(fact (id s8))
	=>
	(assert (fact (id s20) (name "Слаборазвитый.")))
)
;r25 : f18, f19 : s21
(defrule r25
	(declare (salience 500))
	(fact (id f20))
	(fact (id f21))
	=>
	(assert (fact (id s21) (name "Старик.")))
)
;r26 : f12, s21 : s16
(defrule r26
	(declare (salience 500))
	(fact (id f12))
	(fact (id s21))
	=>
	(assert (fact (id s16) (name "Плохое зрение.")))
)
;r27 : s10, s16, s21 : t6
(defrule r27
	(declare (salience 500))
	(fact (id s10))
	(fact (id s16))
	(fact (id s21))
	=>
	(assert (terminal_fact (id t6) (name "Абрахам Симпсон")))
)
;r28 : f1, f20, s7 : s22
(defrule r28
	(declare (salience 500))
	(fact (id f1))
	(fact (id f18))
	(fact (id s7))
	=>
	(assert (fact (id s22) (name "Богатый.")))
)
;r29 : f2, s10 : s23
(defrule r29
	(declare (salience 500))
	(fact (id f2))
	(fact (id s10))
	=>
	(assert (fact (id s23) (name "Плохой родитель.")))
)
;r30 : s3, s23, s22 : t10
(defrule r30
	(declare (salience 500))
	(fact (id s3))
	(fact (id s23))
	(fact (id s22))
	=>
	(assert (terminal_fact (id t10) (name "Чарльз Монтгомери Бёрнс")))
)
;r31 : f16, s17 : s4
(defrule r31
	(declare (salience 500))
	(fact (id f16))
	(fact (id s17))
	=>
	(assert (fact (id s4) (name "Любит учиться.")))
)
;r32 : f20, s4 : s11
(defrule r32
	(declare (salience 500))
	(fact (id f18))
	(fact (id s4))
	=>
	(assert (fact (id s11) (name "Отличница.")))
)
;r33 : f3, f7, s8, s11 : t4
(defrule r33
	(declare (salience 500))
	(fact (id f3))
	(fact (id f7))
	(fact (id s8))
	(fact (id s11))
	=>
	(assert (terminal_fact (id t4) (name "Лиза Симпсон")))
)
;r34 : f15, f18 : s20
(defrule r34
	(declare (salience 500))
	(fact (id f15))
	(fact (id f20))
	=>
	(assert (fact (id s20) (name "Слаборазвитый.")))
)
;r35 : f9, f13 : s15
(defrule r35
	(declare (salience 500))
	(fact (id f9))
	(fact (id f13))
	=>
	(assert (fact (id s15) (name "Попадает под влияние других людей.")))
)
;r36 : f18, s15, s20 : t5
(defrule r36
	(declare (salience 500))
	(fact (id f20))
	(fact (id s15))
	(fact (id s20))
	=>
	(assert (terminal_fact (id t5) (name "Мэгги Симпсон")))
)
;r37 : f13 : s14
(defrule r37
	(declare (salience 500))
	(fact (id f13))
	=>
	(assert (fact (id s14) (name "Доверчив.")))
)
;r38 : f5, f20 : s5
(defrule r38
	(declare (salience 500))
	(fact (id f5))
	(fact (id f18))
	=>
	(assert (fact (id s5) (name "Живёт по правилам.")))
)
;r39 : f3, s5, s14 : s24
(defrule r39
	(declare (salience 500))
	(fact (id f3))
	(fact (id s5))
	(fact (id s14))
	=>
	(assert (fact (id s24) (name "Религиозный.")))
)
;r40 : s8, s10, s24 : t11
(defrule r40
	(declare (salience 500))
	(fact (id s8))
	(fact (id s10))
	(fact (id s24))
	=>
	(assert (terminal_fact (id t11) (name "Нед Фландерс")))
)
;r41 : s3, s13, s22 : t12
(defrule r41
	(declare (salience 500))
	(fact (id s3))
	(fact (id s13))
	(fact (id s22))
	=>
	(assert (terminal_fact (id t12) (name "Клоун Красти")))
)
;r42 : f20, s7 : s5
(defrule r42
	(declare (salience 500))
	(fact (id f18))
	(fact (id s7))
	=>
	(assert (fact (id s5) (name "Живёт по правилам.")))
)
;r43 : f3, s5, s9 : t13 
(defrule r43
	(declare (salience 500))
	(fact (id f3))
	(fact (id s5))
	(fact (id s9))
	=>
	(assert (terminal_fact (id t13) (name "Сеймур Скиннер")))
)
;r44 : s6, s15 : s20
(defrule r44
	(declare (salience 500))
	(fact (id s6))
	(fact (id s15))
	=>
	(assert (fact (id s20) (name "Слаборазвитый.")))
)
;r45 : f21, s15, s17, s20 : t14
(defrule r45
	(declare (salience 500))
	(fact (id f19))
	(fact (id s15))
	(fact (id s17))
	(fact (id s20))
	=>
	(assert (terminal_fact (id t14) (name "Ральф Виггам")))
)

(defrule isLess18
	(declare (salience 50))
	?answ  <- (answer-user (question "Возраст меньше 18 лет?") (answer ?a))
	(not (fact (id f21)))	
	(not (fact (id f15)))
=>
	(if (eq ?a "Да") then (assert (fact (id f15) (name "Возраст меньше 18 лет."))  ))
	(if (eq ?a "Нет") then (assert (fact (id f21) (name "Возраст больше 18 лет.")) ))
	(retract ?answ)
)

(defrule isProud
	(declare (salience 50))
	?answ  <- (answer-user (question "Смотрит на всех свысока?") (answer ?a))
	(not (fact (id f1)))
=>
	(if (eq ?a "Да") then (assert (fact (id f1) (name "Смотрит на всех свысока."))  ))
	(retract ?answ)
)

(defrule hasProblemFamily
	(declare (salience 50))
	?answ  <- (answer-user (question "Проблемы в семье?") (answer ?a))
	(not (fact (id f2)))
=>
	(if (eq ?a "Да") then (assert (fact (id f2) (name "Проблемы в семье."))  ))
	(retract ?answ)
)

(defrule isHelpful
	(declare (salience 50))
	?answ  <- (answer-user (question "Всегда готов помочь другому?") (answer ?a))
	(not (fact (id f3)))
=>
	(if (eq ?a "Да") then (assert (fact (id f3) (name "Всегда готов помочь другому."))  ))
	(retract ?answ)
)

(defrule isUnpleasant
	(declare (salience 50))
	?answ  <- (answer-user (question "Отталкивающий человек?") (answer ?a))
	(not (fact (id f4)))
=>
	(if (eq ?a "Да") then (assert (fact (id f4) (name "Отталкивающий человек."))  ))
	(retract ?answ)
)

(defrule hasGoodAppearance
	(declare (salience 50))
	?answ  <- (answer-user (question "Заботится о внешнем виде?") (answer ?a))
	(not (fact (id f5)))
=>
	(if (eq ?a "Да") then (assert (fact (id f5) (name "Заботится о внешнем виде."))  ))
	(retract ?answ)
)

(defrule hasTrouble
	(declare (salience 50))
	?answ  <- (answer-user (question "Часто попадает в неприятности?") (answer ?a))
	(not (fact (id f6)))
=>
	(if (eq ?a "Да") then (assert (fact (id f6) (name "Часто попадает в неприятности."))  ))
	(retract ?answ)
)

(defrule hasHobby
	(declare (salience 50))
	?answ  <- (answer-user (question "Имеет постоянное хобби?") (answer ?a))
	(not (fact (id f7)))
=>
	(if (eq ?a "Да") then (assert (fact (id f7) (name "Имеет постоянное хобби."))  ))
	(retract ?answ)
)

(defrule hasChild
	(declare (salience 50))
	?answ  <- (answer-user (question "Есть дети?") (answer ?a))
	(not (fact (id f8)))
=>
	(if (eq ?a "Да") then (assert (fact (id f8) (name "Есть дети."))  ))
	(retract ?answ)
)

(defrule isStupid
	(declare (salience 50))
	?answ  <- (answer-user (question "Делает вид, что понимает, чем занимается?") (answer ?a))
	(not (fact (id f9)))
=>
	(if (eq ?a "Да") then (assert (fact (id f9) (name "Делает вид, что понимает, чем занимается."))  ))
	(retract ?answ)
)

(defrule lovesFamily
	(declare (salience 50))
	?answ  <- (answer-user (question "Любит свою семью?") (answer ?a))
	(not (fact (id f10)))
=>
	(if (eq ?a "Да") then (assert (fact (id f10) (name "Любит свою семью."))  ))
	(retract ?answ)
)

(defrule lovesKitchen
	(declare (salience 50))
	?answ  <- (answer-user (question "Любит проводить время на кухне?") (answer ?a))
	(not (fact (id f11)))
=>
	(if (eq ?a "Да") then (assert (fact (id f11) (name "Любит проводить время на кухне."))  ))
	(retract ?answ)
)

(defrule hasBadHealth
	(declare (salience 50))
	?answ  <- (answer-user (question "Не заботится о своём здоровье?") (answer ?a))
	(not (fact (id f12)))
=>
	(if (eq ?a "Да") then (assert (fact (id f12) (name "Не заботится о своём здоровье."))  ))
	(retract ?answ)
)

(defrule isTrustful
	(declare (salience 50))
	?answ  <- (answer-user (question "Готов поверить в любую чушь?") (answer ?a))
	(not (fact (id f13)))
=>
	(if (eq ?a "Да") then (assert (fact (id f13) (name "Готов поверить в любую чушь."))  ))
	(retract ?answ)
)

(defrule isMocks
	(declare (salience 50))
	?answ  <- (answer-user (question "Смеется над людьми?") (answer ?a))
	(not (fact (id f14)))
=>
	(if (eq ?a "Да") then (assert (fact (id f14) (name "Смеется над людьми."))  ))
	(retract ?answ)
)

(defrule likesReading
	(declare (salience 50))
	?answ  <- (answer-user (question "Любит читать?") (answer ?a))
	(not (fact (id f16)))
=>
	(if (eq ?a "Да") then (assert (fact (id f16) (name "Любит читать."))  ))
	(retract ?answ)
)

(defrule outsideHouse
	(declare (salience 50))
	?answ  <- (answer-user (question "Часто выходит из дома?") (answer ?a))
	(not (fact (id f17)))
	(not (fact (id f20)))
=>
	(if (eq ?a "Да") then (assert (fact (id f17) (name "Часто выходит из дома."))  ))
	(if (eq ?a "Нет") then (assert (fact (id f20) (name "Не часто выходит из дома."))  ))
	(retract ?answ)
)

(defrule isAmbitious
	(declare (salience 50))
	?answ  <- (answer-user (question "Целеустремлённый?") (answer ?a))
	(not (fact (id f18)))
=>
	(if (eq ?a "Да") then (assert (fact (id f18) (name "Целеустремлённый."))  ))
	(retract ?answ)
)

(defrule isNonConfrontational
	(declare (salience 50))
	?answ  <- (answer-user (question "Избегает конфликтов?") (answer ?a))
	(not (fact (id f19)))
=>
	(if (eq ?a "Да") then (assert (fact (id f19) (name "Избегает конфликтов."))  ))
	(retract ?answ)
)

(defrule IsTerminalAnswer
	(declare (salience 102))
	?answ  <- (answer-user (answer ?a))
	?flag <- (possible-term-found  ?nm )
=>
	(retract ?flag)
	(if (eq ?a "Да") then (assert (result-achieved ?nm) )  )
	(retract ?answ)
)


(defrule IsResult
	(declare (salience 102))
	?res <- (result-achieved ?nm)
	=>
	(assert (sendmessagehalt (str-cat "Вывод окончен, результат: " ?nm)))
	
	
)


(defrule FoundTerminal
	(declare (salience 501))
	?term <- (terminal_fact (id ?id) (name ?nm))
	=>
	(assert (question-user-force (question (str-cat "Это " ?nm "?" )  ) (answers "Да" "Нет")))
	(assert (possible-term-found  ?nm) )
)

(deffacts questions
	(question-user (question "Возраст меньше 18 лет?") (answers "Да" "Нет"))
	(question-user (question "Смотрит на всех свысока?") (answers "Да" "Нет"))
	(question-user (question "Проблемы в семье?") (answers "Да" "Нет"))
	(question-user (question "Всегда готов помочь другому?") (answers "Да" "Нет"))
	(question-user (question "Отталкивающий человек?") (answers "Да" "Нет"))
	(question-user (question "Заботится о внешнем виде?") (answers "Да" "Нет"))
	(question-user (question "Часто попадает в неприятности?") (answers "Да" "Нет"))
	(question-user (question "Имеет постоянное хобби?") (answers "Да" "Нет"))
	(question-user (question "Есть дети?") (answers "Да" "Нет"))
	(question-user (question "Делает вид, что понимает, чем занимается?") (answers "Да" "Нет"))
	(question-user (question "Любит свою семью?") (answers "Да" "Нет"))
	(question-user (question "Любит проводить время на кухне?") (answers "Да" "Нет"))
	(question-user (question "Не заботится о своём здоровье?") (answers "Да" "Нет"))
	(question-user (question "Готов поверить в любую чушь?") (answers "Да" "Нет"))
	(question-user (question "Смеется над людьми?") (answers "Да" "Нет"))
	(question-user (question "Любит читать?") (answers "Да" "Нет"))
	(question-user (question "Часто выходит из дома?") (answers "Да" "Нет"))
	(question-user (question "Целеустремлённый?") (answers "Да" "Нет"))
	(question-user (question "Избегает конфликтов?") (answers "Да" "Нет"))
)


