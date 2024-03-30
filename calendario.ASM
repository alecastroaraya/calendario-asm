;--------------------------------------------Portada-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Tarea de ASM: Calendario
; Curso: Arquitectura de Computadores
; Grupo: 2
; Escuela de Computacion
; Instituto Tecnologico de Costa Rica
; Fecha de entrega: Miercoles 23 de setiembre del 2020
; Estudiante: Alejandro Castro Araya
; Carne: 2020034944
; Profesor: Kirstein Gatjens
;--------------------------------------------Manual de Usuario-------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Este programa recibe una letra como opcion, y dependiendo de ella, despliega un calendario para una semana, un mes, o dice que dia fue una fecha determinada.
; -M cod ano       Despliega el calendario del mes solicitado con el codigo del ano correspondiente. cod es un codigo de dos letras que indica el mes que se escogio. Los posibles cod son: EN,FE,MZ,AB,MY,JN,JL,AG,SE,OC,NO,DI.
; -D dia cod ano   Dice que dia fue una fecha dada, dependiendo del numero de dia, codigo de mes, y ano correspondiente.
; -S num ano       Despliega el calendario del numero de semana dada en el ano correspondiente.
; -H               Despliega la ayuda del programa. Dice las posibles opciones y lo que hace el programa dependiendo de la opcion escogida. Tambien se despliega si no se escribe nada.
;--------------------------------------------Analisis de resultados-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;+------------------------------------------------------------------------------------------------------------------------+------+---------------------------------------------------------------------------------------------------------+
;|                                            Parte                                                                       | Nota | Explicacion Adicional                                                                                   |
;+------------------------------------------------------------------------------------------------------------------------+------+---------------------------------------------------------------------------------------------------------+
;| Mini acerca de                                                                                  | A    | Funciona correctamente                                                                                                         |
;| Recibir las 4 posibles opciones y sus otros parametros correspondientes en la linea de comando  | A    | Funciona correctamente                                                                                                         |
;| Validaciones y desplegar mensajes de error                                                      | A    | Funciona correctamente                                                                                                         |
;| Calculos aritmeticos para determinar dias y meses del calendario                                | B    | Si hace calculos aritmeticos, los del dia funcionan perfecto, y el mes si se toma en cuenta, pero el ano no es tomado en cuenta|
;| -H                 Despliega ayuda cuando es solicitada y cuando no se escribe nada             | A    | Funciona correctamente                                                                                                         |
;| -D dia cod ano     Dice que dia de la semana fue una fecha dada correctamente                   | A    | Funciona correctamente                                                                                                         |
;| -M cod ano         Despliega el calendario del mes solicitado con cod del ano correspondiente   | B    | Si hace los calculos y da diferentes valores dependiendo del mes pero no toma en cuenta el ano al hacerlos                     |
;| -S num ano         Despliega el calendario de una semana correctamente                          | B    | Si hace los calculos y dice dias y meses dependiendo del numero de semana, pero no toma en cuenta el ano al hacerlos           |
;| Desplegar calendario de semana hecho con caracteres ASCII                                       | A    | Funciona correctamente                                                                                                         |
;| Desplegar calendario de mes hecho con caracteres ASCII                                          | A    | Funciona correctamente                                                                                                         |
;| Documentación (Portada, manual de usuario y analisis de resultados con ABCDE) y comentarios     | A    | Escrita correctamente                                                                                                          |
;+--------------------------------------------------------------------------------------------------------+------+-------------------------------------------------------------------------------------------------------------------------+


data segment

	acercade db 'Arquitectura de Computadores Gr 2 Alejandro Castro Araya Tarea Calendarios' ,13, 10, 'Carne 2020034944 Ver. 0.74-3 14/09/2020', 13, 10, ' ', 13, 10, '$'
	ayuda db 'Despliega calendarios para semanas o meses determinados, o dice que dia es una fecha. -H para ayuda, -D para dia, -M para mes, -S para semana.$'
	letra db 80, 0, 80 dup('$')
	dia db 0
	mes1 db '.$'
	mes2 db '.$'
	pusoM db 0
	ano db 0
	codigoano db 0
	codigomes db 0
	siglo db 0
	codigosiglo db 0
	errormes db 'No ingreso un codigo de mes correcto. Terminando el programa...$'
	errorsemana db 'No ingreso un numero de semana correcta. Terminando el programa...$'
	errorletra db 'No ingreso una letra correcta. Terminando el programa...$'
	calculodia db 0
	bisiesto db 0
	domingo db 'Es domingo.$'
	lunes db 'Es lunes.$'
	martes db 'Es martes.$'
	miercoles db 'Es miercoles.$'
	jueves db 'Es jueves.$'
	viernes db 'Es viernes.$'
	sabado db 'Es sabado.$'
	numsemana db 0
	numdia db '.$'
	espacio db ' ',13,10,'$'
	espaciocal db ' ','$'
	espaciocal2 db '  ','$'
	calendariosemana1 db '------------------------------------------------------------------------------',13,10,'$'
	calendariosemana2 db '|    L     |    K     |    M     |    J     |    V     |    S     |    D     |',13,10,'$'
	calendariosemana3 db '------------------------------------------------------------------------------',13,10,'$'
	calendariosemana4 db '|  Ago 26  ','|  Ago 27  ','|  Ago 28  ','|  Ago 29  ','|  Ago 30  ','|  Ago 31  ','|  Ago 31  |',13,10,'$'
	calendariosemana5 db '|          ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana51 db '   |          ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana54 db '|        ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana55 db '|         ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana57 db '|        ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana58 db '|        ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana6 db '|          ','|          ','|          ','|          ','|          ','|          ','|          |',13,10,'$'
	calendariosemana7 db '-----------------------------------------------------------------------------',13,10,'$'
	enero db '                                    Enero                                         ',13,10,'$'
	febrero db '                                    Febrero                                         ',13,10,'$'
	marzo db '                                    Marzo                                         ',13,10,'$'
	abril db '                                    Abril                                         ',13,10,'$'
	mayo db '                                    Mayo                                         ',13,10,'$'
	junio db '                                    Junio                                         ',13,10,'$'
	julio db '                                    Julio                                         ',13,10,'$'
	agosto db '                                    Agosto                                         ',13,10,'$'
	setiembre db '                                    Setiembre                                         ',13,10,'$'
	octubre db '                                    Octubre                                         ',13,10,'$'
	noviembre db '                                    Noviembre                                         ',13,10,'$'
	diciembre db '                                    Diciembre                                         ',13,10,'$'
	digito1 db '.$'
	digito2 db '.$'
	suma db '.$'

