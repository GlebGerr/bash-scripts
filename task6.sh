#!/bin/bash

# Чтение данных из input.txt и вывод на экран
echo "Чтение данных из input.txt:"
cat input.txt

# Подсчёт строк в файле и вывод в output.txt
echo "Подсчёт строк в input.txt и запись в output.txt:"
wc -l input.txt > output.txt

# Попытка выполнить команду ls для несуществующего файла и запись ошибки в error.log
echo "Попытка выполнить команду ls для несуществующего файла и запись ошибки:"
ls nonexistent_file 2> error.log
