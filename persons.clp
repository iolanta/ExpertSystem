;========================================================================
; Этот блок реализует логику обмена информацией с графической оболочкой,
; а также механизм остановки и повторного пуска машины вывода
; Русский текст в комментариях разрешён!

(deftemplate ioproxy  ; шаблон факта-посредника для обмена информацией с GUI
	(slot fact-id)        ; теоретически тут id факта для изменения
	(multislot answers)   ; возможные ответы
	(multislot messages)  ; исходящие сообщения
	(slot reaction)       ; возможные ответы пользователя
	(slot value)          ; выбор пользователя
	(slot restore)        ; забыл зачем это поле
)

(deftemplate question-user 
	(slot question)
	(multislot answers)
)

(deftemplate answer-user
	(slot question)
	(slot answer)
)

; Собственно экземпляр факта ioproxy
(deffacts proxy-fact
	(ioproxy
		(fact-id 0112) ; это поле пока что не задействовано
		(value none)   ; значение пустое
		(messages)     ; мультислот messages изначально пуст
	)
)

(defrule clear-messages
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?proxy <- (ioproxy)
	=>
	(modify ?proxy (messages))
	(retract ?clear-msg-flg)
	(printout t "Messages cleared ..." crlf)	
)


(defrule parse-output
	(declare (salience 100))
	?proxy <- (ioproxy (value ?v)  (fact-id ?fid) )
	?answ  <- (answer-user (question ?q)  )
	(test (eq ?fid (fact-index ?answ) ) )
	=>
	(modify ?proxy (answers) (value) (fact-id) )
	(modify ?answ (answer ?v))
	(printout t "Output parsed ..." crlf)	
)


(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule append-output-and-halt
	(declare (salience 99))
	?current-message <- (appendmessagehalt $?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Messages appended : " $?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages $?msg-list $?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule set-output-and-proceed
	(declare (salience 99))
	?current-message <- (sendmessage ?new-msg)
	?proxy <- (ioproxy)
	=>
	(printout t "Message set : " ?new-msg " ... proceed ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
)

(defrule append-output-and-proceed
	(declare (salience 99))
	?current-message <- (appendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended : " ?new-msg " ... proceed ..." crlf)
	(modify ?proxy (messages $?msg-list ?new-msg))
	(retract ?current-message)
)




(defrule ask-question
	(declare (salience 99))
	?current-question <- (question-user  (question ?q) (answers $?qvars ))
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(bind ?f (assert (answer-user (question ?q) )))
    (bind ?i (fact-index ?f))	
	(modify ?proxy (fact-id ?i) (messages $?msg-list ?new-qst)  (answers $?qvars))
	(retract ?current-question)
	(printout t "Question asked : " ?q " ... halting ..." crlf)
	(halt)
)





;======================================================================================
(deftemplate person 
	(slot name) 
	(slot eyes)
	(slot age)
	(slot hair)
)

(defrule greeting
   =>
   (printout t "Hello! " crlf)
)

(deffacts some-of-candidates
	(person (name Джон) (eyes Black) (age 30) (hair Black))
	(person (name Jane) (eyes Violet) (age 20) (hair Red))
	(person (name Джек) (eyes Green) (age 27) (hair Red))
	(person (name Jennifer) (eyes Brown) (age 50) (hair Brown))
)

(defrule complex-eye-hair-match 
	(declare (salience 40))
	?p1 <- (person (name ?name1) 
		(eyes ?eyes1)
		(age ?age1&:(< ?age1 30))
		(hair ?hair1)
	) 
	?p2 <-	(person (name ?name2&~?name1) 
		(eyes ?eyes2&~eyes1) 
		(age ?age2)
		(hair ?hair2&red|?hair1)
	)
	(test (< (abs (- ?age1 ?age2)) 10))
	;(test (< (fact-index ?p1) (fact-index ?p2)))
	=> 
	(printout t "----------------------" crlf) 
	(printout t "  " ?name1 " has " ?eyes1 " eyes and " ?hair1 " hair." crlf) 
	(printout t "  " ?name2 " has " ?eyes2 " eyes and " ?hair2 " hair." crlf)
	(assert (appendmessagehalt (str-cat "У нас есть пара! " ?name1 " и " ?name2)))
        ;(assert (appendmessagehalt "У нас есть пара!"))
)

(defrule match-pair-for-user 
	(declare (salience 10))
	=> 
	(assert (sendmessagehalt "Вам пары не досталось, но вы там держитесь!"))
) 