data ends


pila segment stack 'stack'
   dw 256 dup(?)

pila ends


code segment
.model small
.386

        assume  cs:code, ds:data, ss:pila

start:

	mov ax,ds ; Se mueve ds a es
	mov es,ax

	mov ax,data ; Inicializa el data segment mandandolo al ds register
	mov ds,ax

	mov ax,pila ; Inicializa la pila mandandola al ss register
	mov ss,ax

	mov si,82h
	mov bl,byte ptr es:[si+1] ; Muevo la letra que escribio el usuario a bl para luego moverla a la variable letra
	mov letra,bl

	lea dx,acercade ; Despliega el acerca de
	mov ah,9h
	int 21h

	mov bx,2 ; Muevo 2 a bx para poder usarlo luego para obtener los bytes del si
	mov cl,0
	mov dl,10	

esVacio:

	cmp letra,20h ; Si no se escribio letra, salta al procedimiento de desplegar la ayuda
	jl darAyuda

esH:

	cmp letra,48h ; Si la letra es H despliega la ayuda, si no entonces revisa si es S
	jne revisarEsS
	je darAyuda

darAyuda:

	lea dx,ayuda ; Despliega la ayuda
	mov ah,9h
	int 21h
	jmp terminar

revisarEsS:

	cmp letra,53h ; Si no es S revisa si es M, si es S entonces inicia procedimiento de obtener el numero de semana que se escribio
	je obtenerNumSemana1
	jmp revisarEsM
	int 21h

obtenerNumSemana1:

	mov dl,10 ; Mueve 10 a dl y saca el primer digito del numero de la semana y lo multiplica por ese diez para que tenga la primera parte del numero de dos digitos de la semana y lo mueve a cl, luego salta a la segunda parte
	inc bx
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	mul dl

	mov cl,al

	jmp obtenerNumSemana2

obtenerNumSemana2:

	inc bx ; Saca el segundo digito del numero de semana y lo suma a cl para finalmente tener el numero entero de semanas que se escribio
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	add cl,al
	mov numsemana,cl
	mov cl,0
	mov al,0
	mov bl,10
	mov ah,0

	jmp displayMes

displayMes:

	cmp numsemana,1 ; Compara el numero de semana entero que se obtuvo anteriormente con los numeros del 1 al 53, dependiendo de ese numero salta al procedimiento del mes correspondiente
	je displayMesEN
	cmp numsemana,2
	je displayMesEN
	cmp numsemana,3
	je displayMesEN
	cmp numsemana,4
	je displayMesEN

	cmp numsemana,5
	je displayMesFE
	cmp numsemana,6
	je displayMesFE
	cmp numsemana,7
	je displayMesFE
	cmp numsemana,8
	je displayMesFE

	cmp numsemana,9
	je displayMesMZ
	cmp numsemana,10
	je displayMesMZ
	cmp numsemana,11
	je displayMesMZ
	cmp numsemana,12
	je displayMesMZ

	cmp numsemana,13
	je displayMesAB
	cmp numsemana,14
	je displayMesAB
	cmp numsemana,15
	je displayMesAB
	cmp numsemana,16
	je displayMesAB

	cmp numsemana,17
	je displayMesMY
	cmp numsemana,18
	je displayMesMY
	cmp numsemana,19
	je displayMesMY
	cmp numsemana,20
	je displayMesMY

	cmp numsemana,21
	je displayMesMY
	cmp numsemana,22
	je displayMesMY
	cmp numsemana,23
	je displayMesMY
	cmp numsemana,24
	je displayMesMY

	cmp numsemana,25
	je displayMesJN
	cmp numsemana,26
	je displayMesJN
	cmp numsemana,27
	je displayMesJN
	cmp numsemana,28
	je displayMesJN

	cmp numsemana,29
	je displayMesJL
	cmp numsemana,30
	je displayMesJL
	cmp numsemana,31
	je displayMesJL
	cmp numsemana,32
	je displayMesJL

	cmp numsemana,33
	je displayMesAG
	cmp numsemana,34
	je displayMesAG
	cmp numsemana,35
	je displayMesAG
	cmp numsemana,36
	je displayMesAG

	cmp numsemana,37
	je displayMesSE
	cmp numsemana,38
	je displayMesSE
	cmp numsemana,39
	je displayMesSE
	cmp numsemana,40
	je displayMesSE

	cmp numsemana,41
	je displayMesOC
	cmp numsemana,42
	je displayMesOC
	cmp numsemana,43
	je displayMesOC
	cmp numsemana,44
	je displayMesOC

	cmp numsemana,45
	je displayMesNO
	cmp numsemana,46
	je displayMesNO
	cmp numsemana,47
	je displayMesNO
	cmp numsemana,48
	je displayMesNO

	cmp numsemana,49
	je displayMesDI
	cmp numsemana,50
	je displayMesDI
	cmp numsemana,51
	je displayMesDI
	cmp numsemana,52
	je displayMesDI
	cmp numsemana,53
	je displayMesDI

	cmp numsemana,54 ; Si se escribio 54 o mas, se valida y salta al procedimiento de desplegar un error
	jge darErrorSemana

