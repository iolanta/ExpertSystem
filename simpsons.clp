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

; это правило не работает - исправить (тут нужна печать списка)
(defrule print-messages
	(declare (salience 99))
	?proxy <- (ioproxy (messages ?msg-list))
	?update-key <- (updated True)
	=>
	(retract ?update-key)
	(printout t "Messages received : " ?msg-list crlf)
)

(deffunction ask-question (?question  $?allowed-values)
      (printout t ?question)    ; вывод вопроса
      (bind ?answer (read))     ; ввод ответа
      (if (lexemep ?answer)     ; если  введено строковое значение
         then                   ; то символы строки преобразуем в строчные
        (bind ?answer (lowcase ?answer)))
; пока пользователь не введет ответ, принадлежащий списку   допустимых значений, повторять ввод
	(while   (not   (member ?answer ?allowed-values))   do 
		(printout  t   ?question)
		(bind ?answer   (read))
		(if   (lexemep ?answer)
			then
		(bind ?answer   (lowcase  ?answer))))
		?answer
)

(deffunction yes-or-no-p (?question)
	(bind ?response (ask-question ?question yes no у n))
	(if (or (eq ?response yes) (eq ?response y))
		then  TRUE
        else  FALSE)
)

;======================================================================================

(deftemplate fact
	(slot id)
	(slot name)
)
 
(deftemplate terminal_fact
	(slot id)
	(slot name)
)

; f18 = f20
; f19 = not f15
; f20 = f18
; f21 = f19
;r1 : f17, f19 : s7
(defrule r1
	(fact ? ?) 
	=>
	(if(yes-or-no-p "Любит свою семью?")
	then 
	(assert (fact (id s7) (name "Работает."))))
	else
	(assert (fact (id s1) (name "АААА"))) 
	))
)
