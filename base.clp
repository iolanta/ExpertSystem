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

(deffunction write-answer 
	(?answ)
	(do-for-all-facts ((?f ioproxy)) (> 2 1) (modify ?f (value ?answ))  )
) 


; Собственно экземпляр факта ioproxy
(deffacts proxy-fact
	(ioproxy
		(fact-id 0112) ; это поле пока что не задействовано
		(value NONE)   ; значение пустое
		(messages)     ; мультислот messages изначально пуст
	)
)

(defrule clear-messages
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?proxy <- (ioproxy)
	=>
	(modify ?proxy (messages) )
	(retract ?clear-msg-flg)
	(printout t "Messages cleared ..." crlf)	
)


(defrule parse-output
	(declare (salience 100))
	?proxy <- (ioproxy (value ?v)  (fact-id ?fid) )
	?answ  <- (answer-user (question ?q)  )
	(test (eq ?fid (fact-index ?answ) ) )
	(test (not (eq ?v NONE )))
	(test (not (eq ?fid NONE )))
	=>
	(modify ?proxy (answers) (value NONE) (fact-id NONE) )
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

(defrule ask-question-force
	(declare (salience 400))
	?current-question <- (question-user  (question ?q) (answers $?qvars ))
	?proxy <- (ioproxy (messages $?msg-list))
	?flag <-(forcequestion)
	=>
	(bind ?f (assert (answer-user (question ?q)  )))
    (bind ?i (fact-index ?f))	
	(modify ?proxy (fact-id ?i) (messages $?msg-list ?q)  (answers $?qvars))
	(retract ?current-question)
	(retract ?flag)
	(printout t "Question asked : " ?q " ... halting ..." crlf)
	(halt)
)



(defrule ask-question
	(declare (salience -100))
	?current-question <- (question-user  (question ?q) (answers $?qvars ))
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(bind ?f (assert (answer-user (question ?q)  )))
    (bind ?i (fact-index ?f))	
	(modify ?proxy (fact-id ?i) (messages $?msg-list ?q)  (answers $?qvars))
	(retract ?current-question)
	(printout t "Question asked : " ?q " ... halting ..." crlf)
	(halt)
)