displayMesEN:

	lea dx,enero ; Dice que el mes del calendario es enero y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesFE:

	lea dx,febrero ; Dice que el mes del calendario es febrero y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesMZ:

	lea dx,marzo ; Dice que el mes del calendario es marzo y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesAB:

	lea dx,abril ; Dice que el mes del calendario es abril y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesMY:

	lea dx,mayo ; Dice que el mes del calendario es mayo y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesJN:

	lea dx,junio ; Dice que el mes del calendario es junio y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesJL:

	lea dx,julio ; Dice que el mes del calendario es julio y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesAG:

	lea dx,agosto ; Dice que el mes del calendario es agosto y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesSE:

	lea dx,setiembre ; Dice que el mes del calendario es setiembre y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesOC:

	lea dx,octubre ; Dice que el mes del calendario es octubre y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesNO:

	lea dx,noviembre ; Dice que el mes del calendario es noviembre y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

displayMesDI:

	lea dx,diciembre ; Dice que el mes del calendario es diciembre y luego va al procedimiento de desplegar el calendario y sus valores
	mov ah,9h
	int 21h

	jmp calendarioSemana

calendarioSemana:	

	
	lea dx,calendariosemana1 ; Despliega las 3 primeras lineas del calendario y luego compara el numero de semana escogido con los numeros del 1 al 53 para desplegar un calendario dependiendo de que semana es
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h


	inc cl
	cmp cl,numsemana
	jg terminar
	cmp numsemana,1
	je printearSemana1
	cmp numsemana,2
	je printearSemana2
	cmp numsemana,3
	je printearSemana6
	cmp numsemana,4
	je printearSemana10
	cmp numsemana,5
	je printearSemana12
	cmp numsemana,6
	je printearSemana18
	cmp numsemana,7
	je printearSemana22
	cmp numsemana,8
	je printearSemana24
	cmp numsemana,9
	je printearSemana28
	cmp numsemana,10
	je printearSemana1
	cmp numsemana,11
	je printearSemana2
	cmp numsemana,12
	je printearSemana6
	cmp numsemana,13
	je printearSemana10
	cmp numsemana,14
	je printearSemana12
	cmp numsemana,15
	je printearSemana18
	cmp numsemana,16
	je printearSemana22
	cmp numsemana,17
	je printearSemana24
	cmp numsemana,18
	je printearSemana28

	cmp numsemana,19
	je printearSemana1
	cmp numsemana,20
	je printearSemana2
	cmp numsemana,21
	je printearSemana6
	cmp numsemana,22
	je printearSemana10
	cmp numsemana,23
	je printearSemana12
	cmp numsemana,24
	je printearSemana18
	cmp numsemana,25
	je printearSemana22
	cmp numsemana,26
	je printearSemana24
	cmp numsemana,27
	je printearSemana28

	cmp numsemana,28
	je printearSemana1
	cmp numsemana,29
	je printearSemana2
	cmp numsemana,30
	je printearSemana6
	cmp numsemana,31
	je printearSemana10
	cmp numsemana,32
	je printearSemana12
	cmp numsemana,33
	je printearSemana18
	cmp numsemana,34
	je printearSemana22
	cmp numsemana,35
	je printearSemana24
	cmp numsemana,36
	je printearSemana28

	cmp numsemana,37
	je printearSemana1
	cmp numsemana,38
	je printearSemana2
	cmp numsemana,39
	je printearSemana6
	cmp numsemana,40
	je printearSemana10
	cmp numsemana,41
	je printearSemana12
	cmp numsemana,42
	je printearSemana18
	cmp numsemana,43
	je printearSemana22
	cmp numsemana,44
	je printearSemana24
	cmp numsemana,45
	je printearSemana28

	cmp numsemana,46
	je printearSemana1
	cmp numsemana,47
	je printearSemana2
	cmp numsemana,48
	je printearSemana6
	cmp numsemana,49
	je printearSemana10
	cmp numsemana,50
	je printearSemana12
	cmp numsemana,51
	je printearSemana18
	cmp numsemana,52
	je printearSemana22
	cmp numsemana,53
	je printearSemana24
	cmp numsemana,54
	jge darErrorSemana
	jmp terminar

darErrorSemana:

	lea dx,errorsemana ; Despliega un error si el numero de semana no era valido y termina el programa
	mov ah,9h
	int 21h
	jmp terminar

printearSemana1:

	cmp al,7 ; Cuando se despliegan los primeros 7 dias, termina y salta a desplegar lo que queda del calendario
	je terminarcal1

	lea dx,espaciocal2 ; Despliega 6 espacios entre caracteres para que se vea como un calendario
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h


	inc al ; Cada iteracion le suma un 1 al numero, y luego lo convierte en ascii para desplegarlo, luego lo convierte a entero de nuevo para hacer mas calculos, luego despliega otros 6 espacios
	add al,'0'
	mov numdia,al
	lea dx,numdia
	mov ah,9h
	int 21h
	sub al,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h


	jmp printearSemana1

