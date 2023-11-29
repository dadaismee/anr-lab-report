## Современные подходы в области статистического сетевого анализа и моделирования: модели SIENA, ERGM, tERGM

### Введение
Существует растущий спрос на реалистичные и интерпретируемые статистические модели для анализа сетей, и в частности для тех сетей, которые представлены в динамике. В контексте зависимых данных (тех, что нельзя назвать независимыми и случайно распределенными) были разработаны несколько подходов для статистического вывода (statistical inference) – к ним относятся иерархическое моделирование [@leeHierarchicalGeneralizedLinear1996], временные ряды [@box-steffensmeierTimeSeriesAnalysis2014], пространственный анализ [@wangPoissonlognormalConditionalautoregressiveModel2013] и моделирование многомерных распределений с использованием копула-функций [@genestJoyCopulasBivariate1986]. Однако ни один из этих методологических подходов не является достаточным для того, чтобы отразить сложную структуру и широкий диапазон зависимостей, которые мы наблюдаем в сетях. 

Так, например, в области научного сотрудничества существует необходимость в разработке моделей, основанных на зависимых данных, для анализа сетей сотрудничества. Научное взаимодействие, социальная и когнитивная структура различных научных областей успешно изучаются в библиометрии и саентометрии (scientometrics) с помощью анализа временных библиометрических сетей – соавторства, цитирования, со-цитирования и библиометрических связей между авторами или группами авторов и библиометрическими сущностями, представленными в базе данных (работы, авторы, журналы, ключевые слова, организации, страны, и т.д.). В контексте анализа сетей сотрудничества модели позволят нам понять, какие факторы стоят за образованием связи в сети, т.е. понять, что способствовало формированию данной структуры сотрудничества в академии.

С ранней работы Прайса [@priceLittleScienceBig1963] и работы Гарфильда [@garfieldCitationIndexingIts1979], социологи представили несколько теорий, касающихся научного сотрудничества. Анализ саентометрии основан на эффекте Мэтью [@priceLittleScienceBig1963] и теории структуры малого мира [@desolapoolContactsInfluence1978], а также их применения к моделированию динамики сетей соавторства. Настоящий доклад будет сосредоточен на изучении потенциального применения экспоненциальных моделей случайных графов (ERGMs) и темпоральных экспоненциальных моделей случайных графов (TERGMs) в области библиометрического анализа.

### Стохастический и детерминированный подходы к сетевому анализу
В области сетевого анализа стохастические методы представляют собой кульминационные этапы аналитического процесса. Основой передовых аналитических процедур в сетевом анализе неизменно является детерминированный подход. Детерминированный подход к анализу сетей служит исходной базой, в рамках которой развиваются более сложные аналитические методики. В этом контексте мы классифицируем детерминированные подходы по трем основным направлениям: глобальные свойства, локальные свойства и разбиение на части (partitioning), каждое из которых позволяет по-разному взглянуть на структурные характеристики сети (см. Рис. \ref{deterministic}).

![Детерминистские подходы к анализу сетей\label{deterministic}](../images/22_1.png)

Глобальные свойства включают в себя фундаментальные атрибуты, позволяющие получить целостное представление о сети в целом. Эти свойства включают в себя различные аспекты, в том числе:

1. ***Размер сети.*** Этот параметр характеризует общее количество узлов или вершин в сети. Он дает фундаментальное представление о масштабе сети.

2. ***Плотность.*** Плотность определяет степень взаимосвязанности в сети. Она измеряет долю существующих связей по отношению ко всем возможным связям в сети.

3. ***Централизация сети.*** Централизация сети оценивает концентрацию центральных узлов в сети. Она позволяет определить, оказывают ли несколько узлов непропорционально большое влияние на взаимодействие в сети.

4. ***Распределение степеней.*** Показатель характеризует распределение степеней вершин в сети.

5. ***Транзитивность*** определяет склонность узлов к образованию кластеров или групп. 

6. ***Ассортативность и гомофилия.*** Эти свойства изучают характер связей между узлами на основе общих характеристик или атрибутов. Ассортативность изучает склонность узлов со схожими характеристиками к соединению, а гомофилия – склонность узлов с общими характеристиками к взаимодействию.

