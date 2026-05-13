# Налаштування виконання Java-програми через Docker-контейнер

## Крок 1. Завантажити Docker-образ для JDK
```bash
docker pull openjdk
```

## Крок 2. Скомпілювати Java-програму
```bash
docker run \
--name chornomor-java \
-w /app \
-v ${PWD}:/app \
--rm \
openjdk javac ProgramClientCode.java
```

## Крок 3. Запустити Java-програму
```bash
docker run \
--name chornomor-java \
-w /app \
-v ${PWD}:/app \
--rm \
openjdk java ProgramClientCode
```