terminarcal1:

	lea dx,calendariosemana51 ; Despliega las 3 ultimas lineas del calendario y termina
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar


printearSemana2:

	mov al,7 ; Mueve 7 a al para preparar los calculos para desplegar la segunda semana
	jmp printearSemana3

printearSemana3:

	lea dx,espaciocal ; Despliega espacios entre caracteres
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	cmp al,9
	je printearSemana4

	inc al ; Mismo procedimiento que con la primera semana solo que con valores diferentes, suma y despliega hasta el 9 y luego salta al procedimiento para desplegar los numeros de dos digitos
	add al,'0'
	mov numdia,al
	lea dx,numdia
	mov ah,9h
	int 21h
	sub al,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	jmp printearSemana3

printearSemana4:

	cmp al,14 ; ; Despliega numeros hasta que lleguen a 14 y luego termina
	je terminarcal

	mov numdia,al ; Muevo al a numdia para guardar el valor

	mov al,0 ; Despejo los registros para poder hacer division
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	mov al,numdia ; Muevo el valor guardado en numdia a al

	inc al ; Incremento a al cada iteracion, lo guardo en numdia, luego muevo 10 a bl para dividir el numero en al entre 10, y de esta manera consigo el primer digito del numero de dos digitos que se quiere desplegar
	mov numdia,al
	mov bl,10
	div bl

	add al,'0' ; Convierto el numero a ascii para desplegarlo, luego lo convierto en numero de nuevo
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,27h ; El residuo es el segundo digito de dividir al entre 10, entonces le sumo 27h para convertirlo en ascii y lo despliego, luego lo convierto en numero y luego salto al siguiente proceso de desplegar dias de semana
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	mov suma,27h ; Muevo el 27h que le sume al residuo a suma para poder incrementar suma mas facilmente en los procesos proximos
	jmp printearSemana5

printearSemana5:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de printearsemanas, despliego espacios para formar el calendario, despejo registros para poder dividir numeros
	mov ah,9h         ; y luego divido el numero del dia entre 10 para obtener el primer digito en al y desplegarlo, y luego convierto el residuo a ascii y lo despliego porque el residuo es el segundo digito del numero de dos digitos
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,14
	je terminarcal

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemana5

printearSemana6:

	mov al,14 ; El mismo que el proceso de printear semana de antes, le muevo un numero a numdia para preparar el procedimiento para poder dividir ese numero luego
	mov numdia,14
	mov suma,2Bh
	jmp printearSemana7

printearSemana7:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,19
	je printearSemana8

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	jmp printearSemana7

printearSemana8:

	sub suma,10 ; Este procedimiento es el mismo que los pasados de printearsemanas
	jmp printearSemana9

printearSemana9:

	mov al,0 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,21
	je terminarcal

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemana9

printearSemana10:

	mov al,21 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov numdia,21
	mov suma,28h
	jmp printearSemana11

printearSemana11:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h



	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,28
	je terminarcal4

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemana11

terminarcal4:

	lea dx,calendariosemana54 ; Al igual que los procedimientos anteriores de terminar el calendario, despliega las ultimas 3 lineas del calendario y termina
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar

printearSemana12:

	mov al,28 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov numdia,28
	mov suma,2Fh
	jmp printearSemana13

printearSemana13:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,29
	je printearSemana14

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemana13

printearSemana14:

	mov al,29 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov numdia,29
	mov suma,26h
	jmp printearSemana15

printearSemana15:


	mov al,0 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,31
	je printearSemana16

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemana15

printearSemana16:

	mov al,0 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov numdia,0
	mov suma,27h
	jmp printearSemana17

printearSemana17:

	mov al,0 ; Este procedimiento es el mismo que los pasados de printearsemanas
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,4
	je terminarcal5

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	jmp printearSemana17

terminarcal5:

	lea dx,calendariosemana55 ; Este procedimiento es el mismo que los pasados de terminar el calendario que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar

printearSemana18:

	mov al,4 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,4
	mov suma,2Bh
	jmp printearSemana19

printearSemana19:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,9
	je printearSemana20

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	



	jmp printearSemana19

printearSemana20:

	mov al,9 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,9
	mov suma,26h
	jmp printearSemana21

printearSemana21:

	mov al,0 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,11
	je terminarcal

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemana21

printearSemana22:

	mov al,11 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,11
	mov suma,28h
	jmp printearSemana23

printearSemana23:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,18
	je terminarcal7

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	int 21h

	jmp printearSemana23

terminarcal7:

	lea dx,calendariosemana57 ; Este procedimiento es el mismo que los pasados de desplegar los calendarios que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar

printearSemana24:

	mov al,18 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,18
	mov suma,2Fh
	jmp printearSemana25

printearSemana25:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,19
	je printearSemana26

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemana25

printearSemana26:

	mov al,19 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,19
	mov suma,26h
	jmp printearSemana27

printearSemana27:

	mov al,0 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,25
	je terminarcal8

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemana27

terminarcal8:

	lea dx,calendariosemana58 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar

printearSemana28:

	mov al,25 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,25
	mov suma,2Ch
	jmp printearSemana29

printearSemana29:

	lea dx,espaciocal ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,29
	je printearSemana30

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	jmp printearSemana29

printearSemana30:

	mov al,29 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,29
	mov suma,26h
	jmp printearSemana31

printearSemana31:

	mov al,0 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,31
	je printearSemana32

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemana31

