## Внедрение внешних знаний в языковые модели
Большие языковые модели, основанные на BERT, GPT, T5, постоянно обновляют рекорды во многих задачах понимания и генерации естественного языка (NLU и NLG). Однако, из-за отсутствия механизмов представления знаний, большие языковые модели имеют ограниченную возможность обучения которая может быть восполнена благодаря использованию механизмов внедрения знаний.

Знания, внедряемые в языковую модель могут иметь разную структуру и происхождение. Так, в работе [@hu2023], авторы выявляют четыре крупных категории внедряемой информации в зависимости от её происхождения:
- использование лингвистических знаний;
- использование текстовых знаний;
- использование графа знаний;
- использование правил и эвристик.

### Использование лингвистических знаний
Лингвистические знания, в основном представленные в виде лексической информации и синтаксических деревьев, являются наиболее распространенной вспомогательной информацией для языковых модели [@yu2022]. Лингвистические знания также включают информацию о частях речи (POS-тегирование) и тональность слов [@lauscher2020]. Модель LIBERT (lexically-informed BERT) добавляет к традиционным задачам для предобучения BERT прогнозирование лексических отношений. Модель прогнозирует отношени синонимии, гиперонимимии и гипонимии, что позволяет в дальнейшем лучше моделировать семантическую информацию.

