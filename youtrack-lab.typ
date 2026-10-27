#import "youtrack-lab-report.typ": report
#import "title-page-template.typ": title-page
#show: report.with(font: "Times New Roman")
#show raw: set text(font: "DejaVu Sans Mono", size: 0.9em)

#title-page(
  subject: [Экономика программной инженерии],
  work-type: [Лабораторная работа],
  work-number: "2",
  student-name: [Григорьев Давид Владимирович, Иван Жук Александрович],
  student-group: [Р3415],
  reviewer-name: [Блохина Елена Николаевна],
  city: [Санкт-Петербург],
  year: [2026],
  faculty: [Факультет программной инженерии и компьютерной техники],
)
#pagebreak()
#outline(title: [Содержание])
#pagebreak()

#heading(level: 1, numbering: none)[Введение]

Объект работы - планирование разработки MVP медиасайта KOD.RU в YouTrack Cloud. Цель - настроить Kanban-проект, зафиксировать состав команды и ресурсный план, связать план с Git-репозиторием и сформировать метрики на учебной симуляции.

Структура и оформление отчёта адаптированы к основным требованиям ГОСТ 7.32-2017 [#link("https://protect.gost.ru/gost/details/7d280e43-7036-4a69-8e6e-d15867028343")[1]]. В работе созданы проект и доска, настроены роли команды, этапы потока, спринты и релизы, добавлены задачи и записи трудозатрат. Метрики отражают тестовые данные лабораторной, а не фактическую разработку продукта.

= Цель и границы MVP

Цель лабораторной работы - создать рабочее пространство YouTrack для шестимесячного MVP функционального аналога медиасайта KOD.RU, настроить Kanban-процесс, Git-связь и почтовую обработку, внести план, смоделировать несколько переходов и снять отчёты. Для лаборатории выбрана ограниченная граница MVP.

В MVP входят публичная главная и ленты публикаций, рубрики и теги, карточка материала, CMS с черновиками и ролями, базовый поиск, SEO-метаданные, адаптивность, первоначальная загрузка данных, тестирование и поставка. Отложены ИИ-агент, котировки, развитая реклама и полная миграция контента.

Предыдущий расчёт полного аналога давал 6 980 ч наивным методом, 7 317 ч по PERT, 8 877 ч по FP + COCOMO II и 10 300 ч с резервом. В этой работе зафиксирован отдельный сценарий MVP на 10 000 ч. Это не новый пересчёт полного объёма.

= Команда и ресурсный план

В YouTrack созданы 10 учётных записей: два реальных full-stack участника (один из них - администратор) и восемь учебных ролей. Синтетические аккаунты используют зарезервированный домен `example.invalid`; приглашения реальным специалистам не отправлялись. Ресурсный план распределён на 10 условных участников: 166,7 ч на аккаунт в месяц. Это интенсивное учебное допущение, а не фактическая доступность двух реальных участников.

*Таблица 1 - Состав команды и оценка трудоёмкости*

#table(
  inset: (x: 4pt, y: 2pt),
  columns: (6.8cm, 4.1cm, 2.6cm, 1.7cm),
  table.header([*Роль*], [*Тип*], [*Оценка, ч*], [*Задач*]),
  [PM / Product Owner], [мок], [600], [2],
  [Аналитик / UX], [мок], [300], [1],
  [Техлид / архитектор], [мок], [300], [1],
  [Backend-разработчик], [мок], [2 200], [1],
  [Frontend-разработчик], [мок], [1 900], [1],
  [Поиск / интеграции], [мок], [1 000], [1],
  [DevOps], [мок], [1 000], [1],
  [QA], [мок], [1 500], [1],
  [Full-stack A / администратор], [реальный аккаунт], [600], [1],
  [Full-stack участник B], [реальный аккаунт], [600], [1],
)

#pagebreak()
= Ресурсный план по этапам

*Таблица 2 - Ресурсный план по этапам*

#table(
  columns: (11cm, 3cm),
  table.header([*Этап*], [*чел.-ч*]),
  [Требования MVP, UX и архитектура], [900],
  [Платформа и CI/CD], [1 000],
  [CMS и модель контента], [2 200],
  [Публичный интерфейс], [1 900],
  [Поиск, SEO и интеграции], [1 000],
  [Администрирование и загрузка данных], [600],
  [QA, безопасность и приёмка], [1 500],
  [Управление, документация и релизы], [900],
  [*Итого*], [*10 000*],
)
#figure(image("output/pdf/youtrack-lab-figures/phase-effort.svg", width: 100%), caption: [Оценка по этапам проекта])

#pagebreak()
= Настройка YouTrack и процесс

Создан проект KOD.RU MVP с ключом KOD и Kanban-доска. Колонки: Backlog / Ready / Development / Review / Testing / Done. Оценка задач задаётся в часах; включено Time Tracking. WIP-лимит на промежуточных колонках равен 5.