printearSemana32:

	mov al,0 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov numdia,0
	mov suma,27h
	jmp printearSemana33

printearSemana33:

	mov al,0 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,1
	je terminarcal

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemana33

terminarcal:

	lea dx,calendariosemana5 ; Este procedimiento es el mismo que los pasados de desplegar las semanas que ya fueron explicados y para evitar sobresaturar se evitara escribir lo mismo de nuevo
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar


revisarEsM:

	cmp letra,'M' ; Revisa si la letra escrita es M, si no es, salta a revisar si es D, si si es entonces salta al procedimiento que se hace cuando si es M
	je esM
	jmp revisarEsD
	int 21h

esM:

	mov bx,3 ; Mueve 3 a bx para empezar desde el mes escrito en la command line, luego lo comparo con 20h y si es menos es que no se escribio nada. Si si se escribio un mes, muevo la primera letra a mes1
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar
	mov mes1,al

	inc bx ; Luego incremento bx por 1 para agarrar la segunda letra del mes y la muevo a mes2
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar
	mov mes2,al



	jmp cualMesEN ; Salto al procedimiento que revisa que mes se escribio empezando por enero

cualMesEN:

	cmp mes1,'E' ; Revisa si la primera letra es E, si no es va a revisar si es FE, si si es revisa si es N, si no era N da error porque no existe ese mes y si si era entonces despliega el calendario para enero
	jne cualMesFE
	cmp mes2,'N'
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaEN1


cualMesFE:

	cmp mes1,'F' ; Revisa si la primera letra es F, si no es va a revisar si es MZ, si si es revisa si es E, si no era E da error porque no existe ese mes y si si era entonces despliega el calendario para febrero
	jne cualMesMZ
	cmp mes2,'E'
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaFE12

cualMesMZ:

	cmp mes1,'M' ; Revisa si la primera letra es M, si no es va a revisar si es AB, si si es revisa si es Z, si no era Z revisa si es MY y si si era entonces despliega el calendario para marzo
	jne cualMesAB
	cmp mes2,'Z'
	jne cualMesMY

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaMZ28

cualMesAB:

	cmp mes1,'A' ; Revisa si la primera letra es A, si no es va a revisar si es JN, si si es revisa si es B, si no era B revisa si es AG y si si era entonces despliega el calendario para abril
	jne cualmesJN
	cmp mes2,'B'
	jne cualmesAG

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaEN1

cualMesMY:

	cmp mes2,'Y' ; Revisa si la segunda letra es Y, si no la es da error porque ese mes no existe
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaFE14

cualMesJN:

	cmp mes1,'J' ; Revisa si la primera letra es J, si no es va a revisar si es SE, si si es revisa si es N, si no era N revisa si es JL y si si era entonces despliega el calendario para junio
	jne cualMesSE
	cmp mes2,'N'
	jne cualMesJL

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaMZ28

cualMesJL:

	cmp mes2,'L' ; Revisa si la segunda letra es L, si no la es da error porque ese mes no existe
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaEN1

cualMesAG:

	cmp mes2,'G'  ; Revisa si la segunda letra es G, si no la es da error porque ese mes no existe
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaFE14

cualMesSE:

	cmp mes1,'S' ; Revisa si la primera letra es S, si no es va a revisar si es OC, si si es revisa si es E, si no era E da error porque el mes no existe y si si era entonces despliega el calendario para setiembre
	jne cualMesOC
	cmp mes2,'E'
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaMZ28

cualMesOC:

	cmp mes1,'O' ; Revisa si la primera letra es O, si no es va a revisar si es OC, si si es revisa si es C, si no era C da error porque el mes no existe y si si era entonces despliega el calendario para octubre
	jne cualMesNO
	cmp mes2,'C'
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaEN1

cualMesNO:

	cmp mes1,'N' ; ; Revisa si la primera letra es N, si no es va a revisar si es DI, si si es revisa si es O, si no era N da error porque ese mes no existe y si si era entonces despliega el calendario para noviembre
	jne cualMesDI
	cmp mes2,'O'
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaFE14

cualMesDI:

	cmp mes1,'D' ; Revisa si la primera letra es D, si no es da error porque ya reviso todas las letras y no era ninguna, si si es entonces despliego el calendario para diciembre
	jne darErrorMes
	cmp mes2,'I'
	jne darErrorMes

	lea dx,calendariosemana1
	mov ah,9h
	int 21h

	lea dx,calendariosemana2
	mov ah,9h
	int 21h

	lea dx,calendariosemana3
	mov ah,9h
	int 21h

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	jmp printearSemanaMZ28

printearSemanaMZ28:

	mov al,25 ; Mismo procedimiento que los otros de printear calendario de semana, mueve los numeros necesarios para los calculos y luego va al procedimiento para printear el calendario en si con caracteres ascii
	mov numdia,25
	mov suma,2Ch
	jmp printearSemanaMZ29

printearSemanaMZ29:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,29
	je printearSemanaMZ30

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	jmp printearSemanaMZ29

printearSemanaMZ30:

	mov al,29 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,29
	mov suma,26h
	jmp printearSemanaMZ31

printearSemanaMZ31:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,31
	je printearSemanaMZ32

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemanaMZ31

printearSemanaMZ32:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,0
	mov suma,27h
	jmp printearSemanaMZ33

printearSemanaMZ33:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,1
	je printearSemanaEN1

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemanaMZ33



printearSemanaEN1:

	cmp al,7 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	je printearSemanaEN2

	lea dx,espaciocal2
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h


	inc al
	add al,'0'
	mov numdia,al
	lea dx,numdia
	mov ah,9h
	int 21h
	sub al,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h


	jmp printearSemanaEN1

