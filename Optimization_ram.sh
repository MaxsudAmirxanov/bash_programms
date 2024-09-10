#!/bin/bash

# Проверка прав администратора
if [ "$EUID" -ne 0 ]; then 
  echo "Пожалуйста, запустите скрипт с правами администратора (root)"
  exit
fi

# Оптимизация использования оперативной памяти

echo "Начало оптимизации оперативной памяти..."

# Освобождение кэша страниц
echo 1 > /proc/sys/vm/drop_caches

# Освобождение inode и dentry кэша
echo 2 > /proc/sys/vm/drop_caches

# Освобождение кэша страниц, inode и dentry
echo 3 > /proc/sys/vm/drop_caches

# Принудительный запуск процесса сжатия памяти (если поддерживается системой)
if [[ -e /sys/kernel/mm/ksm/run ]]; then
  echo 1 > /sys/kernel/mm/ksm/run
fi

# Удаление неиспользуемых данных из swap памяти
swapoff -a && swapon -a

echo "Оптимизация завершена. Проверка состояния памяти:"
free -h


# ps -e -o pid,ppid,cmd,%mem,%cpu,stat,start_time --sort=-%mem | head -5
# cat /proc/meminfo | head -20 