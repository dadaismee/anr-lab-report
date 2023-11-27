---
bibliography: service/120_vashchenko_SAOM.json
---
# 1.2 Акторно-ориентированные стохастические модели для изучения сетевой динамики и социального влияния

## Введение
В контексте развития сетевого анализа исследования сетей в динамике становится все более значимыми для понимания сложных взаимосвязей. Осознавая эту потребность, исследователи прибегают к разработке новых методологий для анализа и построения сетей. В этом контексте нельзя не вспомнить про акторно-ориентированные стохастические модели (Stochastic Actor-Oriented Models, SAOMs), представляющие собой одно из наиболее развивающихся и перспективных средств анализа механизмов социального развития, взаимосвязей и эволюции различных сетей. В связи с этим ученые из различных областей, таких как социология, экономика, эпидемиология и коммуникационные исследования, первоочередно прибегают к использованию данного аналитического инструмента для понимания сложных взаимосвязей между акторами. 

По сути, SAOM выступает в роли линзы, через которую исследователи могут расшифровать сетевую динамику, раскрывая глубинные процессы, определяющие эволюцию сети. Преодолевая разрыв между наблюдаемым и ненаблюдаемым, модель предоставляет ценный инструмент для сетевых аналитиков, стремящихся выявить скрытые закономерности и механизмы, управляющие социальными взаимодействиями и сетевыми структурами. 

В данной работе мы рассматриваем основные принципы и области применения этой методологии. Мы стремимся выяснить отличительные особенности SAOM и их значимость в области стохастического анализа сетей. Проведя сравнительный анализ SAOM и временных экспоненциальных моделей случайных графов (TERGM), мы подчеркнули сильные стороны и уникальный вклад SAOM в раскрытие динамики сетей. Наконец, мы также рассматриваем процесс работы алгоритмов, которые позволяют оценить качество подобных моделей, включая такие статистические показатели как оценка адекватности модели (Goodness of Fit). Кроме того, мы приводим релевантные примеры эмпирических работ, которые позволяют напрямую увидеть практическую значимость методологии в современных исследованиях и дальнейший потенциал для разработки сложных сетевых феноменов. 

Цель: Провести сравнительный анализ методологий применения Акторно-ориентированных стохастических моделей (SAOMs) для изучения сетевых динамик и социального влияния. 

Задачи:
1. Дать характеристики применения акторно-ориентированных стохастических моделей (Stochastic Actor Oriented Models, SAOM) как одного из направлений развития подходов к анализу динамических сетей.
2. Сравнить акторно-ориентированные стохастические модели (SAOMs) и темпоральные экспоненциальные модели случайных графов (TERGMs) для изучения динамических сетей. 
3. Описать алгоритмы для оценки качества и адекватности акторно-ориентированных стохастических моделей.
## Изучение сетевой динамики: перспективы, ограничения и применения SAOM

Хотя SAOM все еще является развивающимся методом сетевого анализа, его уже успешно применили в различных областях: от анализа небольших сетей дружбы подростков до политологического анализа транснациональных союзов. Мы сделаем обзор некоторых из наиболее цитируемых работ в нескольких научных областях, а также предложим способы применения этого подхода в работе ANR-Lab. 
### Применения

**Дружба и влияние сверстников**
Применения SAM породило довольно много исследований на более маленьких выборках сетей дружбы, в которых исследовались реципрокность и гомофилия ка каналы социального влияния на курение, потребление веществ, ожирение и т. д. в группах сверстников. Среди подобных исследований: эффекты пола на распределение индивидуальных характеристик в сетях дружбы [@vandebuntFriendshipNetworksTime1999]; актуальные проблемы курения и употребления алкоголя через призму гомофилии: влияния сверстников [@delahayeSmokingDiffusionNetworks2019] [@kiuruPressureDrinkNot2010] [@huangInterplayFriendshipNetworks2014] [@kiuruPressureDrinkNot2010] [@kiuruPressureDrinkNot2010] [@schaeferDynamicModelUS2012] и родительского примера [@merckenChoosingAdolescentSmokers2013].

Кроме того, на пересечении медицинской социологии и сетевого анализа, существуют также исследования, применяющие SAOM, для выявления социального влияния на вероятность заболеваний, например, СДВГ [@aronsonPeerInfluencePotential2016], подростковой депрессии [@zalkPeerContagionAdolescent2010], образа жизни и ожирения [@delahayeHowPhysicalActivity2011]. В этой области также существуют работы о социальном влиянии этнического самоопределения [@jugertEffectsEthnicMinority2018], лидерских динамик [@mehraCoevolutionFriendshipLeadership2009], религии [@kretschmerInGroupBiasOutGroup2022] и владения оружием [@dijkstraTestingThreeExplanations2012] на дружбу и процесс выбора друзей. 