terminarcalEN1:

	lea dx,calendariosemana51  ; Mismo procedimiento que los pasados de terminar el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar


printearSemanaEN2:

	mov al,7
	jmp printearSemanaEN3 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion

printearSemanaEN3:

	lea dx,espaciocal2
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h

	
	lea dx,espaciocal
	mov ah,9h
	int 21h



	cmp al,9
	je printearSemanaEN4

	inc al
	add al,'0'
	mov numdia,al
	lea dx,numdia
	mov ah,9h
	int 21h
	sub al,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemanaEN3

printearSemanaEN4:

	cmp al,14 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	je printearSemanaEN5

	mov numdia,al

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	mov al,numdia

	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,27h
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	mov suma,27h
	jmp printearSemanaEN5

printearSemanaEN5:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	
	lea dx,espaciocal
	mov ah,9h
	int 21h
	
	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,14
	je printearSemanaEN6

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h


	jmp printearSemanaEN5

printearSemanaEN6:

	mov al,14 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,14
	mov suma,2Bh
	jmp printearSemanaEN7

printearSemanaEN7:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h



	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,19
	je printearSemanaEN8

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	
	lea dx,espaciocal
	mov ah,9h
	int 21h


	jmp printearSemanaEN7

printearSemanaEN8:

	sub suma,10 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	jmp printearSemanaEN9

printearSemanaEN9:

	mov al,0
	mov bl,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,21
	je printearSemanaEN10

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemanaEN9

printearSemanaEN10:

	mov al,21 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,21
	mov suma,28h
	jmp printearSemanaEN11

printearSemanaEN11:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h



	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,28
	je terminarcalEN4

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemanaEN11

terminarcalEN4:


	lea dx,calendariosemana7 ; Mismo procedimiento que los pasados de terminar el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h


	jmp terminar

printearSemanaFE12:

	mov al,28 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,28
	mov suma,2Fh
	jmp printearSemanaFE13

printearSemanaFE13:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,29
	je printearSemanaFE14

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemanaFE13

printearSemanaFE14:

	mov al,29 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,29
	mov suma,26h
	jmp printearSemanaFE15

printearSemanaFE15:


	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,31
	je printearSemanaFE16

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemanaFE15

printearSemanaFE16:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,0
	mov suma,27h
	jmp printearSemanaFE17

printearSemanaFE17:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,4
	je printearsemanaFE18

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	jmp printearSemanaFE17

terminarcalFE5:

	lea dx,calendariosemana55 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar

printearSemanaFE18:

	mov al,4 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,4
	mov suma,2Bh
	jmp printearSemanaFE19

printearSemanaFE19:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h




	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,9
	je printearSemanaFE20

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h
	
	lea dx,espaciocal2
	mov ah,9h
	int 21h


	jmp printearSemanaFE19

printearSemanaFE20:

	mov al,9 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,9
	mov suma,26h
	jmp printearSemanaFE21

printearSemanaFE21:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,11
	je printearSemanaFE22

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	jmp printearSemanaFE21

printearSemanaFE22:

	mov al,11 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,11
	mov suma,28h
	jmp printearSemanaFE23

printearSemanaFE23:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,18
	je printearSemanaFE24

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h


	int 21h

	jmp printearSemanaFE23

terminarcalFE7:

	lea dx,calendariosemana57 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,calendariosemana6
	mov ah,9h
	int 21h

	lea dx,calendariosemana7
	mov ah,9h
	int 21h


	jmp terminar

printearSemanaFE24:

	mov al,18 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,18
	mov suma,2Fh
	jmp printearSemanaFE25

printearSemanaFE25:

	lea dx,espaciocal ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h



	mov al,0
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,19
	je printearSemanaFE26

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h

	lea dx,espaciocal2
	mov ah,9h
	int 21h	


	jmp printearSemanaFE25

printearSemanaFE26:

	mov al,19 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov numdia,19
	mov suma,26h
	jmp printearSemanaFE27

printearSemanaFE27:

	mov al,0 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov bl,0
	mov cl,0
	mov dl,0
	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0
	mov ah,0
	mov bh,0
	mov ch,0
	mov dh,0

	cmp numdia,25
	je terminarcalFE8

	inc suma

	mov al,numdia
	inc al
	mov numdia,al
	mov bl,10
	div bl

	add al,'0'
	mov digito1,al
	lea dx,digito1
	mov ah,9h
	int 21h
	sub al,'0'

	add ah,suma
	mov digito1,ah
	lea dx,digito1
	mov ah,9h
	int 21h
	sub ah,'0'

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h

	lea dx,espaciocal
	mov ah,9h
	int 21h	

	lea dx,espaciocal
	mov ah,9h
	int 21h	


	jmp printearSemanaFE27

terminarcalFE8:


	lea dx,calendariosemana7 ; Mismo procedimiento que los pasados de printear el calendario, entonces para no sobresaturar voy a evitar repetir la explicacion
	mov ah,9h
	int 21h


	jmp terminar


revisarEsD:

	cmp letra,44h ; Revisa si la opcion escrita es D, si si la es entonces salta a convertir los digitos del dia ingresados a entero, si no es D entonces da un error porque la letra escrita no es una opcion reconocida y termina
	je diaAInt1
	lea dx,errorletra
	mov ah,9h
	int 21h
	jmp terminar