На Kanban-доске включены спринты для учебной burndown-диаграммы. Такая комбинация реализует гибридный режим YouTrack: стандартный Kanban работает без спринтов, но их можно включить в настройках доски [#link("https://www.jetbrains.com/help/youtrack/cloud/set-up-a-kanban-board.html")[2], #link("https://www.jetbrains.com/help/youtrack/cloud/work-with-sprints.html")[3]]. Выполненные в симуляции карточки KOD-1, KOD-2 и KOD-4 закрыты; KOD-3, KOD-5, KOD-6 и KOD-7 оставлены на промежуточных этапах; KOD-8-KOD-11 находятся в начале потока. Всего создано 11 оценённых пакетов работ на 10 000 ч.

*Таблица 3 - Параметры проекта и Kanban-доски*

#table(
  columns: (4.2cm, 10.3cm),
  table.header([*Настройка*], [*Значение*]),
  [Проект], [KOD.RU MVP, ключ KOD],
  [Доска], [KOD.RU MVP Kanban Board],
  [Workflow], [Backlog → Ready → Development → Review → Testing → Done],
  [Типы карточек], [Task; Bug, Story и Epic доступны для расширения],
  [Оценка и время], [Оценка в часах, Time Tracking и поле Spent time],
  [WIP], [Лимит 5 на промежуточных колонках],
  [Спринты и релизы], [13 двухнедельных спринтов и шесть месячных релизов; MVP - R4],
)

#pagebreak()
= Календарный план

План рассчитан на 27.10.2026-26.04.2027. Даты Sprint 08 и 09 скорректированы; в календаре 13 двухнедельных интервалов. Релизы R1-R6 заданы в YouTrack, MVP относится к R4.

*Таблица 4 - Календарь спринтов*

#table(
  columns: (2.3cm, 5.7cm),
  table.header([*Спринт*], [*Плановый интервал*]),
  [S01], [27.10-09.11.2026],
  [S02], [10.11-23.11.2026],
  [S03], [24.11-07.12.2026],
  [S04], [08.12-21.12.2026],
  [S05], [22.12.2026-04.01.2027],
  [S06], [05.01-18.01.2027],
  [S07], [19.01-01.02.2027],
  [S08], [02.02-15.02.2027],
  [S09], [16.02-01.03.2027],
  [S10], [02.03-15.03.2027],
  [S11], [16.03-29.03.2027],
  [S12], [30.03-12.04.2027],
  [S13], [13.04-26.04.2027],
)

*Таблица 5 - Календарь релизов*

#table(
  columns: (2.0cm, 5.3cm, 9.2cm),
  table.header([*Релиз*], [*Интервал*], [*Плановый результат*]),
  [R1], [27.10-26.11.2026], [Discovery / requirements],
  [R2], [27.11-26.12.2026], [Platform and CMS base],
  [R3], [27.12.2026-26.01.2027], [Public UI, categories and search],
  [R4], [27.01-26.02.2027], [MVP: pages, CMS, search and SEO],
  [R5], [27.02-26.03.2027], [Stabilization / hardening],
  [R6], [27.03-26.04.2027], [Closure, docs and metrics],
)

= Интеграции

