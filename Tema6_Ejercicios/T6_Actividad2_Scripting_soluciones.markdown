# Tema 6- Actividad 2 - Scripting - Soluciones


 
## Ejercicio 1

Hacer un *script* que reciba dos parámetros de entrada (que sean dos digitos) y devuelva como resultado la suma de los dichos números. 
El script debe hacer la comprobación de que tiene los dos valores para realizar la operación solicitada.  Por tanto: 
- Si el número de parametros que recibe el script es cero, entonces el script debe pedir al usuario los dos valores mediante el comando read. 
- Si el número de parametros que recibe es uno, entonces el script debe pedir al usuario el segundo de los valores que falta utilizando el comando read.
- Si el número de parametros es dos o más de dos, entonces el script utilizará los dos primeros valores recibidos para ejecutar la suma.

La comprobación del número de parámetros recibidos se hara mediante una sentencia case. 
El script debe devolver el resultado de la suma. 

```bash


#!/bin/bash
# File suma_valores.sh

clear
error="n"

case $#
in
        0) 
        echo "No ha introducido ningun parámetro..."
        read -p 'Introduca el valor de num1: ' num1
        read -p 'Introduca el valor de num2: ' num2
        if [ -z $num1 ] || [ -z $num2 ]
            then 
                error="s"
                echo "Alguno de los valores introducido no es correcto"
        fi
        ;;
  
        1)
        echo "Falta un parámetro..."
        num1=$1
        read -p 'Introduca el valor de num2: ' num2
        if [ -z $num2 ]
            then
                error="s"
                echo "El valor introducido no es correcto"
        fi
        ;;
        2)
        echo "Número de parámetros correcto"
        num1=$1
        num2=$2
        ;;
        *)
        num1=$1
        num2=$2
        echo "Demasiados parametros, utilizo los 2 primeros"
        ;;
esac


if [ $error = "s" ]
then 
        echo "Nos salimos, no podemos hacer la suma....."
        exit
else
        echo "Hago la suma de $num1 + $num2"
        echo $num1 + $num2 = $(($num1 + $num2))
fi


```


## Ejercicio 2
  
Realizar un script que nos diga si tenemos o no conectividad con abc.es


```bash

#!/bin/bash
echo "Haciendo un ping a abc.es...."

ping -c 4 abc.es > res_ping.out
res1=$?

echo "El resultado del ping a abc.es es $res1"


if [[ $res1 -eq 0 ]]; then
    echo ">>> conexión abc.es  OK"
else
    echo "<<< conexión abc.es  KO"
fi
```