diaAInt1:

	inc bx ; Agarra el primer digito del dia que se escribio y le resta 48 decimal para que se haga un entero, luego lo multiplica por diez y esa es la primera parte del procedimiento para conseguir los dos digitos del numero dado
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	mul dl

	mov cl,al

	jmp diaAInt2 ; Va a la  segunda parte

diaAInt2:

	inc bx ; Agarra el segundo digito del numero de dos digitos y lo convierte en entero restandole el caracter 0, luego se le suma al entero que era el primer digito multiplicado por diez y ya se tiene el numero de dos digitos int
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	add cl,al
	mov dia,cl
	jmp conseguirMes ; Luego se va a revisar que mes se escribio

conseguirMes:

	add bx,2 ; Mueve a al la primera letra del mes que se escribio en la command line y luego se mueve a mes1, luego voy a obtener los digitos del siglo
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar
	mov mes1,al

	inc bx ; Mueve a al la segunda letra del mes que se escribio en la command line y luego se mueve a mes2, luego voy a obtener los digitos del siglo
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar
	mov mes2,al	

conseguirSiglo1:

	mov dl,10 ; Muevo 10 a dl y muevo el primer digito del ano a al, lo convierto en entero para luego multiplicar por diez el primer digito del siglo que puse en al y luego voy a la segunda parte del procedimiento
	add bx,2
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	mul dl

	mov cl,al

	jmp conseguirSiglo2

conseguirSiglo2:

	inc bx ; Muevo el segundo digito del ano a al, lo convierto a entero, y luego lo sumo al primer digito version entero que hice en la primera parte del procedimiento
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	add cl,al
	mov siglo,cl ; Muevo los primeros 2 digitos del ano de cl a siglo


	jmp ConseguirAno1
	

conseguirAno1:

	mov dl,10 ; Agarra el penultimo digito del ano y lo muevo a al, muevo 10 a dl para multiplicar el penultimo digito por 10, y luego voy a la segunda parte para terminar de generar el entero
	inc bx
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	mul dl

	mov cl,al

	jmp conseguirAno2

conseguirAno2:

	inc bx ; Agarro el ultimo digito del ano, lo muevo a al, y lo sumo al penultimo digito para formar los ultimos 2 digitos del ano en entero, luego salto a hacer los calculos para determinar que dia cae esa fecha
	mov al,byte ptr es:[si+bx]
	cmp al,20h
	jl terminar

	sub al,'0'
	add cl,al
	mov ano,cl ; Muevo los ultimos digitos del ano del cl a ano

	jmp yearCode

yearCode:

	mov al,ano ; Muevo el ano a al y 4 a bl para dividirlo entre 4, luego lo sumo a los ultimos dos digitos del ano y luego el resultado lo divido entre 7. Luego muevo el residuo de eso a codigoano
	mov bl,4
	div bl

	mov cl,al
	mov al,ano
	add al,cl
	xor ah,ah
	mov bl,7
	div bl

	mov codigoano,ah

	jmp revisarMesEN ; Salto a revisar cual mes se escribio

revisarMesEN:

	cmp mes1,45h ; Si se escribio una E de primero, reviso si escribio una N y si no da error. Si no escribio una E de primero reviso si escribio F
	jne revisarMesFE
	cmp mes2,4Eh
	je mesDa0yEN ; Si escribio mes, en los calculos para revisar el dia ocupo que me de 0
	jmp darErrorMes

mesDa0yEN:

	mov bisiesto,1 ; Muevo 0 a codigomes para usarlo en los calculos para sacar que dia es
	mov codigomes,0
	jmp centuryCode

mesDa0:

	mov codigomes,0 ; Muevo 0 a codigomes para usarlo en los calculos de sacar el dia
	jmp centuryCode

revisarMesFE:

	cmp mes1,46h ; Reviso si escribio una F de primero. Si no, reviso si es una M. Si se escribio una F de primero, reviso si escribio una E luego. Si no escribio una E da error.
	jne revisarMesMZoMY
	cmp mes2,45h
	je mesDa3yFE
	jmp darErrorMes

mesDa3yFE:

	mov bisiesto,1 ; Muevo 3 a codigomes para los calculos del dia que es
	mov codigomes,3
	jmp centuryCode

mesDa3:

	mov codigomes,3 ; Muevo 3 a codigomes para los calculos del dia que es
	jmp centuryCode


revisarMesMZoMY:

	cmp mes1,4Dh ; Reviso si escribio una M de primero. Si no, reviso si es una A. Si se escribio una M de primero, reviso si escribio una Z luego. Si no escribio una Z entonces reviso si es una Y. Si no entonces da error.
	jne revisarMesABoAG
	cmp mes2,5Ah
	je mesDa3
	cmp mes2,59h
	je mesDa1
	jmp darErrorMes

mesDa1:

	mov codigomes,1 ; Muevo 1 a codigomes para los calculos del dia que es
	jmp centuryCode

revisarMesABoAG:

	cmp mes1,41h ; Reviso si escribio una A de primero. Si no, reviso si es una J. Si se escribio una A de primero, reviso si escribio una B luego. Si no escribio una B entonces reviso si es una G. Si no entonces da error.
	jne revisarMesJNoJL
	cmp mes2,42h
	je mesDa6
	cmp mes2,47h
	je mesDa2
	jmp darErrorMes

mesDa6:

	mov codigomes,6 ; Muevo 6 a codigomes para los calculos del dia que es
	jmp centuryCode

mesDa2:

	mov codigomes,2 ; Muevo 2 a codigomes para los calculos del dia que es
	jmp centuryCode