Проект подключён к GitHub App YouTrack KOD.RU MVP, установленному только для `paryashie-yasheri/epi` [#link("https://github.com/paryashie-yasheri/epi")[7]]. Права: чтение Actions, Contents и Pull requests, управление webhook; Metadata - только чтение. Репозиторий содержит материалы лабораторной, не исходники сайта. Пустой коммит `3b442e5` в ветке `feature/KOD-1-yt-integration` отобразился в KOD-1. Рабочие ветки именуются `feature/KOD-123-short-name`.

Mailbox `kodru@youtrack.cloud` маршрутизирует входящие письма в KOD; проверка с внешнего ящика не выполнена.

= Симуляция и метрики

Смоделированы статусы карточек и пять work items: 120 ч для требований, 80 ч для backlog, 40 ч для архитектуры, 60 ч для CI/CD и 100 ч для модели CMS. Время добавлялось администратором для лабораторной симуляции. Всего списано 400 ч; Time Report содержит 4 100 ч оценок на пяти задачах с записями времени. Типы отчётов по времени и календарному плану описаны в руководстве YouTrack [#link("https://www.jetbrains.com/help/youtrack/cloud/youtrack-reports.html")[4]-#link("https://www.jetbrains.com/help/youtrack/cloud/gantt-chart.html")[6]].

Burndown приведён только для Sprint 01: интервалы S02-S13 запланированы, но их история выполнения не моделировалась. Стартовая оценка S01 - 900 ч на три задачи. Это на 17% выше среднего ориентира 769 ч (10 000 / 13) на спринт и не является оценкой доступной ёмкости команды.

#figure(image("output/pdf/youtrack-lab-figures/assignees.svg", width: 100%), caption: [Количество задач по исполнителям])
#figure(image("output/pdf/youtrack-lab-figures/burndown.svg", width: 100%), caption: [Sprint 01: 3 задачи на 900 ч; на срезе 27.10.2026 две закрыты (600 ч), остаток 300 ч; позднейшие события не моделировались])
#figure(image("output/pdf/youtrack-lab-figures/time-report.svg", width: 100%), caption: [Оценка и записанное время по исполнителям])

= Диаграмма Ганта и выводы

Шестимесячный план показан по месяцам. Нативный Gantt-отчёт YouTrack рассчитан от 27.10.2026 до 15.11.2027: 55 недель против целевого горизонта 26 недель. Крупные задачи не разбиты на параллельные подзадачи, поэтому прогноз выявляет календарный риск. Для производственного графика следует декомпозировать работу, назначить зависимости и повторно рассчитать длительность.

#figure(image("output/pdf/youtrack-lab-figures/gantt.svg", width: 100%), caption: [План-график этапов и сравнение 26-недельной цели с расчётом YouTrack])

Отчёты YouTrack:

- #link("https://kodru.youtrack.cloud/reports/issuesPerAssignee/557-0")[Отчёт по исполнителям]
- #link("https://kodru.youtrack.cloud/reports/burndown/565-0")[Burndown Sprint 01]
- #link("https://kodru.youtrack.cloud/reports/time/227-1")[Отчёт по времени]
- #link("https://kodru.youtrack.cloud/reports/gantt/430-0?view=actual")[Диаграмма Ганта]

#heading(level: 1, numbering: none)[Заключение]

В YouTrack настроены проект KOD.RU MVP, Kanban-доска с шестью состояниями, 13 спринтов, шесть релизов, GitHub App и маршрутизация входящей почты. Команда представлена двумя реальными участниками и восемью учебными ролями. Оценки работ суммируются в 10 000 чел.-ч; MVP запланирован к релизу R4.

Интеграция GitHub подтверждена связью тестового коммита с KOD-1. Для демонстрации отчётов записано 400 ч, при этом отчёт по времени охватывает задачи с оценками 4 100 ч. Эти значения моделируют заполнение YouTrack и не доказывают выполнение полного объёма проекта. Внешняя проверка почты не выполнена; репозиторий содержит материалы лабораторной, а не исходный код KOD.RU.

#pagebreak()
#heading(level: 1, numbering: none)[Список использованных источников]

+ Росстандарт. ГОСТ 7.32-2017. Система стандартов по информации, библиотечному и издательскому делу. Отчёт о научно-исследовательской работе. Структура и правила оформления. URL: #link("https://protect.gost.ru/gost/details/7d280e43-7036-4a69-8e6e-d15867028343")[https://protect.gost.ru/gost/details/7d280e43-7036-4a69-8e6e-d15867028343]. Дата обращения: 27.10.2026.
+ JetBrains. Kanban Boards - YouTrack Cloud Documentation. URL: #link("https://www.jetbrains.com/help/youtrack/cloud/set-up-a-kanban-board.html")[https://www.jetbrains.com/help/youtrack/cloud/set-up-a-kanban-board.html]. Дата обращения: 27.10.2026.
+ JetBrains. Work with Sprints - YouTrack Cloud Documentation. URL: #link("https://www.jetbrains.com/help/youtrack/cloud/work-with-sprints.html")[https://www.jetbrains.com/help/youtrack/cloud/work-with-sprints.html]. Дата обращения: 27.10.2026.
+ JetBrains. Reports - YouTrack Cloud Documentation. URL: #link("https://www.jetbrains.com/help/youtrack/cloud/youtrack-reports.html")[https://www.jetbrains.com/help/youtrack/cloud/youtrack-reports.html]. Дата обращения: 27.10.2026.
+ JetBrains. Time Management Reports - YouTrack Cloud Documentation. URL: #link("https://www.jetbrains.com/help/youtrack/cloud/time-management-reports.html")[https://www.jetbrains.com/help/youtrack/cloud/time-management-reports.html]. Дата обращения: 27.10.2026.
+ JetBrains. Gantt Chart - YouTrack Cloud Documentation. URL: #link("https://www.jetbrains.com/help/youtrack/cloud/gantt-chart.html")[https://www.jetbrains.com/help/youtrack/cloud/gantt-chart.html]. Дата обращения: 27.10.2026.
+ GitHub. paryashie-yasheri/epi. URL: #link("https://github.com/paryashie-yasheri/epi")[https://github.com/paryashie-yasheri/epi]. Дата обращения: 27.10.2026.
