#!/bin/bash

# Запрос ввода числа
echo "Введите число:"
read number

# Проверка числа
if [ "$number" -gt 0 ]; then
  echo "Число положительное."
elif [ "$number" -lt 0 ]; then
  echo "Число отрицательное."
else
  echo "Число равно нулю."
fi

# Подсчёт от 1 до числа, если оно положительное
if [ "$number" -gt 0 ]; then
  echo "Подсчёт от 1 до $number:"
  count=1
  while [ "$count" -le "$number" ]; do
    echo "$count"
    count=$((count + 1))
  done
fi
