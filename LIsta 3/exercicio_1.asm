.data
	G: .space 16  # Alocando 4 words na memória para o vetor G
	H: .space 16  # Alocando 4 words na memória para o vetor H
	
	
	# Alocando os valores do exercício na memória
	A: .word 10 
	B: .word 15  
	C: .word 20
	D: .word 25
	E: .word 30
	F: .word 35
	
.text
	main:
		# Ponteiro dos valores da memória = $t0
		
		# Carrego A
		la $t0, A
		lw $s0, 0($t0)
		
		# Carrego B
		la $t0, B
		lw $s1, 0($t0)
		
		# Carrego C
		la $t0, C
		lw $s2, 0($t0)
		
		# Carrego D
		la $t0, D
		lw $s3, 0($t0)
		
		# Carrego E
		
		la $t0, E
		lw $s4, 0($t0)
		
		# Carrego F
		la $t0, F
		lw $s5, 0($t0)
	
	
		# Calculo (A – (B + C) + F)
		# $t1 = B+C; $t2 = A + F; $t2 = $t2 - $t1
		add $t1, $s1, $s2
		add $t2, $s0, $s5
		sub $t2, $t2, $t1
		
		# Vou armazenar em G[0] o valor que está no registrador $t2
		
		# Ponteiro para o array: $t3
		addi $t3, $zero, 0  # Ou seja, estou armazenando o index 0 do array.
		sw $t2, G($t3)  # Armazeno no index 0 do array de 
			addi $t3, $t3, 4  # Vou para o próximo elemento do meu vetor (4).
			
			
		# ----------- Fim questão a) -------------- #
		
		# Ou seja, posso sobrescrever os registradores temporários.
			
		# ----------- Inicio questão b) -------------- #
		
	
		# Cálculo de E – (A – B) * (B – C)
		sub $t1, $s0, $s1
		sub $t2, $s1, $s2
		mul $t2, $t2, $t1 
		sub $t2, $s4, $t2
		
		sw $t2 G($t3)
			addi $t3, $t3, 4 # Vou para o próximo elemento do meu vetor (8).
			
			
		
		# ----------- Fim questão b) -------------- #
		
		# Ou seja, posso sobrescrever os registradores temporários.
			
		# ----------- Inicio questão C) -------------- #
		
		# Cálculo de G[1] – C;
		addi $t4, $zero, 4  # Declarando ponteiro para G[1]
		lw $t5, G($t4)
		
		sub $t5, $t5, $s2
		sw $t5, G($t3)
			addi $t3, $t3, 4
		
	
		
		
		
		
		
		
		

