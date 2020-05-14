# !/bin/bash

# Требуется создать сценарий оболочки с именем gchmod, 
# который позволяет искать в заданной директории файлы с
# заданными правами и менять эти права на другие. (Команда
# chmod позволяет задавать права доступа для файлов и 
# каталогов.)

# Входные данные:
# -- каталог, в котором нужно производить поиск;
# -- права для поиска; 
# -- целевые права.

parameter_count=$#
if [[ $parameter_count = 3 ]]; then
  directory=$1
  if [[ -e $directory ]]; then
    echo "OK"
  else 
    echo "Ошибка: Указанная директория не существует.">&2
    exit
  fi

  permissions='^[0-7]+$'
  find_permissions=$2
  if [[ $find_permissions =~ $permissions ]]; then
  echo "OK"
  else 
    echo "Ошибка: Неверно указаны права для поиска.">&2
    exit
  fi
  
  target_permissions=$3
  if [[ $target_permissions =~ $permissions ]]; then
  echo "OK"
  else
    echo "Ошибка: Неверно указаны целевые права.">&2
    exit
  fi

  files=$(find -type f -perm $find_permissions)
  chmod $target_permissions $files
else
  echo "Ошибка: Неверное число параметров." >&2
  exit
fi