Помимо описательной статистики, глобальные свойства позволяют получить ценные сведения о глобальной структуре сети, включая ее связность и наличие характерных конфигураций, таких как симметричные и асимметричные структуры “ядро-периферия”. Эти глобальные свойства тесно связаны с областью блок-моделирования. 

Локальные свойства, напротив, позволяют проникнуть в микроструктуру сети и понять взаимодействие между отдельными узлами. Эти свойства включают в себя разнообразную описательную информацию о данной сети, в том числе:

1. ***Меры центральности.*** Центральные показатели, такие как степенная центральность (degree centrality), центральность близости (closeness centrality) и промежуточная центральность (betweenness centrality), отражают значимость отдельных узлов в сети и их роль в распространении информации или влияния. Изучение корреляций между различными центральностями позволяет выявить закономерности важности узлов.

2. ***Коэффициент кластеризации.*** Коэффициент кластеризации определяет склонность узлов к образованию кластеров или скоплений. Он дает представление о распространенности локальных структур сообщества в сети.

3. ***Структурные дыры.*** Эта концепция изучает наличие брокерских возможностей в сети, когда отдельные лица или узлы служат мостами между разрозненными группами или кластерами.

4. ***Dyad Census и Triad Census.*** Переписи диад и триад предполагают категоризацию и подсчет конкретных сетевых подструктур, состоящих из двух или трех узлов соответственно. Эти метрики облегчают анализ структурных паттернов и мотивов в сети.

5. ***Теория баланса.*** Теория баланса изучает наличие сбалансированных или несбалансированных отношений в триадах узлов, внося свой вклад в понимание социальной динамики и стабильности сети.

Детерминированный подход также включает в себя разбиение сети (partitioning) – классификацию вершин сети таким образом, чтобы каждая вершина относилась ровно к одному классу или кластеру:

1. ***Блоки связности и сплоченные подгруппы.*** Социальные сети обычно содержат плотные скопления участников, которые взаимодействуют больше между собой, чем с другими участниками сети. Методы обнаружения сплоченных подгрупп включают k-ядра, ядра, клики, k-соседей и компоненты, которые выделяют в сети сплоченные группы. Общая гипотеза заключается в том, что люди, совпадающие по социальным характеристикам, будут взаимодействовать чаще, а люди, взаимодействующие регулярно, будут формировать общее отношение или идентичность [@denooyExploratorySocialNetwork2005].

2. ***Острова.*** Остров – это максимальная подсеть вершин, связанных между собой, значение которых больше, чем ребер, ведущих к вершинам вне такой подсети [@denooyExploratorySocialNetwork2005]. Другими словами, это плотно связанные друг с другом узлы, отражающие локально важные участки сети. Алгоритм для поиска островов доступен в программе Pajek.

3. ***Обнаружение сообществ и кластеризация вершин.*** Различие между обнаружением сообществ (с использованием таких метрик, как модульность, VOS-кластеризация и кластеризация по методу Лувена) и кластеризацией (с использованием ролей, позиций, блок-моделирования и реляционных ограничений) предполагает различные точки зрения на выявление значимых подгрупп в сетях, каждая из которых подходит для решения конкретных аналитических задач [[@denooyExploratorySocialNetwork2005]].

Таким образом, детерминированный сетевой анализ представляет собой строгую основу для изучения сложных сетей. Его трехсторонняя структура включает в себя глобальные и локальные свойства, позволяющие понять структуру и динамику сети, а также разбиение сети на части, позволяющее выделить значимые подструктуры сети. Подход ориентирован на *статические* отношения между акторами. Он служит отправной точкой для анализа и закладывает основу для развития стохастических методов, предоставляя исследователям инструменты для всестороннего раскрытия многогранной природы сетевых систем.

Стохастический подход в своей основе опирается на результаты, полученные в рамках детерминированного подхода. В данной работе будут рассмотрены экспоненциальные модели случайных графов (ERGM), являющиеся одними из основных методов моделирования статических сетей. Модели ERGM служат универсальной аналитической основой, позволяющей исследовать различные сетевые явления (кластеризацию, гомофилию и другие структурные показатели, возникающие в результате сложного взаимодействия и поведения участников сети). Используя модели такого типа, мы можем выяснить, как и почему ученые сотрудничают друг с другом, и понять, что заставляет их работать вместе.

