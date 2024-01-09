# Tema 6 - Actividad 6 – Scripting - Solución

#!/bin/bash

echo "Bienvenidos al programa que procesa ficheros!!!"

while true; do

	echo
	echo
	echo "1: Cuenta las lineas del fichero"
	echo "2: Imprime el primer campo de cada linea del fichero"
	echo


	read -p "Elige la operación que desees realizar: " opcion
	echo
	echo
	echo ">>>>> RESULTADO:"
	echo
	case "$opcion"
	in

        1)
				cont=0 
				while read linea; do
					cont=$(( cont+1 ))
					echo -e "Línea numero $cont: $linea"
				done < alumnos.txt
				echo "El fichero tiene $cont lineas"
				;;
				2)
				cont=1 
				while read linea; do
					echo -e "Línea $cont: $linea"
					cont=$(( cont+1 ))
					#echo "$linea" | awk '{print $1}'
					campo1=$(echo "$linea" | awk '{print $1}')
					echo "El primer campo es $campo1"
					echo
					done < alumnos.txt
				
				;;
				*)
			  echo "Opción Incorrecta"	
				;;
	esac
done
4