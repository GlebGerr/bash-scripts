#!/bin/bash

# Проверяем, был ли передан путь к директории
if [ -z "$1" ]; then
  echo "Ошибка: Укажите путь к директории для резервного копирования."
  exit 1
fi

# Переменная для исходной директории
SOURCE_DIR="$1"

# Проверка существования директории
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Ошибка: Указанная директория не существует."
  exit 1
fi

# Создаём папку для резервных копий (если её нет)
BACKUP_DIR="$SOURCE_DIR/backup_$(date +'%Y%m%d')"
mkdir -p "$BACKUP_DIR"

# Лог-файл для сохранения операции
LOG_FILE="$SOURCE_DIR/backup_log_$(date +'%Y%m%d').txt"
touch "$LOG_FILE"

# Копируем файлы и добавляем в имя каждого файла текущую дату
FILE_COUNT=0
for file in "$SOURCE_DIR"/*; do
  if [ -f "$file" ]; then
    # Получаем имя файла и добавляем дату в его имя
    BASENAME=$(basename "$file")
    NEW_NAME="$BACKUP_DIR/${BASENAME%.*}_$(date +'%Y%m%d').${BASENAME##*.}"
    cp "$file" "$NEW_NAME"
    FILE_COUNT=$((FILE_COUNT + 1))
    echo "Копия файла $file сохранена как $NEW_NAME" >> "$LOG_FILE"
  fi
done

# Уведомление об успешном завершении
echo "Резервное копирование завершено. Копировано файлов: $FILE_COUNT" >> "$LOG_FILE"
echo "Логи операции сохранены в $LOG_FILE"