ERGM предлагает новый подход к моделированию состояния сети, отходя от традиционных методов регрессии. Вместо того чтобы предполагать независимость участников сети или связей, он рассматривает наблюдаемую сеть как один результат из многомерного распределения. Исследователи могут использовать ERGM для анализа сетей на основе гипотез, аналогичных тем, которые используются в классической регрессии (например, как ковариата влияет на результат), и при этом учитывать структуру или взаимозависимость сети в той мере, в какой они считают это целесообразным.

Однако, многие сети представлены в динамике, поэтому все большее признание получает необходимость выхода за рамки статических моделей и учета временной динамики. Во временном стохастическом подходе предполагается, что сетевые данные могут наблюдаться и измеряться в различные моменты времени, причем эти наблюдения не изолированы, а взаимосвязаны – они образуют последовательности, содержащие ценную информацию об эволюции сети. Возможные модели для динамических сетей представлены на Рисунке \ref{dynamic}.

![Классификация основных стохастических подходов к анализу динамических сетей\label{dynamic}](../images/22_2.png)

***Акторно-ориентированные модели (SAOM).*** Акторно-ориентированные модели – это класс временных стохастических моделей, в которых основное внимание уделяется отдельным участникам сети. SAOM, разработанные Снайдерсом [@snijdersStatisticalEvaluationSocial2001], основаны на идее, что поведение и решения отдельных участников определяют изменения в сети с течением времени. Эти модели учитывают, как участники адаптируют свои связи в зависимости от своих характеристик и взаимодействия с другими участниками, что делает их ценными для понимания микроуровневой динамики развития сети. SAOM широко применяются в различных областях, включая социологию, организационное поведение и здравоохранение. SAOM представляют собой гибкую структуру для моделирования динамики социальных сетей и получения представления о механизмах, определяющих образование и распад связей с течением времени [@snijdersModelingCoevolutionNetworks2007]. SAOM часто узнают по ее программной реализации, известной как SIENA.

***Модели, основанные на связях (TERGMs).*** Временные модели экспоненциальных случайных графов (TERGM), предложенные П. Кривицким и М. Хандкоком [@krivitskySeparableModelDynamic2014], используют другой подход, фокусируя внимание на связях. Эти модели рассматривают образование и распад связей с течением времени, исследуя глубинные механизмы, приводящие к изменениям в структуре сети. TERGM особенно полезны для отражения динамики и зависимостей на уровне связей.

***Диадические сетевые авторегрессионные модели (DyNAMs).*** Диадические сетевые авторегрессионные модели, предложенные К. Штадтфельдом и его коллегами [@stadtfeldRejoinderDyNAMsGrounds2017], сочетают в себе временное измерение и моделирование на основе акторов. В этих моделях изучается то, как отдельные участники влияют и испытывают на себе влияние изменений в их ближайшем сетевом окружении с течением времени. DyNAM обеспечивают тонкое понимание того, как локальные взаимодействия способствуют глобальной сетевой динамике.

***Реляционные модели событий (REM).*** Реляционные событийные модели, впервые предложенные К. Баттсом [@buttsRelationalEventFramework2008], работают на пересечении временного моделирования и моделирования на основе связей. REM предназначены для анализа данных с временными метками, где события или взаимодействия происходят в определенные моменты времени. Они позволяют выявить временные зависимости и последовательности событий, определяющие развитие сети, что делает их подходящими для областей, где важно точное время событий.

Временной стохастический подход открывает большие перспективы в различных областях, включая социальные науки, эпидемиологию, коммуникационные сети и т.д. В наукометрии, включающей количественный анализ научной литературы, коллабораций и распространения знаний, все чаще признается ценность анализа временных сетей [@wangQuantitativeExplorationReasons2018; @kroneggerCollaborationStructuresSlovenian2012; @akbaritabarItalianSociologistsCommunity2020; @smithUnderstandingCollaborationPatterns2023]. Временной стохастический подход представляет собой мощную призму, через которую исследователи могут изучать меняющийся ландшафт научных коммуникаций, распространения знаний и сетей сотрудничества. По мере развития наукометрии включение временных стохастических подходов расширяет аналитические возможности этой области.

