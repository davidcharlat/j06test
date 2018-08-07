let "n = 1"
let "nfile = 0"

for file in 'ft_print_program_name' 'ft_print_params' 'ft_rev_params' 'ft_sort_params'
do
	if [ -f j06/ex0$n/$file.c ]
	then 
		gcc -o test$n ft_putchar.c j06/ex0$n/$file.c
		echo "testing ./test$n"
		./test$n
		echo "testing ./test$n abc abcd aabv"
		./test$n abc abcd aabv
		echo "$file.c is compiling"	
		echo "____________________"
		echo " "
		nf=$(find j06/ex0$n -type f ! -regex '.*/\..*' -printf "0"|wc -c)
		let "n = n + 1"
		if [ $nf -ne 1 ]
		then
			let "nfile = 1"
		fi
	fi
done
if [ $nfile -eq 0 ]
then
	echo "resultat = $n"
else
	echo "presence de fichiers autres que ceux specifies dans l'enonce -> resultat = 0"
fi
