# Тестовое задание для Effective Mobile

Этот проект содержит реализацию скрипта Bash для мониторинга процесса `test` в среде Linux, а также необходимые unit-файлы systemd (`mymonitoring.service` и `mymonitoring.timer`) для автоматического запуска скрипта каждую минуту.

## Описание

Проект включает в себя:
*   **Скрипт Bash (`test_monitoring.sh`)**: Основная логика мониторинга процесса `test`.
*   **Systemd Service Unit (`mymonitoring.service`)**: Определяет, как systemd должен выполнять скрипт.
*   **Systemd Timer Unit (`mymonitoring.timer`)**: Настраивает периодический запуск сервиса (каждую минуту).

## Установка

Для корректной работы на вашей системе, следуйте приведенному ниже руководству по установке.

### 1. Клонирование репозитория

Скопируйте репозиторий на свой компьютер с помощью команды:

```bash
git clone https://github.com/yarickmalyshev/test_Effective_Mobile.git
```

### 2. Копирование файлов

Перейдите в папку проекта и выполните следующие команды для копирования файлов в нужные системные директории:

```bash
# Копирование скрипта
sudo cp test_monitoring.sh /usr/local/bin/test_monitoring.sh

# Копирование unit-файла сервиса
sudo cp mymonitoring.service /etc/systemd/system/mymonitoring.service

# Копирование unit-файла таймера
sudo cp mymonitoring.timer /etc/systemd/system/mymonitoring.timer
```

### 3. Настройка прав и активация

Сделайте скрипт исполняемым и активируйте systemd-таймер:

```bash
# Сделать скрипт исполняемым
sudo chmod +x /usr/local/bin/test_monitoring.sh

# Перезагрузить конфигурацию systemd, чтобы она увидела новые unit-файлы
sudo systemctl daemon-reload

# Включить таймер (он будет автоматически запускаться при загрузке системы)
sudo systemctl enable mymonitoring.timer

# Запустить таймер немедленно (до перезагрузки)
sudo systemctl start mymonitoring.timer
```

### 4. Проверка состояния

Убедитесь в успешном запуске и работе сервиса с помощью команды:

```bash
sudo systemctl status mymonitoring
```

<img width="974" height="232" alt="image" src="https://github.com/user-attachments/assets/ee156d1d-4970-4f98-8b9d-8025b9733949" />

---