### Базовая модель ERGM
В данном разделе представлена общая формула экспоненциальных моделей случайных графов. Существуют различные разновидности ERGM, но суть базовой ERGM заключается в обнаружении того, как формирование и исчезновение отдельных связей влияет на сетевые конфигурации (подсети) и на глобальную структуру сети. Иными словами, базовая модель ERGM концентрирует внимание на связях между узлами.

Идея, лежащая в основе базовой модели ERGM, заключается в следующем [@skyler2021]. Дана наблюдаемая сеть $N$ с $E$ бинарными связями (которые либо присутствуют, либо отсутствуют, но не имеют значений) и $V$ узлами. $\mathcal{N}$ содержит множество всех возможных конфигураций связей сети $N$ с таким же, как в $N$, количеством узлов. Для оценки правильной вероятностной модели для сети $N$, применяется подход максимального правдоподобия. С помощью него ищется модель, которая максимизирует вероятность наблюдения исходной сети $N$, *которую мы действительно наблюдали*, $\mathcal{P}(N)$, где $\mathcal{N}$ – это набор всех возможных сетей, которые *мы могли бы наблюдать*.

Ниже представлена формула вероятности наблюдения $N$ в базовой модели ERGM:

$$\mathcal{P}(N,\boldsymbol{\theta})=\frac{\text{exp}\{\boldsymbol{\theta}'\mathbf{h}(N)\}}{\sum_{N^* \in \mathcal{N}} \text{exp}\{\boldsymbol{\theta}'\mathbf{h}(N^*)\}} ,$$

где
- $\boldsymbol{\theta}$ вектор вещественнозначных параметров;
- $\mathbf{h}(N)$ вектор статистик наблюдаемой сети (напр. число связей, число треугольников);
- $N^*$ – это один из элементов $\mathcal{N}$.

