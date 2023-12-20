

# Tema 6 - Actividad 5 – Scripting - Solución

#!/bin/bash


function ventas_totales_porQ() {

		echo "Estas son las ventas de todos los vendedores"
		echo
		echo "Vendor 1: ${vendor1[@]}"
		echo "Vendor 2: ${vendor2[@]}"
		echo "Vendor 3: ${vendor3[@]}"
		echo "Vendor 4: ${vendor4[@]}"
		echo
		echo "Ventas Totales de todos los vendedores por quatrimesre son:"
		echo "==========================================================="
		for (( i=0; i<n_vendors; i++ )); do
				total_Q[i]=$(( ${vendor1[i]} + ${vendor2[i]} + ${vendor3[i]} + ${vendor4[i]} ))
				cuatri=$(( $i+1 ))
				echo ">>>>>  Quatrimestre $cuatri: ${total_Q[i]} K€"
				echo	
		done

}

function total_anual_por_vendedor() {

		echo "Estas son las ventas de todos los vendedores"
		echo
		echo "Vendor 1: ${vendor1[@]}"
		echo "Vendor 2: ${vendor2[@]}"
		echo "Vendor 3: ${vendor3[@]}"
		echo "Vendor 4: ${vendor4[@]}"
		echo
		j=0
		totalVendedor=0
		while [ $j -eq 0 ]; do
		   echo -n "Introduce el número de vendedor del que quieres obtener sus ventas anuales (1 a 4) o "exit" para salir: "
		  read vendedor
		  echo
		  if [[ $vendedor -eq 1  ]] || [[ $vendedor -eq 2 ]] || [[ $vendedor -eq 3 ]] || [[ $vendedor -eq 4 ]]
	       	  then 
		  	for (( i=0; i<=3; i++ )); do
				totalVendedor=$(( $totalVendedor + $((vendor$vendedor[i])) ))
			done
			echo ">>>>>  Total vendido por vendedor$vendedor: $totalVendedor K€"
			echo	
			j=1
		 elif [[ $vendedor = exit ]]   
		 then 	
			exit	
		 else 
			echo "El vendedor no exsite!!!"
		  fi
		echo
		done
}

function media_por_Q() {

		echo "Estas son las ventas de todos los vendedores para cada Q:"
		echo
		echo "Vendor 1: ${vendor1[@]}"
		echo "Vendor 2: ${vendor2[@]}"
		echo "Vendor 3: ${vendor3[@]}"
		echo "Vendor 4: ${vendor4[@]}"
		echo
		echo
		j=0
		mediaQ=0
		while [ $j -eq 0 ]; do
		echo -n "Introduce el cuatrimestre  del que quieres obtener la media (1 a 4) o "exit" para salir: "
		read cuatri
		  if [[ $cuatri -eq 1  ]] || [[ $cuatri -eq 2 ]] || [[ $cuatri -eq 3 ]] || [[ $cuatri -eq 4 ]]
	       	  then 
			indice=$(( $cuatri -1 ))
			j=1
		  elif [[ $cuatri = exit ]]
		  then 
			  exit
		  else
			echo "El cuatrimestre no es válido!!!"
			echo
		 fi
		done

if [ $j -eq 1 ]
then
	echo
	echo
	mediaQ=$(( (${vendor1[$indice]} + ${vendor2[$indice]} + ${vendor3[$indice]} + ${vendor4[$indice]})/4 ))
	echo ">>>>>  Media de ventas en el cuatrimesre Q$cuatri: $mediaQ K€"
	echo
fi	

}


function deteccion_ventas() {

# Buscamos las ventas menores de 3K para el vendor1
# La variable q es para imprimir el numero de cuatrimestre
q=0
for venta in ${vendor1[@]}; do
	#echo $venta
	(( ++q ))
 	if [ $venta -lt 3 ]; then
		echo -e ">>>>> En el Q$q las ventas del vendor1 son: $venta K Euros, por tanto menores a 3k Euros"
  fi
done

# Buscamos las ventas menores de 3K para el vendor2
q=0
for venta in ${vendor2[@]}; do
	#echo $venta
	(( ++q ))
 	if [ $venta -lt 3 ]; then
		echo -e ">>>>> En el Q$q las ventas del vendor2 son: $venta K Euros, por tanto menores a 3k Euros"
  fi
done

# Buscamos las ventas menores de 3K para el vendor3
q=0
for venta in ${vendor3[@]}; do
	#echo $venta
	(( ++q ))
 	if [ $venta -lt 3 ]; then
		echo -e ">>>>> En el Q$q las ventas del vendor3 son: $venta K Euros, por tanto menores a 3k Euros"
  fi
done

# Buscamos las ventas menores de 3K para el vendor4
q=0
for venta in ${vendor4[@]}; do
	#echo $venta
	(( ++q ))
 	if [ $venta -lt 3 ]; then
		echo -e ">>>>> En el Q$q las ventas del vendor4 son: $venta K Euros, por tanto menores a 3k Euros"
  fi
done

}



echo "INFORMES DE VENTAS DE LA COMPAÑIA FOAM" 
echo "======================================"
echo 
echo "Podrás obtner uno de los siguientes informes seleccionando la opción correspondiente"

vendor1=(5 6 7 8)
vendor2=(2 3 4 5)
vendor3=(10 9 8 6)
vendor4=(7 2 9 9)
n_vendors=4

while true; do
echo
echo
echo "Elige la opción del informe que quieras obtener:"
echo
echo "1.	Listado completo de las ventas de todos los vendedores por cuatrimestre"
echo "2.	Valor total anual por vendedor. El número de vendedor se elige mediante un menú" 
echo "3.	Valor medio por cuatrimestre. El cuatrimestre mediante un menú"
echo "4.	Detección de vendedores con alguna venta con un valor menor de 3k€ por cuatrimestre"
echo "5.	Salir"
read opcion

if [[ $opcion = 1 ]] 
	then
		echo "Has elegido la opcion: $opcion, Total de ventas de todos los vendedores por Q"
		echo
		ventas_totales_porQ
		echo
	elif [[ $opcion = 2 ]]
		then
			echo "Has elegido la opcion: $opcion, Informe anual por vendedor."
			echo
			total_anual_por_vendedor
			echo
		elif [[ $opcion = 3 ]]
			then
				echo "Has elegido la opcion: $opcion, Valor medio de todas las ventas por cuatrimestre."
				echo
				media_por_Q
				echo
			elif [[ $opcion = 4 ]]
				then
					echo "Has elegido la opcion: $opcion, Vendedores con ventas menores a 3KEuros en algún cuatrimestre"
					echo
					echo
					deteccion_ventas
					echo
				elif [[ $opcion = 5 ]]
					then
						echo "Opcion: $opcion, Bye!!!!"
						break
				else
					echo "Opcion incorrecta"
	fi
done
