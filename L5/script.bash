# !/bin/bash

## 1
# Просмотр файлов /etc/shadow/, /etc/group и /etc/passwd.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " " 

echo "File \"/etc/group\". Begin:"
cat "/etc/group"
echo "End."
echo " " 

echo "File \"/etc/passwd\". Begin:"
cat "/etc/passwd"
echo "End."
echo " " 

sleep 5


## 2
# Регистрация пользователя test1, имеющего домашний каталог
# /home/nouser и являющегося членом групп mail и users.
# Пользователь должен иметь UID = 1777.
adduser -d /home/nouser -G mail,users -u 1777 test1

# Ознакомление с соответствующей записью в /ect/passwd.
echo "File \"/etc/passwd\". Begin:"
cat "/etc/passwd"
echo "End."
echo " " 

sleep 100

# Изменение UID пользователя test1 на 1001.

# Проверка изменений соответствующей записи в /ect/passwd.
echo "File \"/etc/passwd\". Begin:"
cat "/etc/passwd"
echo "End."
echo " " 

# Изучение соответствующей записи в /ect/shadow.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " "

# Установка для данного пользователя пароля.

# Изучение изменений в /ect/shadow.
echo "File \"/etc/shadow\". Begin:"
cat "/etc/shadow"
echo "End."
echo " " 


## 3
# Создание учетной записи для пользователя test2 с настройками
# по умолчанию.

# Проверка, создан ли домашний каталог пользователя.

# Изменение имени созданного пользователя с test2 на test3.

# Изучение /etc/group.

# Удаление пользователя test3.

# Изучение /etc/group.


## 4
# Установка даты устаревания пароля для пользователя test1 на 
# 31 декабря 2017 года.

# Проверка изменений с помощью команды chage.

# Блокировка учетной записи пользователя test1.

# Проверка изменений в /etc/shadow.


## 5
# Создание группы пользователей xusers с GUI = 1010.


## 6
# Регистрация своей учетной записи в качестве участника
# группы xusers.

# Ознакомление с соответствующей записью в /ect/group.


## 7
# Изменение имени группы xusers на yusers.

# Проверка изменений в /etc/group.


## 8
# Удаление всех созданных учетных записей и групп пользователей