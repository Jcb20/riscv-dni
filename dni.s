#Crea un vector de 8 posiciones, almacena en una variable todos los ceros del vector.
# suma el resto de valores y muestra por pantalla tanto el total de ceros encontrados
# como la direferncia entre la suma total  y  una constante "100"


.data
DNI: .word 0,6,7,8,0,5,0,9
META: .word 100
SALIDA: .string ","

.text
main:

la t0,DNI             # puntero
li t1,0               # contador
li t2,8               # Vmax
li t3,0               # TotalCeros
li t4,0               # SumaTotal

bucle:
bge  t1,t2, fin       # while(contador<vmax)
lw   t5,0(t0)         # puntero DNI
bne  t5,zero, sino    # if(DNI[i]==0)
addi t3,t3,1          # TotalCeros++

sino:
add t4,t4,t5          # sumaTotal += DNI[i]
addi t1,t1,1          # contador++ 
addi t0,t0,4          # desplazmos 4 bytes 
j bucle
fin:

la s0, META 
lw s1, 0(s0)          # META  
sub s2,s1,t4          # Resto = META-sumaTotal

li a7,1               # Imprimir "Totalceros"
mv a0,t3
ecall

la a0,SALIDA
li a7,4            # imprimir seprador ","
ecall

li a7,1               # imprimir resto
mv a0,s2
ecall

li a7,10              # salir     
ecall




