#!/bin/bash

# Собираем информацию о загрузке процессора
cpu_load=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo "Загрузка процессора: $cpu_load%"

# Собираем информацию о использовании памяти
mem_used=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "Использование памяти: $mem_used%"

# Собираем информацию о дисковом пространстве
disk_usage=$(df -h / | grep / | awk '{ print $5 }')
echo "Использование диска: $disk_usage"

# Если использование памяти больше 80%, уведомляем пользователя
if (( $(echo "$mem_used > 80" | bc -l) )); then
  echo "Предупреждение: Использование памяти больше 80%. Текущие процессы, потребляющие наибольшее количество памяти:"
  
  # Выводим процессы, потребляющие больше всего памяти
  ps aux --sort=-%mem | head -n 10
fi
