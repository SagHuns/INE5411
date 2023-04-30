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
			
		# ----------- Inicio questão c) -------------- #
		
		
		addi $t4, $zero, 4  # Declarando ponteiro para G[1]
		lw $t5, G($t4)  # Carregando G[1] em $t5
		
		# Cálculo de G[1] – C;
		sub $t5, $t5, $s2 
		sw $t5, G($t3)
			addi $t3, $t3, 4  # Agora o ponteiro está apontando para o quarto elemento do vetor.

		# ----------- Fim questão c) -------------- #
		
		# Ou seja, posso sobrescrever os registradores temporários.
			
		# ----------- Inicio questão d) -------------- #

		addi $t0, $zero, 8  # Ponteiro para G[2]
		lw $t1, G($t0)  # Carrego no registrador $t1 o valor de G[2]
		addi $t2, $zero, 0
		lw $t4, G($t2)
		

		# Cálculo de G[2] + G[0];
		add $t1, $t1, $t4  # 
		# Armazenando em G[3]
		sw $t1, G($t3)

		# ----------- Fim questão d) -------------- #
		
		# Ou seja, posso sobrescrever os registradores temporários.
			
		# ----------- Inicio questão e) -------------- #

		# H[0] = B - C
		addi $t0, $zero, 0  # Ponteiro para o primeiro elemento do array
		
		sub $t1, $s1, $s2  # B - C
		sw $t1, H($t0)  # Armazenando em H[0] B - C

		# ----------- Fim questão e) -------------- #
		
		# Ou seja, posso sobrescrever os registradores temporários.
			
		# ----------- Inicio questão f) -------------- #
		# H[1] = A + C
		addi $t0, $t0, 4  # Apontando para o segundo elemento do array

		add $t1, $s0, $s2
		sw $t1, H($t0)

		# ----------- Fim questão f) -------------- #
		
		# Ou seja, posso sobrescrever os registradores temporários.
			
		# ----------- Inicio questão g) -------------- #
		# H[2] = B - C + G[3]
		
		
	
		
		
		
		
		
		
		