**Библиометрический анализ**
Другим перспективным направлением сетевого анализа социальных сетей, в котором применяется модель Siena, является библиометрический анализ. Наши коллеги по ANR-Lab А. Ферлигой и Л. Кроннегер, в соавторстве с создателем моделей Т. Снайдером, провели впечатляющий анализ научного сообщества и динамик соавторства в Словении с 1996 по 2010 год [@ferligojScientificCollaborationDynamics2015], а также провели дополнительную работу на лучших данных, указав на важность институциональных контекстов на среду работы ученых, его не-механическую природу [@kroneggerCollaborationStructuresSlovenian2012].

Инновации в научных исследований, проанализированные с помощью SAOM, уделяют внимание гендерной гомофилии [@lungeanuEffectsDiversityNetwork2015], а также сетевым динамикам более молодых областей науки [@vermondEvolutionCoevolutionPrimary2022], роли административных ресурсов университета на паттерны коллаборации [@roeslerRoleUniversitiesNetwork2017], коллаборациям между университетом и индустрией [@chenNetworkDynamicsUniversityindustry2022] и диффузии инноваций [@liangEvolutionGovernmentSponsored2018].

**Политические науки**
Одной из наиболее заметных областей исследований, в которых применяется SAOM, является политология и исследования законодательства. Политические акторы и связи между ними оказались исключительно подходящими для этой модели и позволили провести широкий спектр исследований. Во-первых, это исследования по определению и изменению паттернов коллаборации среди законодателей [@ingoldDriversCollaborationMitigate2014], использующие влияния рисков/ресурсов на принятие решений [@berardoSelfOrganizingPolicyNetworks2010].

В поле исследований также входят статьи по анализу дипломатических связей между странами [@kinneDependentDiplomacySignaling2014]; международной кооперацией и работой интернациональных союзов в связи с проблемами координации [@kinneNetworkDynamicsEvolution2013] и предсказания будущего Европы как структуры транснациональной сети [@thurnerEuropeanUnionTransgovernmental2009].

