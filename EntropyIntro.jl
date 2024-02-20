### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 4ba49e30-cff9-11ee-3dad-8f66b2e8a780
begin
	data = [
    ('A', 0.0815),
    ('B', 0.0097),
    ('C', 0.0315),
    ('D', 0.0373),
    ('E', 0.1739),
    ('F', 0.0112),
    ('G', 0.0097),
    ('H', 0.0085),
    ('I', 0.0731),
    ('J', 0.0045),
    ('K', 0.0002),
    ('L', 0.0569),
    ('M', 0.0287),
    ('N', 0.0712),
    ('O', 0.0528),
    ('P', 0.0280),
    ('Q', 0.0121),
    ('R', 0.0664),
    ('S', 0.0814),
    ('T', 0.0722),
    ('U', 0.0638),
    ('V', 0.0164),
    ('W', 0.0003),
    ('X', 0.0041),
    ('Y', 0.0028),
    ('Z', 0.0015)
]
	
end


# ╔═╡ 00fffcbf-d884-4292-964d-1577a2ea95e8
begin
	#1. Si on tire une lettre au hasard dans un texte, lui‑même pris au hasard :
		#1. Quelle est la probabilité que cette lettre appartienne à l’ensemble {D,M,R,U,Y} ?
		letters_to_check = ['D', 'M', 'R', 'U', 'Y']
	
		# Filter data to include only the letters in letters_to_check
		filtered_data = filter(x -> x[1] in letters_to_check, data)
	
		# Calculate the total probability
		total_probability = sum(pair[2] for pair in filtered_data)
	
		println("Total probability:", total_probability)
	
end

# ╔═╡ 414403f0-5482-4ba9-9852-9b003a5f4268
begin
	#2. Si l’on sait que cette lettre appartient à la deuxième moitié de l’alphabet, quelle est la probabilité que ce soit un P ?
		# Définir les lettres de la deuxième moitié de l'alphabet
		lettre_deuxieme_moitie_alphabet = ['N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
	
		# Somme des probabilités des lettres de la deuxième moitié de l'alphabet
		total_probabilite_deuxieme_moitie = sum(pair[2] for pair in data if pair[1] in lettre_deuxieme_moitie_alphabet)
		
		# Probabilité que la lettre soit un "P" parmi les lettres de la deuxième moitié de l'alphabet
		probabilite_P_deuxieme_moitie = 0.0280 / total_probabilite_deuxieme_moitie
		
		println("Probabilité que la lettre soit un 'P' dans la deuxième moitié de l'alphabet :", probabilite_P_deuxieme_moitie)
	
end

# ╔═╡ 837e66c5-aa71-4517-8081-58b068278b42
begin
	#3. Si l’on sait que cette lettre est une voyelle, quelle est la probabilité que ce soit un A ?

	lettre_voyelle = ['A','E','I','O','U']

	#Somme des proba des lettres
	total_proba_voyelle = sum(pair[2] for pair in data if pair[1] in lettre_voyelle)

	# Probabilité que ce soit un "A"
	proba_A_si_voyelle = 0.0815 / total_proba_voyelle

	println("Proba que la lettre soit un 'A' quand c'est une voyelle:", proba_A_si_voyelle )
	
	
end

# ╔═╡ 6f68086b-7623-4ce1-89c9-2e8d05b306eb
begin
	#4. Si on tire deux lettres au hasard telles que la première appartient à la deuxième moitié de l’alphabet et que le second est une voyelle, quelle est la probabilité que ces lettres ne soient pas PA ?
		Grp_1 = ['N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
		Grp_2 = ['A','E','I','O','U']
	
		#Nombre totale de Combinaison des 2 lettres
		CombinaisonTotale = length(Grp_1)*length(Grp_2)
		
		#Proba que ce soit 'PA'
		Proba_PA = 1 / CombinaisonTotale
		
		#Proba que ce ne soit pas 'PA'
		Proba_NON_PA = 1 - Proba_PA

		println("Proba que ce ne soit pas la lettre 'PA':", Proba_NON_PA)
		
end

# ╔═╡ becc2328-0910-4350-99b7-97d061e69715
begin
	#5. On définit la variable aléatoire Λ qui prend sa valeur dans l’alphabet latin selon la distribution de probabilité donnée par la fréquence d’occurrence des lettre en français. Calculer l’entropie de cette variable aléatoire
	
			# Function to calculate entropy
			function calculate_entropy(data)
			    entropy = 0
			    for (letter, probability) in data
			        entropy -= probability * log2(probability)
			    end
			    return entropy
			end
	
			# Calculate entropy
			entropy = calculate_entropy(data)
			
			println("Entropy of the random variable Λ:", entropy, " bits")
				
	
end

# ╔═╡ Cell order:
# ╠═4ba49e30-cff9-11ee-3dad-8f66b2e8a780
# ╠═00fffcbf-d884-4292-964d-1577a2ea95e8
# ╠═414403f0-5482-4ba9-9852-9b003a5f4268
# ╠═837e66c5-aa71-4517-8081-58b068278b42
# ╠═6f68086b-7623-4ce1-89c9-2e8d05b306eb
# ╠═becc2328-0910-4350-99b7-97d061e69715
