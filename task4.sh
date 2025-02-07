#!/bin/bash

# Функция, которая добавляет префикс "Hello, "
greet() {
    echo "Hello, $1"
}

# Функция для суммирования двух чисел
sum() {
    echo $(($1 + $2))
}

# Запрос имени
read -p "Введите ваше имя: " name

# Запрос двух чисел для суммирования
read -p "Введите первое число: " num1
read -p "Введите второе число: " num2

# Вызов функции приветствия
greet "$name"

# Вызов функции для суммирования
result=$(sum $num1 $num2)
echo "Сумма чисел $num1 и $num2: $result"
