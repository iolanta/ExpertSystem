(deffacts main_facts 
	(fact (id f1) (name "Смотрит на всех свысока."))
	(fact (id f2) (name "Проблемы в семье."))
	(fact (id f3) (name "Всегда готов помочь другому."))
	(fact (id f4) (name "Отталкивающий человек."))
	(fact (id f5) (name "Заботится о внешнем виде."))
	(fact (id f6) (name "Часто попадает в неприятности."))
	(fact (id f7) (name "Имеет постоянное хобби."))
	(fact (id f8) (name "Есть дети."))
	(fact (id f9) (name "Делает вид, что понимает, чем занимается."))
	(fact (id f10) (name "Любит свою семью."))
	(fact (id f11) (name "Любит проводить время на кухне."))
	(fact (id f12) (name "Не заботится о своём здоровье."))
	(fact (id f13) (name "Готов поверить в любую чушь."))
	(fact (id f14) (name "Смеется над людьми."))
	(fact (id f15) (name "Возраст меньше 18 лет."))
	(fact (id f16) (name "Любит читать. "))
	(fact (id f17) (name "Часто выходит из дома."))
	(fact (id f18) (name "Целеустремлённый."))
	(fact (id f19) (name "Избегает конфликтов."))
	(fact (id f20) (name "Возраст больше 18 лет."))
)
  
(deffacts support_facts
	(fact (id s1) (name "Любит покушать."))
	(fact (id s2) (name "Хорошо готовит."))
	(fact (id s3) (name "Задира."))
	(fact (id s4) (name "Любит учиться."))
	(fact (id s5) (name "Живёт по правилам."))
	(fact (id s6) (name "Тупой."))
	(fact (id s7) (name "Работает."))
	(fact (id s8) (name "Влюблённый."))
	(fact (id s9) (name "Неудачник."))
	(fact (id s10) (name "Родитель."))
	(fact (id s11) (name "Отличница."))
	(fact (id s12) (name "Имеет вредные привычки."))
	(fact (id s13) (name "Любит выпить."))
	(fact (id s14) (name "Доверчив."))
	(fact (id s15) (name "Попадает под влияние других людей."))
	(fact (id s16) (name "Плохое зрение."))
	(fact (id s17) (name "Школьник."))
	(fact (id s18) (name "Домохозяйка."))
	(fact (id s19) (name "Курит."))
	(fact (id s20) (name "Слаборазвитый."))
	(fact (id s21) (name "Старик."))
	(fact (id s22) (name "Богатый."))
	(fact (id s23) (name "Плохой родитель."))
	(fact (id s24) (name "Религиозный."))
)

(deffacts term_facts
	(terminal_fact (id t1) (name "Гомер Симпсон"))
	(terminal_fact (id t2) (name "Мардж Симпсон"))
	(terminal_fact (id t3) (name "Барт Симпсон"))
	(terminal_fact (id t4) (name "Лиза Симпсон"))
	(terminal_fact (id t5) (name "Мэгги Симпсон"))
	(terminal_fact (id t6) (name "Абрахам Симпсон"))
	(terminal_fact (id t7) (name "Пэтти Бувье"))
	(terminal_fact (id t8) (name "Милхаус Ван Хутен"))
	(terminal_fact (id t9) (name "Нельсон Манц"))
	(terminal_fact (id t10) (name "Чарльз Монтгомери Бёрнс"))
	(terminal_fact (id t11) (name "Нед Фландерс"))
	(terminal_fact (id t12) (name "Клоун Красти"))
	(terminal_fact (id t13) (name "Сеймур Скиннер"))
	(terminal_fact (id t14) (name "Ральф Виггам"))
)


(deffacts questions
	(question-user (question "Возраст меньше 18 лет?") (answers "Да" "Нет"))
)