Лонгитюдный подход к сетям также полезен при анализе распространения правил и законов через институты, регионы и страны (например, законы вокруг международной торговли [@mohrenbergStudyingPolicyDiffusion2017], а также коэволюции доступа к диджитал-инструментам, демократии и торговых связей [@rhueDigitalAccessPolitical2014]. Наконец,  SOAM может быть применен для анализа политического действия [@redheadCoalitionsConflictLongitudinal2021] и исторического моделинга событий [@box-steffensmeierEventHistoryModeling2004].

## Ограничения

SAOM обладает большими теоретическими основаниями, чем TERGM, и модель сочетает как социологические, так и статистические методы [@leifeldTheoreticalEmpiricalComparison2019]. В то же время теоретическая укорененность модели может выступать и ограничением. Для начала, идея о том, что любые изменения в сети акторы выполняют только последовательно, а не одновременно не позволяет использовать данные из имейл сообщений, электрических систем, очень больших сетей и других ситуаций, когда “социологическая рамка не соответствует реальности” или она не может быть полностью фальсифицирована [@leifeldStochasticActororientedModel2022]. Из-за этого, наложение новых теоретических предположений на сеть невозможно без предварительной проверки базовых предположений SAOM.

Кроме того, этот метод предполагает, что каждый актор размышляет о своих действиях в одинаковой логике, что удобно для статистического упрощения расчетов, но не всегда соответствует модели с акторами, которые обладают разными классами и задачами [@ceoldoStochasticActorOriented2023a]. При этом, нельзя отрицать, что хотя процесс и ускоряется, работа с моделью требует больших временных затрат [@snijdersStochasticActororientedModels1996], а получение необходимых данных высокого качества более финансово требовательно [@steglichDynamicNetworksBehavior2010].
## Перспективы

Перед исследователями стоят еще много методологических проблем, в том числе работа в модели с коррелирующими рандомизированными эффектами [@ceoldoStochasticActorOriented2023a], и разработкой моделей с необнаруженной гетеронормативностью между акторами, которые позволят применить подход к более крупным сетям [@snijdersStochasticActororientedModels2017].

Наконец, мы считаем, что SAOMs могут быть применены к нескольким направлениям исследований российского общества. До сих пор только в образовательной сфере были созданы литературные обзоры, направленные на выявления факторов академического успеха и поведения учеников с помощью SAOM [@dokukaIspolzovanieStohasticheskihAktornoorientirovannyh2021],[@dokukaStatisticheskieModeliDlya2015]. Мы предлагаем несколько потенциальных направлений развития.

Библиометрический анализ российского научного сообщества, которым занимается одна из исследовательских групп ANR-Lab уже использует лонгитюдные данные [@kimStabilityEvaluationRussian2021], [@matveevaScientificCollaborationRussian2020]. Более того, в нескольких проектах мы также обладаем крупными датасетами библиометрических данных из Web of Science, которые могут быть в разрезе по отдельными направлениям или институциям проанализированы с помощью SAOM. Кроме того, кажется перспективным анализ открытых судебных данных, а также коллабораций в законодательных инициативах и торговых международных договорах. В данном случае, наиболее сложным этапом работы был бы сбор и предобработка данных.**
## Оптимизация и оценка
Для оценки SAOM используются различные статистические методы, наиболее распространенным из которых является метод моментов (МoМ) или метод максимального правдоподобия (MLE).

Метод моментов (MoM) – это метод имитационного моделирования, используемый для оценки параметров в SAOM, подробно описанный Снайдерсом [@snijdersStatisticalEvaluationSocial2001]. Он заключается в сравнении описательных статистик наблюдаемой сети со значениями, полученными в результате моделирования при разных значениях параметров. Целью является обнаружение значений гиперпараметров, минимизирующих разницу между наблюдаемой и моделируемой статистикой сети.

Сначала оценки параметров часто задаются произвольно, а затем, путем итерационного моделирования SAOM с различными наборами значений параметров, рассчитываются сводные статистики и сравниваются с соответствующими характеристиками наблюдаемых данных на основе функции расхождения, которая количественно оценивает разницу между наблюдаемой и моделируемой статистиками. Затем оценки параметров обновляются таким образом, чтобы минимизировать функцию расхождения. Функции расхождения, используемые в SAOM, могут оценивать такие свойства, как количество связей, транзитивность, распределение мер центральности, паттерны образования и распада связей, вклад характеристик акторов, специфические параметры диад и временная динамика. Выбор функции расхождения зависит от вопроса исследования, конкретной используемой SAOM и характеристик наблюдаемых сетевых данных.

Несмотря на концептуальную простоту MoM и возможность работы со сложными SAOM, а также гибкую спецификацию модели, подходящую для различных типов сетевых данных, ее использование сопряжено с определенными трудностями. Для больших сетей или сложных моделей МоМ может быть вычислительно трудоемким, а также требует тщательной настройки алгоритмов оптимизации. Предпринимаются попытки повысить эффективность и расширить спектр использования MoМ. Например, развитие обобщенного метода моментов (GMoM) позволяет обогатить оценку временными данными, вводя в нее в качестве параметров статистику из различных временных моментов [@amati]. Однако этот метод, как предполагают авторы, не может стабильно превосходить традиционный MoM, в частности, из-за избыточности признаков, что препятствуют сходимости.

При оценке по методу максимального правдоподобия (MLE) необходимо найти такие значения параметров, при которых наблюдаемые данные наиболее вероятны в рамках данной модели. Параметры обновляются таким образом, чтобы максимизировать логарифм функции правдоподобия, выбранной исходя из характера сетевых данных и предположений об их эволюции. Функции правдоподобия разнообразны и подходят для различных типов данных (бинарных, непрерывных, мультиномиальных, событийных и т.д.). MLE дает оценки, которые асимптотически эффективны: увеличение размера выборки связано с ростом точности и уменьшением погрешности. Этот метод широко используется в статистике и может работать с различными спецификациями SAOM. Однако MLE может требовать больших вычислительных затрат, особенно для сложных SAOM. Сходимость к глобальному максимуму функции правдоподобия может быть не гарантирована, а процесс оценки может потребовать тщательной инициализации.

Более того, определение полной функции правдоподобия может стать сложной задачей из-за зависимостей между диадами в процессе эволюции сети. Другими словами, одна диада может влиять на поведение других диад в сети. Дальнейшая адаптация MLE – оценка максимального псевдоправдоподобия (MPLE) – решает эту проблему путем максимизации функции псевдоправдоподобия: вероятность для каждой диады вычисляется на основе наблюдаемого состояния этой диады и состояний соседних диад, заданных SAOM. MPLE менее требователен к вычислениям по сравнению с заданием полного совместного правдоподобия для сложных сетей, поскольку требует моделирования только условных связей между диадами, однако, несмотря на вычислительные преимущества, он не всегда может давать асимптотически эффективные оценки. Бесаг утверждает, что максимальная оценка псевдовероятности отражает "локальную" (пространственную) информацию о соседях, в отличие от оценки максимального правдоподобия, которая отражает "глобальную" информацию о соседях [@besag1986]. Более того, Снайдерс утверждает, что результаты исследований показывают, что обычно используемые модели случайных графов имеют скорее глобальную, чем локальную структуру, что в конечном итоге приводит к плохим статистическим свойствам MPLE-оценок [@snijdersStatisticalEvaluationSocial2001]. Далее он предполагает, что адаптация спецификации модели, например, подходы, основанные на соседстве, с ограничениями на возможные связи между соседями [@pattison2002], подходы, основанные на латентном пространстве [@nowicki2001][@hoff2002][@schweinberger2003], обладают большими возможностями для решения этой проблемы.

Дальнейшая валидация модели, а также сравнение SAOM с различными характеристиками осуществляется с помощью таких тестов качества, как:

1.     _Goodness-of-fit (GOF)_ тесты оценивают, насколько хорошо SAOM воспроизводит наблюдаемые сетевые данные, сравнивая статистики сетей. Тесты GOF могут использовать имитационное тестирование или методы бутстрепа, но страдают от переобучения, плохой генерализации и чувствительности к размеру выборки. Lospinoso и Snijders [@lospinoso2019] предлагают в качестве решения этой проблемы вспомогательные статистики (например, характеристики триад, транзитивность), не включенные в модель в явном виде. Они моделируют расстояние Махаланобиса между вектором вспомогательной статистики и оценкой модели с помощью симуляций Монте-Карло, повторно используя их из вычислений MOM в SAOM. Вводя собственный принцип минимального описания модели (MMD), они анализируют влияние вспомогательных статистик на GOF, добиваясь баланса между сложностью модели и ее описательной способностью.

2.     _Критерии отбора моделей_, такие как информационный критерий Акаике (AIC) или Байесовский информационный критерий (BIC), предлагают количественную сравнительную меру для SAOM: чем меньше значения, тем лучше модель подходит под данные. AIC совмещает оценку соответствия модели данным и штраф за сложность модели:
$$ AIC = -2*loglikelihood + 2*number of model parameters $$
BIC штрафует сложность модель сильнее, чем AIC. Этот критерий рассчитывается как:
$$BIC = -2*loglikelihood + log(sample size) * number of model parameters*$$

3.     _Тесты на сходимость_ позволяют определить, сходится ли алгоритм оценки, используемый для подгонки SAOM, к стабильным оценкам параметров. Визуальное изучение графиков параметров модели может помочь выявить проблемы сходимости. В идеале графики должны стабилизироваться по мере выполнения оценки. В отношении несошедшихся моделей от интерпретации следует отказаться.

·      t-ratio является количественной мерой степени отклонения смоделированной статистики от целевой в среднем.

·      Чем меньше t-ratio, тем лучше сходимость. Как правило, t-ratio менее 0,1 считается показателем хорошей сходимости.

·      Чтобы считать модель сходящейся, общее максимальное t-ratio сходимости не должно превышать 0,25.

·      В тех случаях, когда модель не сходится, рекомендуется повторно провести анализ с использованием опции "prevAns".


## Вырождение
Другой проблемой, возникающей при оценке SAOM, является вырождение. В работах Штрауса [@strauss1986], Снайдерса [@snijders] и Хэндкока [@handcock] показано, что экспоненциальные модели случайных графов могут быть почти вырожденными, и то же самое может иметь место для SAOM в перспективе отсутствующих временных лимитов (хотя на практике время обычно ограничено). Вырожденность в SAOM возникает, когда несколько наборов значений параметров приводят к одной и той же наблюдаемой структуре сети. Это может затруднить оценку “истинных” или наиболее точных значений параметров и точное определение механизма, управляющего эволюцией социальной сети. Проблема вырождения представляется особенно опасной в сетевом анализе, поскольку сходимость к целевому распределению становится еще более медленной и менее устойчивой в мультимодальных сетях, где типичные алгоритмы, обновляющие отдельные связи или структурные элементы, имеют ничтожно малую вероятность перемещения между модальными областями [@snijders].

Для решения проблемы вырождения SAOM исследователи обычно используют различные стратегии [@handcock], такие как проверка робастности, сравнение различных инициализаций модели, предоставление дополнительных данных для обучения.

В этих практиках также отдается предпочтение байесовскому фреймворку [@nowicki2001]. Помимо уменьшения вырождения модели, он облегчает распространение неопределенности параметров на окончательный вывод и позволяет учитывать предварительные знания экспертов, если они существуют [@handcock]. Кроме того, Лоспиносо и др. [@lospinoso2019] предполагают, что введение в модель временной неоднородности может снять проблему вырождения. Временная неоднородность добавляет временное измерение в модель, делая ее более способной улавливать и различать различные состояния сети в разные моменты времени, что, в свою очередь, приводит к улучшению предсказательной силы и качества подгонки, а также позволяет вводить временные ограничения и включать внешние события в качестве параметров модели. Проблема вырождения в бимодальных сетях может быть минимизирована путем адаптации методов оценки, как это было предложено в работе [@snijders].