![Модель LIBERT](images/LIBERT.png){#fig:LIBERT}

SenseBERT [@levine2020a] добавляет к стандартной задаче заполнения замаскированного токена прогнозирование таксономический класс токена, например, существительное.еда, существительное.состояние за счет чего лучше учитывает семантический контекст.

![Модель SenseBERT](images/SenseBERT.png){#fig:SenseBERT}

SKEP [@tian2020] схожим образом кодирует тональность слов что позволяет повысить внимание модели к тональной лексике и дает прирост в интерпретабельности модели.

![Модель SKEP](images/SKEP.png){#fig:SKEP}

DictBERT [@chen2022] принимает лексические знания из словаря в качестве внешнего источника и повышает качество предобученияза счет контрастного обучения.

![Модель DictBERT](images/DictBERT.png){#fig:DictBERT}

Интерес представляет модель Syntax-augmented BERT [@sachan2021] использующая графовые нейронные сети для моделирования синтаксических связей, полученных из деревьев зависимостей, для улучшения языкового моделирования. Эта модель демонстрирует подход по встраиванию выхода GAT в языковую модель

![Модель Syntax-augmented BERT](images/Syntax-augmented%20BERT.png){#fig:Syntax-augmentedBERT}

### Использование текстовых знаний
Текстовые знания обычно используются для повышения качества поиска или вопрос-ответных систем. UDT-QA [@ma2022] используют текст, граф знаний и таблицы знаний вместе, и встраивают объединенный вектор в verbalizer-retriever-reader цепочку.

KNN-LM [@khandelwal2019] выбирает ближайших K ближайших соседей из обучающих образцов в языковую модель в качестве гипотез чтобы повысить качество прогнозирования маскированных токенов. ExpBERT [@murty2020] [46] и KEAR [@xu2022] также включают текстовые описания в свои модели для улучшения работы механизма внимания. Kformer [@yao2022] [48] получает некоторые внешние текстовые знания через извлечение и вводит их в слой полносвязанной сети.

### Использование графа знаний
Граф знаний можно описать как набор троек формата <головная сущность>, <отношение>, <хвостовая сущность>, где каждая тройка отражает отношение между двумя сущностями через определенное отношение [@ji2022]. KG может быть представлен как 𝐺 = {𝐸, 𝑅, 𝑇}, где 𝐸 - множество сущностей, 𝑅 - множество отношений и 𝑇 - множество троек. Термин RDF - это либо URI u ∈ U, либо пустой узел b ∈ B, либо литерал l ∈ L. Узлы URI (или IRI) служат для глобальной идентификации сущностей в Web, а узлы литералов - для их идентификации.

Благодаря более структурированной по сравнению с текстом информации граф знаний может быть более применимым для обучения моделей чем предыдущие источники [@choudhary2021] [57], [@fang2023] [58], [@li2023].

В общем случае архитектура встраивания графов знаний в языковую модель показана на рисунке ниже.

![Общая арзитектура внедрения знаний в языковую модель](images/KG%20Injection%20Architecture.png){#fig:KGArch}

Один из подходов к обучению модели является разработка механизма предварительного обучения, с использованием триплетов. [@qin2021], [@wang2020b], [@zhang2022], [@wang2022]. ERICA [@qin2021] представляет подход на основании контрастного обучения для дискриминации сущностей, так и отношений. KEPLER [@wang2020b] обучает функцию потерь на триплетах и языковую модель одновременно.

![Модель KEPLER](images/KEPLER.png){#fig:KEPLER}

DKPLM [@zhang2022] обогащает семантическую информацию редко встречаемых сущностей знаниями из графов знаний. KP-PLM [@wang2022] разрабатывает два механизма предобучения, связанные с знаниями о тройках, чтобы интегрировать знания троек в несколько непрерывных подсказок для задач естественного языка.

Второй способ - изменить механизм внимания модели [@sun2020], [@liu2019]. K-BERT [@liu2019] использует уровень знаний для иньекции соответствующих троек из графа знаний во входное предложение и преобразует его в дерево предложения с обилием знания для управления областью каждого слова в предложении, предотвращая отклонение предложения от правильной семантики. Если K-BERT расширяет входной текст в дерево предложения, то базовой концепцией CoLAKE [@sun2020] является расширение контекста ввода в графы слов-знаний (WK-графы), а затем подача этих построенных WK-графов в маскированное внимание, чтобы собирать информацию узлов.

Третий способ - изменить структуру модели, который обычно включает модуль графа знаний. K adapter [@wang2020] и KB-adapters [@emelin2022] интегрируют знания в PLM через внешние адаптерные модули. KLMO [@he2021] использует компонент, названный агрегатор знаний, для слияния вложений входного текста и КГ, в котором применяется перекрестное внимание на уровне сущности КГ для интерактивного моделирования сегментов сущностей в тексте, а также сущностей и отношений в КГ. KERM [@dong2022] разрабатывает модуль внедрения знаний, который объединяет информацию между корпусом текстов и КГ для задачи переупорядочивания прохода, как показано на рисунке ниже. JointLK [@sun2022] и GreaseLM [@zhang2022a] используют GNN для моделирования извлеченных графов знаний и связывают LM с модулями GNN для совместного рассуждения при рассуждении о здравом смысле.

![Модели KLMO и KERM](images/KLMO.png){#fig:KLMO}

### Использование правил и эвристик
Логические правила всегда содержат четкие предикативные инструкции и могут формализовывать знания из внешних источников [@vonrueden2021]. Включение этого типа знаний в большие языковые модели может повысить обучаемость благодаря высокой интерпретируемости. Так, RuleBERT [@saeed2021] использует получает правила Хорна из существующего корпуса, чтобы создать обучающий набор данных и затем донастроить модель на нем. Он применяет вероятностную модель ответа для извлечения мягких правила из языковой модели. Результаты показывают, что языковые модели, работающие с мягкими правилами на естественном языке, могут повысить свою производительность для задач умозаключения. Кроме того, PTR [@han2021] может включать логические правила для составления вручную доменно- и задачно- специфических подсказок, позволяющих модели могла закодировать задачно-связанные предварительные знания при настройке подсказок и генерировать более интерпретируемые подсказки. И RuleBERT, и PTR включают правила знания на этапе донастройки модели.

### Использование социально-сетевых графов
Одним из источников знаний для улучшения качества модели является социальный граф, построенный под решаемую задачу. Эта информация в большом количестве доступна в онлайн социальных сетях.

При этом группы онлайн-социальных сетей являются предпочтительными для моделирования структуры языка из-за следующих характеристик:
- Группы и публичные страницы (далее "группы") имеют свои собственные страницы. Тексты, размещенные на страницах групп, в основном монотематичны, так как пользователи групп делятся общим интересом или обсуждают новости, важные для определенного географического региона. В обоих случаях возможно выделить специфическую лексику и речевые особенности группы.
- Количество групп значительно меньше, чем количество пользователей. Это позволяет создать языковую модель, подходящую для всей онлайн-социальной сети, без значительных затрат на фильтрацию узлов и вычислений.
- Группы генерируют основную часть текстового контента, в то время как многие пользователи социальных сетей не пишут ни одного слова в течение нескольких лет, так как выступают только в роли потребителей контента.

В то же время интересы пользователей довольно легко выражаются через группы, на которые они подписаны. Рассматривая группу как автора текстов, написанных от имени этой группы можно оценить близость групп через пересечение общих пользователей, чтобы группы с совпадающими подписчиками имели схожие языковые модели.

Предлагаемая модель учитывает характеристики домена, используя предварительно вычисленный социальный вектор для анализа каждого токена входного текста. Общий процесс обучения следующий:

- Генерация матриц смежности на основе сетевых данных - подготовка матриц для оценки смежности двух групп на основе взаимных членов группы.
- Обучение социальных векторов - получение векторов авторов с использованием алгоритмов факторизации и случайного блуждания.

Обучение BERT с использованием предварительно обученных социальных векторов.

#### Генерация векторных предтсавлений групп
При вычислении социального вектора целесообразно использовать информацию о локальной среде сообщества, а также описания его глобального положения относительно всех групп. Для имитации локального контекста хорошо подходит алгоритм DeepWalk. Чтобы учесть структуру наших социальных графов на более глобальном уровне, можно также использовали факторизацию различных видов попарных матриц расстояний между группами.

Альтернативой подходу выше является факторизация попарной корреляционной матрицы групп. Рассматривя группу как вектор нулей и единиц длиной, равной общему числу пользователей в социальной сети N, и содержащий 1 для пользователей, подписанных на моделируемую группу, и 0 в противном случае. Вычисление корреляции может быть реализовано без загрузки всей матрицы в оперативную память на основе легко вычисляемых переменных: для набора A подписчиков группы a и набора B подписчиков группы b мы, как описано в предыдущем разделе, вычисляем размер пересечения |A ∩ B|.

#### Обучение модели BERT
Полученные векторы, полученные в результате случайного блуждания или SVD, могут интегрированы в существующую модель BERT для того чтобы научить модель обращать внимание на вектор социальной сети. Для этого может использоваться несколько различных способов встраивания социальной информации:

- добавление специального вектора социальной сети, который объединяет оба характеристики в начале каждой последовательности (внедрение токена Zero).
- добавление специального слоя "социального внимания" (SAT) на различных позициях в существующей модели BERT, как описано ниже.

Общая схема обеих подходов показана на рисунке ниже.

![Модель SocialBERT](images/SocialBERT.png){#fig:SocialBERT}

Для лучшего внедрения информации о социальной сети в языковую модель предлагается использовать специальный слой SAT, показанный на рисунке ниже.

![SAT слой модели SocialBERT](images/SocialBERT2.png){#fig:SocialBERT2}

Механизм встраивания зависит от двух гиперпараметров: i - номер слоя BERT, выбранный для замены на SAT слой, и C - количество каналов для использования в SAT слое. Для встраивания слоя социального внимания сначала мы предварительно обучаем базовую модель BERT на всем обучающем наборе данных в течение одной эпохи. Затем выполняется заморозка всех слоев модели и замена i-го слоя SAT слоем.

При построении SAT слоя предлагается использовать двухслойный персептрон с функцией активации GELU между слоями и активацией SoftMax после второго слоя. Векторы социальной сети передаются через этот MLP, в результате получаются получая новые векторы W с уменьшенной размерностью до C.
Затем создается C параллельных слоев BERT, каждый инициализированный как замена i-го слоя оригинального BERT. Выход SAT слоя является суммой векторов, полученных умножением каждого из параллельных слоев BERT на соответствующий элемент социального вектора W. Идея этого метода заключается в том, чтобы обучить каждый из наших C слоев BERT настраиваться на надмножество тем социальных сетей, а затем представить каждого автора как композицию этих надмножеств.

Предложенная модель может быть оценена с использованием качества прогнозирования отсутствующего элемента в предложении и показателя перплексии, используемого в оригинальных работах, таких как BERT и RoBERTa. Абсолютное значение перплексии для данной модели зависит от многих параметров, таких как размер словаря модели, параметры токенизации и набор данных для донастройки. Таким образом, довольно сложно оценить прямое влияние перплексии на решение какой-либо прикладной задачи. Наш случай дополнительно осложнен необходимостью подготовки собственной эталонной выборки, так как, насколько нам известно, ни один из существующих наборов данных не содержит информацию о социальных связях автора, используемых нашей моделью.

С другой стороны, разница в перплексии для одной и той же базовой модели, обученной на полностью идентичном корпусе с одинаковой предварительной обработкой, должна отражаться на качестве применяемых задач, как показано авторами статьи о RoBERTa и оригинальным BERT: по мере уменьшения перплексии, повышается качество классификации на наборе данных SST-2 (для RoBERTa и BERT), MNLI-m и MRPC (для BERT). Таким образом, разница в перплексии для двух изначально идентичных моделей BERT, обученных на одних и тех же текстах, указывает на более высокую обучаемость и дальнейшую эффективность модели с более низкой перплексией.

В оригинальной статье BERT сообщается о перплексии 3,23 для модели с 24 слоями и входного токена 1024. Модель BERT Base, обученная на том же корпусе, имеет перплексию не менее 3,99 как для английского, так и для русского языка. Это можно объяснить значительным разнообразием тем, и даже языков, охватываемых этими моделями. Поскольку тексты онлайн-социальных сетей (ОСС) являются подмножеством всего массива текста, обучение только на ОСС позволяет снизить перплексию до 2,83 для многоязыковой базовой модели BERT (RuBert ОСС). Дальнейшее улучшение возможно за счет использования дополнительной информации о социальных векторах, что позволяет снизить показатель оценки до 2,72.

Такая модель может быть полезной для всех задач понимания языка, прежде всего, для сопоставление сущностей, проверка правописания и извлечение фактов. Модель показывает очень многообещающие результаты на коротких сообщениях и текстах с бедным контекстом:

- Полученные примеры демонстрируют, что модель успешно учитывает региональные особенности. Например, для шаблона "набережная [MASK]", базовая модель BERT рекомендует "осенняя набережная", тогда как модель, инициализированная региональными группами Санкт-Петербурга, предлагает "Невская набережная" на основе реки Невы в Санкт-Петербурге.
- Модель может быть полезна для задач прогнозирования связей на коротких текстах. Например, для шаблона "мы сегодня прочитали [MASK] Александра", базовая модель BERT возвращает "мы сегодня прочитали Александра Королёва" (актер и продюсер), тогда как модель с инициализацией векторов группы поэзии возвращает "мы сегодня прочитали Александра Блока" (известный поэт).
- Модель также полезна при определении профессионального жаргона. Например, для заданного шаблона "Big [MASK]", базовая модель BERT возвращает "Big bro", тогда как модель с вектором группы Data Science возвращает "Big data".