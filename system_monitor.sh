#!/bin/bash

# Конфигурация
CPU_THRESHOLD=80     # Порог загрузки CPU в процентах
RAM_THRESHOLD=80     # Порог использования RAM в процентах
DISK_THRESHOLD=80    # Порог использования диска в процентах
LOG_FILE="/var/log/system_monitor.log" # Путь к лог-файлу

# Функция для отправки уведомлений
send_notification() {
    local message="$1"
    
    # Уведомление через notify-send (можно добавить другие способы, например, Telegram)
    if command -v notify-send &> /dev/null; then
        notify-send "System Monitor Alert" "$message"
    fi
    
    echo "$(date): $message" >> "$LOG_FILE"
}

# Основная функция мониторинга
monitor_system() {
    while true; do
        # Загрузка CPU
        CPU_LOAD=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
        CPU_LOAD=${CPU_LOAD%.*} # Преобразуем в целое число

        # Использование оперативной памяти
        MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100.0}')

        # Использование дискового пространства
        DISK_USAGE=$(df / | awk 'END{print $5}' | tr -d '%')

        # Вывод текущей информации
        echo "CPU Load: ${CPU_LOAD}% | RAM Usage: ${MEM_USAGE}% | Disk Usage: ${DISK_USAGE}%" | tee -a "$LOG_FILE"

        # Проверка порогов
        if [ "$CPU_LOAD" -gt "$CPU_THRESHOLD" ]; then
            send_notification "CPU Load exceeded: ${CPU_LOAD}%"
        fi

        if [ "$MEM_USAGE" -gt "$RAM_THRESHOLD" ]; then
            send_notification "RAM Usage exceeded: ${MEM_USAGE}%"
        fi

        if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
            send_notification "Disk Usage exceeded: ${DISK_USAGE}%"
        fi

        # Пауза перед следующим циклом
        sleep 5
    done
}

# Проверка прав администратора для лог-файла
if [ "$(id -u)" -ne 0 ]; then
    echo "Этот скрипт требует прав администратора. Запустите с помощью sudo."
    exit 1
fi

# Запуск мониторинга
echo "Запуск системного мониторинга... Логи записываются в $LOG_FILE."
monitor_system
