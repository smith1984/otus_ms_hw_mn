# otus_ms_hw_mn

## Содержание

* [Задача](#Задача)
* [Зависимости](#Зависимости)
* [Инструкция по выполнению задания](#Инструкция по выполнению задания)
* [Результаты](#Результаты)

## Задача
1. Сделать дашборд в Графане, в котором были бы метрики с разбивкой по API методам:
- Latency (response time) с квантилями по 0.5, 0.95, 0.99, max
- RPS
- Error Rate - количество 500ых ответов
2. Добавить в дашборд графики с метрикам в целом по сервису, взятые с nginx-ingress-controller:
- Latency (response time) с квантилями по 0.5, 0.95, 0.99, max
- RPS
- Error Rate - количество 500ых ответов
3. Настроить алертинг в графане на Error Rate и Latency.
На выходе должно быть:
скриншоты дашборды с графиками в момент стресс-тестирования сервиса. Например, после 5-10 минут нагрузки.
json-дашборды.
4. Задание со звездочкой (+5 баллов). Используя существующие системные метрики из кубернетеса, добавить на дашборд графики с метриками:
- Потребление подами приложения памяти
- Потребление подами приолжения CPU

## Зависимости

Для выполнения задания использовались следующие зависимости:

- [Minikube 1.29.0](https://github.com/kubernetes/minikube/releases/tag/v1.29.0)
- [Kubectl 0.26.1](https://github.com/kubernetes/kubectl/releases/tag/v0.26.1)
- [Heml 3.3.4](https://github.com/helm/helm/releases/tag/v3.3.4)


##Инструкция по выполнению задания

1. Запускаем скрипт развертывания инфраструктуры и мониторинга и приложения:

```shell script
sh ./install.sh
```

2. Пробрасываем порт до WEB UI Grafana

Если проект разворачивается в minikube, то для этого выполняем следующую команду
```shell script
minikube service -n otus-ms-hw-mn prometheus-grafana-nodeport                             
```
3. Загружаем дашбоард из файла [hw-monitoring.json](dashboard%2Fhw-monitoring.json)

4. Нагружаем сервер запросами
 Используя утилиту k6

```shell script
k6 run --vus 200 --duration 30m --insecure-skip-tls-verify ./k6/script.js -e DOMAIN=arch.homework -e PATH=/api/a &\
k6 run --vus 200 --duration 30m --insecure-skip-tls-verify ./k6/script.js -e DOMAIN=arch.homework -e PATH=/api/b                           
```

5. Удаление артефактов проекта выполнив:

```shell script
sh ./delete.sh
```

## Результаты
![img.png](dashboard%2Fimg%2Fimg.png)
![img_1.png](dashboard%2Fimg%2Fimg_1.png)