Для простоты интерпретации разобьем уравнение на четыре части:
- $\mathbf{h}(N)$ отражает статистики сети;
- $\boldsymbol{\theta}$ содержит эффекты;
- ${\text{exp}\{\boldsymbol{\theta}'\mathbf{h}(N)\}}$ придает положительный вес наблюдаемой сети $N$;
- ${\sum_{N^* \in \mathcal{N}} \text{exp}\{\boldsymbol{\theta}'\mathbf{h}(N^*)\}}$ нормализует все возможные конфигурации $N$ в $\mathcal{N}$.

Базовая модель ERGM, как и другие разновидности, основаны на некоторых теоретических предположениях о сетях [@lusher2012a]:

1. Сети возникают локально.

2. На связи в сети влияют как эндогенные, так и экзогенные эффекты.

3. По сетевым характеристикам можно судить о протекающих в сети структурных процессах.

4. Несколько структурных процессов могут протекать в сети одновременно.

5. Сети, с одной стороны, структурированы, но, с другой, случайны.

### Спецификация ERGM
Можно выделить три вида процессов формирования связей в сетях. Как показано на Рисунке \ref{TiesFormation}, к ним относятся самоорганизующиеся сетевые процессы (self-organizing network processes); процессы, основанные на атрибутах акторов (attribute-based processes), и экзогенные диадические ковариаты (exogenous dyadic covariates) [@lusher2012a].

![Классификация процессов формирования социальных связей\label{TiesFormation}](../images/22_3.png)

*Сетевая самоорганизация (Network Self-Organization)*. Сетевая самоорганизация подразумевает присущую связям в сети способность самоорганизовываться в различимые паттерны под влиянием определенных типов связей. Данные эффекты называются “эндогенными”, поскольку являются результатом внутренней динамики связей сети. Можно также встретить обозначение эндогенных эффектов как "чисто структурных", из-за отсутствия влияния атрибутов акторов или внешних факторов на связи в сети. Классическим примером служит степенной эффект (degree-based effect), широко известный в социальных науках как эффект Мэтью [@priceLittleScienceBig1963]. Данный эффект подразумевает, что чем популярнее узел в сети, тем большую популярность он приобретает.

*Атрибуты акторов (actor attributes)*. Оказывать влияние на процесс формирования связей также могут различные атрибуты акторов: демографические характеристики, статус занятости, установки и т.д. В контексте ERGMs обычно используется термин “эффекты акторов-взаимодействий” (actor-relation effects), обозначающий влияние определенного атрибута актора на связь в сети. В качестве примера можно привести гомофилию – тенденцию образования связей между узлами с одинаковыми атрибутами.

*Экзогенные контекстуальные факторы: диадические ковариаты (exogenous contextual factors: dyadic covariates)*. Экзогенные контекстуальные факторы часто рассматриваются как ковариаты диадической связи (то есть как влияющие на связь характеристики двух акторов), хотя ими и не ограничиваются. Например, диадическая ковариация может включать другую социальную сеть как фиксированный внешний компонент модели. В таком сценарии ERGMs может быть использован для проверки того, может ли наличие ковариационной связи предсказать возникновение соответствующей связи в интересующей нас сети. Например, рассматривая, как работники вступают в общение со своим руководителями, ERGMs позволяют определить, как нисходящие структуры с централизованными полномочиями взаимодействуют с восходящими неформальными сетями.

Как было указано выше, термины в ERGMs отличаются от тех, которые используются в традиционных статистических моделях. В обычной модели набор данных представляет собой набор переменных (результирующей/результирующих и предикторов), которые, хоть и могут коррелировать между собой, измеряются независимо для каждого наблюдения. Однако в ERGMs предикторы принимают особую форму – это функции, которые относятся к связям.

Список терминов из пакета ergm c краткими представлен в [@morrisSpecificationExponentialFamilyRandom2008]. Данные термины определяются с использованием формулы R, которая включает как сеть, так и сетевые статистики:

$y$ ~ <$term1$> + <$term2$> + ...,

где $y$ – объект сети, а <$term1$> и <$term2$> – предопределенные термины, выбранные из списка [@morrisSpecificationExponentialFamilyRandom2008]. 

Рассмотрим наиболее распространенные термины для направленных и ненаправленных связей в пакете ergm в R.

- *Edges* – сетевая статистика, обозначающая количество связей в сети. Для ненаправленных сетей значение edges равно *kstar(1)*; для направленных – как *ostar(1)*, так и *istar(1)*.
- *Density* – сетевая статистика, обозначающая плотность сети. Для ненаправленных сетей плотность равна *kstar(1)* или значению *edges*, деленному на $n(n - 1)/2$; для направленных сетей плотность равна значению edges или *istar(1)* или *ostar(1)*, деленному на $n(n - 1)$.
- *Mutuality* – сетевая статистика (только для направленных сетей), обозначающая количество пар акторов $i$ и $j$, для которых существуют $(i→j)$ и $(j→i)$.
- *Asymmetric dyads* – сетевая статистика (только для ненаправленных сетей), обозначающая количество пар акторов, для которых существует либо $(i→j)$, либо $(j→i)$*. 

Возможно включить в модель эффекты атрибутов узлов *(nodal attribute effects)*, то есть основные эффекты *(main effects)* и эффекты взаимодействия *(interaction effects)*. Первые могут быть использованы для непрерывных ковариат или дискретных факторов; а последние – для связей, относящихся к категориальным атрибутам узлов.

Подобно узлам, атрибуты, относящиеся к диадам и связям, могут влиять на формирование связей. Атрибуты диад *(dyadic attributes)* включают тип связей (например, родство или неродство) и наличие нескольких разных связей между узлами *(multiplexity)*. Атрибуты связей *(edge attributes)* включают в себя как атрибуты диад, так и специфические свойства, уникальные для связей (например, ее продолжительность).

Распределение степеней *(degree terms)* отражает частотное распределение степеней узлов, включая каждый узел только один раз. Распределение звездных конфигураций *(star terms)*, напротив, отражает распределение “k-звездных” конфигураций, где один и тот же узел может присутствовать, и соответственно, подсчитываться, в нескольких конфигурациях. Для анализа доступны как параметрические линейные комбинации, так и полностью непараметрические вариации обеих статистик.

В заключение, ERGMs предоставляют возможность проверять и сравнивать в единой аналитической рамке различные гипотезы о том, что влияет на возникновение наблюдаемой структуры сети.

### Оптимизация, оценка модели и критерий соответствия
Задача статистического вывода – согласовать распределение отдельных статистик с распределением наблюдаемой сети, по сути, подобрать модель, которая обеспечивает наиболее надежную поддержку данных. Мы устанавливаем это соответствие, определяя распределение таким образом, чтобы значения статистик из него в среднем совпадали с наблюдаемыми [@lusher2013]. Определение адекватности модели, характеризуемой вектором параметров, зависит от ее способности точно воспроизводить структурные особенности, лежащие в основе сети. По сути, оптимизация заключается в оценке того, насколько эффективно сети, полученные в результате моделирования, воспроизводят заданные структурные особенности сети. Эти структурные особенности могут включать такие показатели, как количество связей, транзитивных триад, реципроктность и др.

Важно отметить, что данная оценка относится в первую очередь к подгонке модели для конфигураций, явно включенных в модель. Однако необходимо понимать, что эта оценка не является полной оценкой соответствия (Goodness of Fit, GoF). Оценка соответствия выходит за эти рамки и включает в себя оценку того, насколько хорошо модель отражает закономерности, которые не были явно смоделированы, обеспечивая тем самым более полную оценку общей адекватности модели. Методики, используемые в процессе оценки, могут отличаться в зависимости от конкретного программного обеспечения, однако все они имеют общий подход, основанный, прежде всего, на оценке максимального правдоподобия (MLE), проводимой в рамках моделирования с использованием Марковской цепи Монте-Карло (MCMC).

В общем виде основные этапы процесса оценки включают в себя:

1. Инициализация значений параметров. Начните с получения начальных значений параметров, обычно с помощью процесса инициализации.
2. Генерация случайных графов. Приступают к генерации случайных графов при существующем векторе параметров. Эти синтетические графы генерируются в процессе моделирования.
3. Обновление значений параметров. Обновление значений параметров путем оценки распределения сгенерированных графов по сравнению с наблюдаемыми графами.
4. Итеративное уточнение. Итерационный процесс генерации случайных графов и обновления значений параметров (шаги 2-3) выполняется до тех пор, пока не будет достигнута точка сходимости, означающая стабилизацию оценок параметров.

Такой итерационный и имитационный подход является основополагающим при оценке параметров в рамках экспоненциальных моделей случайных графов (ERGM) и им подобных моделей. Хотя у нас есть возможность проводить тесты оценки соответствия (GoF) для отдельных параметров и наборов параметров (тест Вальда, тест множителей Лагранжа и тест отношения правдоподобия), важно отметить, что эти тесты требуют спецификации конкретной альтернативной модели [@lusher2012a]. Следовательно, задача сводится к оценке пригодности данной модели по отношению к альтернативной, что ставит наши результаты в зависимость как от выбора модели, так и от наличия подходящих альтернатив. Для устранения этого недостатка Робинс, Паттисон и Вулкок [@robins2005] предложили подход имитационного моделирования. Он позволяет исследовать целый спектр характеристик графа. Основная концепция заключается в оценке способности модели эффективно отражать те аспекты данных, которые не были явно заложены в саму модель. Например, может ли параметр ребра и чередующиеся треугольники адекватно объяснить наблюдаемую среднюю длину пути или наблюдаемое распределение степеней? Такая процедура позволяет провести более комплексную оценку эффективности модели, чем обычная проверка гипотез.

### Темпоральный ERGM (TERGM)
Как определено в работе Лейфельда и Кранмера, TERGM развивают идею, заложенную в ERGM [@leifeld2018]. Они определяют вероятность сети на текущем временном шаге $t$ как функцию не только суммы подсчетов подграфов текущей сети, но и предыдущих сетей до временного шага $t-K$:

$$P(N^t|N^{t-K},\dots,N^{t-1},\theta)=\frac{\exp(\theta^Th(N^T,N^{t-1},\dots, N^{t-K}))}{c(\theta, N^{t-K},\dots,N^{t-1})}.$$

При этом предполагается, что статистические показатели, полученные на основе связей между временем $t – K$ и временем $t$, эффективно отражают присущие сети зависимости в момент времени $t$. Эта простая идея лежит в основе TERGM. В знаменатель этой формулы входит нормирующая константа, аналогичная той, что используется в ERGM. На следующем этапе определяется вероятность, связанная с временным рядом сетей, путем вычисления произведения всех временных периодов:

$$P(N^{K+1},\dots,N^T|N^1,\dots,N^k,\theta)=\prod_{t=K+1}^T P(N^t| N^{t-K},\dots, N^{T-1}, \theta).$$

Это представляет собой простое расширение ERGM на последовательность сетей. Для учета временных зависимостей между последовательными временными шагами вводится статистика сети $h$, позволяющая включать в анализ временной аспект. Лейфельд и коллеги предлагают исчерпывающее рассмотрение этого вопроса [@leifeld2018].

Граф зависимости TERGM, формально определяющий зависимость одной диады от другой, может моделировать зависимость между моделируемыми переменными в нескольких различных временных точках [@leifeld2018]. В отличие от многих других моделей, TERGM воздерживается от предположений об интервалах между последовательными временными шагами, будь они длинными или короткими, непрерывными или дискретными. Она не зависит от того, последовательно или одновременно формируются ребра сети в процессе генерации данных. Основным требованием является то, что результат может быть переведен в термин зависимости, который легко вписывается в вектор *h*. Эта гибкость, присущая TERGM, коренится в некоторых ограничениях, накладываемых на статистику *h*, что позволяет ей учитывать широкий спектр сетевых структур.

Оцениваемые параметры можно рассматривать как логарифмические коэффициенты вероятности установления связи внутри сети с учетом конфигурации и выбранных параметров остальной части сети и влияния до *K* предшествующих сетей. Для оценки параметров часто используется оценка максимального правдоподобия Марковской цепи Монте-Карло (MCMC-MLE) [@hanneke2010]. Эти методы оценки удобно реализованы в пакете *btergm*, специально разработанном для среды статистических вычислений *R* [@leifeld2018].

### Исследование структур в наукометрических исследованиях: перспективы и использование ERGM и TERGM
Применение ERGM и TERGM к библиометрическим сетям выглядит очень логичным, и исследование в этой сфере появились не в последние годы. В тексте ниже мы показываем какие исследования с применением экспоненциальных случайных графов в сфере библиометрических исследований существуют, какие научные сообщества в каких странах и регионах были исследованы, и какие выводы могут быть сделаны относительно библиометрических сетей. ERGM позволяет моделировать не отдельные отношения между акторами, а целую сеть; однако, экспоненциальные модели случайных графов могут работать только с бинарными данными и не адаптированы для динамического анализа. TERGM является продолжением экспоненциальных моделей случайных графов – темпоральным экспоненциальным моделированием случайных графов. Это разновидность модели, рассматривающей отдельные состояния графа в равноудаленные моменты времени. В случае библиометрических исследований с помощью ERGM можно рассматривать библиометрические сети для одного момента времени, а с помощью TERGM можно моделировать ту же библиометрическую сеть для разных лет и, соответственно, оценивать эффекты, влияющие на сети в динамике. Однако TERGM также может работать только с бинарными данными, и у исследователей возникают вопросы по интерпретации влияния временных зависимостей на уровне сетевых связей [@block2018a].

#### Библиометрический анализ: применение ERGM
Модель ERGM появилась около 15 лет назад. Распространению моделей ERGM во многом способствовало появление пакета statnet и реализация в нем ERGM [@krivitsky2012], [@krivitsky2014].

Большинство статей, использующих ERGM для моделирования библиометрических сетей, представляют работы, анализирующие состояние той или иной научной области, и авторы статей являются представителями этой дисциплины. Например, Окамото Джанет – директор Центра оценки здоровья населения – в 2015 году опубликовала статью, в которой проанализировала сеть партнерств в области изучения неравенства в здравоохранении [@thecentersforpopulationhealthandhealthdisparitiesevaluationworkinggroup2015]. Аналогичная ситуация складывается с исследователями в области компьютерных наук [@al-ballaa2019a], информационно-поисковой сферы [@zhang2016a] или исследователями научных инноваций из региона на западе Китая [@hou2023a]. Хотя эти исследования демонстрируют лишь практическую реализацию модели ERGM и каждое из них содержит ограничения, реалистичные для всех моделей ERGM, они могут продемонстрировать важные наблюдения о своих предметных областях и быть полезными для ученых, академических институтов, государств и бизнеса.

Другой уровень исследований представляет собой изучение научных коллабораций на уровне отдельных стран или регионов. Заслуживают внимания следующие исследования: изучение сети патентного цитирования в Европе [@chakraborty2020a], изучение словенских научных сообществ на примере 4 наук (физики, математики, биотехнологии и социологии) [@kronegger2012], исследование сотрудничества британских исследователей по финансируемым проектам [@smith2023a]. Хотя на данном этапе научные исследования могут сказать больше о состоянии науки и структуре научных коллабораций в стране или регионе, они страдают и от более серьезных ограничений: например, авторы исследования европейских патентов говорят о том, что за определенными ссылками на патенты в некоторых компаниях может стоять структура и цель, которые они не могут четко определить [@chakraborty2020a].

Последний уровень библиометрических исследований с использованием ERGM – это проекты, в которых исследователи пытаются понять общий характер сотрудничества между различными дисциплинами или субдисциплинами или состояние международной науки. Например, в 2013 году, в момент начала широкого распространения ERGM, Даниэле Фанелли решил выяснить, как выглядят 12 научных дисциплин: как объясняет Фанелли, на структуру дисциплин влияет характер дисциплины: для сложных и специфических явлений исследователи с меньшей вероятностью достигнут теоретического и методологического консенсуса [@fanelli2013].

#### Библиометрический анализ: применение TERGM и VERGM
Помимо ERGM, ученые могут использовать также TERGM – Temporal Exponential Random Graph. Исследований с применением TERGM в библиометрическом анализе не так много, и это связано с характером моделей: они требовательны к вычислениям. В 2023 году Трэвис Витшелл решил узнать, влияет ли политический режим государств на международное научное сотрудничество,  проанализировал данные о международном научном сотрудничестве по 170 странам за 2008-2017 гг. и обнаружил, что демократический режим является хорошим предиктором более частого международного научного сотрудничества [@whetsell2023a]. Это исследование является хорошим примером исследования, охватывающего сразу большой временной период и использующего TERGM. Кроме того, Уитшелл использует модель Value-temporal Exponential Random Graph (VERGM), и именно ее использование и оценка вероятности возникновения новых отношений на небинарных данных о сотрудничестве дает Уитшеллу наиболее точные результаты. 

Как видно, авторы работают с различными сетями: сетями соавторства, сетями патентного цитирования, бимодальными сетями научного сотрудничества и финансирования исследовательских проектов. В исследованиях в основном используется ERGM, однако другие исследователи применяют TERGM и VERGM. В целом область исследований на стыке библиометрических исследований и применения ERGM можно описать как состоящую из трех видов исследований: исследований отдельной области научного знания, исследований сетей отдельных дисциплин, исследований состояния науки в целом.

### Заключение
В заключение следует отметить, что область научного взаимодействия и сетей сотрудничества испытывает острую потребность в разработке моделей, основанных на данных, для лучшего понимания процесса распространения знаний. Изучение научного взаимодействия, социальных и когнитивных структур в различных научных областях успешно проводится с помощью библиометрии и наукометрии, причем особое внимание уделяется анализу временных библиографических сетей, таких как соавторство, цитирование, совместное цитирование и библиографическое сопряжение. Эти модели должны включать в себя как реалистичные временные структуры, так и кросс-секционные особенности.

Исследователи применяют различные методы для изучения научного сотрудничества, при этом анализ сетей соавторства является одним из доминирующих подходов благодаря простоте извлечения данных из баз данных публикаций. Однако он требует тщательной очистки данных.

В докладе обсуждались возможности применения экспоненциальных моделей случайных графов (ERGM) в наукометрических исследованиях, подчеркивалась значимость стохастических методов в сетевом анализе. Детерминированный подход служит основой для более сложных аналитических методик и включает в себя глобальные свойства, локальные свойства и методы разбиения для анализа сетей. Также было рассмотрено применение ERGM и TERGM к библиометрическим сетям, что свидетельствует об их универсальности при моделировании различных типов сетей, таких как сети соавторства, сети цитирования патентов, сети финансирования научных проектов.

В целом, пересечение библиометрических исследований и применения ERGM охватывает исследования конкретных областей научного знания, изучение сложных сетей и анализ состояния самой науки. Это направление исследований подчеркивает потенциал анализа временных сетей, позволяющий пролить свет на меняющийся ландшафт научной коммуникации и генерации знаний в области наукометрии.