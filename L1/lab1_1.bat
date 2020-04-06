@echo off

:: To display comments correctly, change the encoding to utf-8!

:: Переключение всего вывода на английский язык.
chcp 437

:: Задание 1.
:: Создание рабочей директории.
mkdir "Experiment Zone"
:: Переход в дирректорию "Experiment Zone".
cd "Experiment Zone"
:: Создание двух файлов под именами "text.txt" и "text1.txt" с произвольным текстом внутри.
echo text > "text.txt"
echo text1 > "text1.txt"
echo The task 1 is completed.
pause

:: Задание 2.
:: Измение атрибутов «Только чтение» и «Скрытый» файла "text.txt".
attrib +R +H "text.txt"
:: Сравнение файлов "text.txt" и "text1.txt", с выводом информации в файл "differences.txt".
fc "text.txt" "text1.txt" > "differences.info"
echo The task 2 is completed.
pause

:: Задание 3.
:: Cоздание файла "text2.txt" с копированием в него содержимого файлов "text.txt" и "text1.txt".
attrib -H "text.txt"
copy "*.txt" "text2.txt"
echo The task 3 is completed.
pause

:: Задание 4.
:: Создание подкаталога с именем "pLab_1".
mkdir "pLab_1"
echo The task 4 is completed.
pause

:: Задание 5.
:: Переход в подкаталог "pLab_1".
cd "pLab_1"
:: Копирование файлов с расширением ".txt" из предыдущего каталога в этот.
copy "..\*.txt"
:: Изменение расширения файлов .txt на .doc.
ren "*.txt" "*.doc"
:: Возврат к предыдущему активному каталогу.
cd ..
echo The task 5 is completed.
pause

:: Задание 6.
:: Дозапись в файл "text2.txt" графического представления структуры папки.
tree /A /F >> "text2.txt"
:: Дозапись в файл "text2.txt" текущей даты и времени.
date /T >> "text2.txt"
time /T >> "text2.txt"
:: Дозапись в файл "text2.txt" ФИО студента, сдающего текущую лабораторную работу.
echo Zadierniuk V.A. >> "text2.txt"
echo The task 6 is completed.
pause

:: Задание 7.
:: Перемещение всех файлов и каталога "pLab_1" в текущий каталог.
move "pLab_1\*.*"
:: Удаление каталога "pLab_1".
rmdir "pLab_1"
:: Удаление текущего каталога.
cd ..
rd /S /Q "Experiment Zone"
echo The task 7 is completed.
pause

exit