revisarMesJNoJL:

	cmp mes1,4Ah ; Reviso si escribio una J de primero. Si no, reviso si es una S. Si se escribio una J de primero, reviso si escribio una N luego. Si no escribio una N entonces reviso si es una L. Si no entonces da error.
	jne revisarMesSE
	cmp mes2,4Eh
	je mesDa4
	cmp mes2,4Ch
	je mesDa6
	jmp darErrorMes

mesDa4:

	mov codigomes,4 ; Muevo 4 a codigomes para los calculos del dia que es
	jmp centuryCode

revisarMesSE:

	cmp mes1,53h ; Reviso si escribio una S de primero. Si no, reviso si es una O. Si se escribio una S de primero, reviso si escribio una E luego. Si no entonces da error.
	jne revisarMesOC
	cmp mes2,45h
	je mesDa5
	jmp darErrorMes

mesDa5:

	mov codigomes,5 ; Muevo 5 a codigomes para los calculos del dia que es
	jmp centuryCode

revisarMesOC:

	cmp mes1,4Fh ; Reviso si escribio una O de primero. Si no, reviso si es una N. Si se escribio una O de primero, reviso si escribio una C luego. Si no entonces da error.
	jne revisarMesNO
	cmp mes2,43h
	je mesDa0
	jmp darErrorMes

revisarMesNO:

	cmp mes1,4Eh ; Reviso si escribio una N de primero. Si no, reviso si es una D. Si se escribio una N de primero, reviso si escribio una O luego. Si no entonces da error.
	jne revisarMesDI
	cmp mes2,4Fh
	je mesDa3
	jmp darErrorMes

revisarMesDI:

	cmp mes1,44h ; Reviso si escribio una D de primero. Si no, da error. Si se escribio una D de primero, reviso si escribio una I luego. Si no entonces da error.
	jne darErrorMes
	cmp mes2,49h
	je mesDa5
	jmp darErrorMes

darErrorMes:

	lea dx,errormes ; Despliega un error que dice que el mes digitado es invalido y luego termina el programa.
	mov ah,9h
	int 21h
	jmp terminar
		
centuryCode:

	cmp siglo,17 ; Revisa el valor del siglo y dependiendo de que es, se toman en cuenta diferentes valores en los calculos aritmeticos. (El siglo es en realidad los dos primeros digitos del ano)
	je sigloDa4
	cmp siglo,18
	je sigloDa2
	cmp siglo,19
	je sigloDa0
	cmp siglo,20
	je sigloDa6
	cmp siglo,21
	je sigloDa4
	cmp siglo,22
	je sigloDa2
	cmp siglo,23
	je sigloDa0

sigloDa4:

	mov codigosiglo,4 ; Se mueve 4 al codigosiglo y se va al procedimiento de calcular el dia
	jmp calcularDia

sigloDa2:

	mov codigosiglo,2 ; Se mueve 2 al codigosiglo y se va al procedimiento de calcular el dia
	jmp calcularDia

sigloDa0:

	mov codigosiglo,0 ; Se mueve 0 al codigosiglo y se va al procedimiento de calcular el dia
	jmp calcularDia

sigloDa6:

	mov codigosiglo,6 ; Se mueve 6 al codigosiglo y se va al procedimiento de calcular el dia
	jmp calcularDia

calcularDia:

	mov al,codigoano ; Para calcular el dia, muevo codigoano y codigomes a al y bl para hacer calculos aritmeticos. Sumo bl con al, luego sumo el codigosiglo a al, y luego sumo el dia a al.
	mov bl,codigomes ; Luego divido eso entre 7, y el residuo de eso es el resultado que estaba buscando. Ese resultado lo comparo con los numeros del procedimiento determinarDia.

	add al,bl
	mov bl,codigosiglo
	add al,bl
	mov bl,dia
	add al,bl

	xor bl,bl
	xor ah,ah

	mov calculodia,al
	mov bl,7

	mov al,calculodia

	div bl
	sub ah,bisiesto

	mov calculodia,ah
	jmp determinarDia

determinarDia:

	cmp calculodia,0 ; Para determinar el dia compara el numero entero guardado en calculodia, para eso se hicieron las operaciones anteriores.
	je esDomingo
	cmp calculodia,1
	je esLunes
	cmp calculodia,2
	je esMartes
	cmp calculodia,3
	je esMiercoles
	cmp calculodia,4
	je esJueves
	cmp calculodia,5
	je esViernes
	cmp calculodia,6
	je esSabado

esDomingo:

	cmp bisiesto,1 ; Despliega que es domingo a menos que sea bisiesto, en cuyo caso despliega que mas bien es sabado
	je esSabado
	lea dx,domingo
	mov ah,9h
	int 21h
	jmp terminar

esLunes:

	lea dx,lunes ; Despliega que es lunes
	mov ah,9h
	int 21h
	jmp terminar

esMartes:

	lea dx,martes ; Despliega que es martes
	mov ah,9h
	int 21h
	jmp terminar

esMiercoles:

	lea dx,miercoles ; Despliega que es miercoles
	mov ah,9h
	int 21h
	jmp terminar

esJueves:

	lea dx,jueves ; Despliega que es jueves
	mov ah,9h
	int 21h
	jmp terminar

esViernes:

	lea dx,viernes ; Despliega que es viernes
	mov ah,9h
	int 21h
	jmp terminar

esSabado:

	lea dx,sabado ; Despliega que es sabado
	mov ah,9h
	int 21h
	jmp terminar

terminar:

	mov ah,4ch ; Hace interrupt para hacer exit hacia DOS para terminar el programa
	int 21h

code ends

end start