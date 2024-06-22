#!/bin/bash

#Colors
endColor="\033[0m\e[0m"
redColor="\e[0;31m\033[1m"
blueColor="\e[0;34m\033[1m"

# Parametro
cadena=$1

# Longitud
len=${#cadena}

for ((i=1; i<=25; i++)); do
    echo -e -n "${redColor}ROT $i:${endColor} "
    for ((j=0; j<len; j++)); do
        char=${cadena:$j:1}
        ascii=$(printf "%d" "'$char")
        
        # Aplicar la rotación
        new_ascii=$((ascii + i))

        # Ajustar para solo letras mayúsculas o minúsculas
        if [[ $ascii -ge 65 && $ascii -le 90 ]]; then  # Letras mayúsculas A-Z
            if [[ $new_ascii -gt 90 ]]; then
                new_ascii=$((new_ascii - 26))
            fi
        elif [[ $ascii -ge 97 && $ascii -le 122 ]]; then  # Letras minúsculas a-z
            if [[ $new_ascii -gt 122 ]]; then
                new_ascii=$((new_ascii - 26))
            fi
        else
            new_ascii=$ascii  # No rotar caracteres no alfabéticos
        fi

        # Convertir ASCII de vuelta a carácter
        new_char=$(printf "\\$(printf '%03o' $new_ascii)")

        echo -e -n "${blueColor}$new_char${endColor}"
    done
    echo ""
done
