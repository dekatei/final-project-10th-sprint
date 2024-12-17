#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
#mkdir -p task/dir{1..3} task/dir3/dir4 хотела вот так, но не работает
 mkdir -p task/dir1 task/dir2 task/dir3/dir4
# изменяем текущую директорию на task
 cd task
# создаём пустой файл task/dir2/empty
 touch dir2/empty

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
cat > dir2/hello.sh
#!/bin/bash
echo "$1, привет!"
#ctrl+D

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh
# сохраняем список файлов task/dir2 в task/dir2/list.txt
ls dir2 > dir2/list.txt
# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r -T dir2 dir3/dir4 
# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
cd .. #если не выйти на католг выше, то не знаю какой первый аргумент использовать для следующего  find
find task -name "*.txt" > task/dir1/summary.txt
# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat task/dir2/list.txt >> task/dir1/summary.txt
# определяем переменную окружения NAME со значением "Всем студентам"
NAME="Всем студентам"
# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
bash task/dir2/hello.sh $NAME >> task/dir1/summary.txt
# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv task/dir1/summary.txt task/practice
# выводим на консоль содержимое файла task/Практическое задание
cat task/practice
# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep -i 'dir' task/practice | sort -u
# меняем текущую директорию на родительскую для task
#я уже в ней
# удаляем директорию task со всем содержимым
rm -r -d task