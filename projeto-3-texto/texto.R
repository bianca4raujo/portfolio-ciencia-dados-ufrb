# PROJETO 3 - MINERAÇÃO DE TEXTO

cat("=== PROJETO 3: MINERAÇÃO DE TEXTO ===\n\n")

# 1. Textos de exemplo sobre educação
textos <- c(
  "A educação transforma vidas e constrói sociedades melhores",
  "A universidade pública é essencial para o desenvolvimento do país",
  "Professores dedicados fazem a diferença na aprendizagem",
  "Tecnologia na educação abre novas possibilidades de ensino",
  "Investimento em educação gera retorno para toda a sociedade",
  "Aprendizado contínuo é fundamental no mundo atual",
  "Educação de qualidade reduz desigualdades sociais",
  "Pesquisa científica nas universidades impulsiona inovação",
  "Acesso à educação é direito de todos os cidadãos",
  "Formação crítica prepara para os desafios do futuro"
)

cat(" Textos analisados (sobre educação):\n")
for (i in 1:length(textos)) {
  cat(i, ":", textos[i], "\n")
}
cat("\n")

# 2. Juntar todos os textos
texto_completo <- paste(textos, collapse = " ")

# 3. Separar em palavras
palavras <- unlist(strsplit(tolower(texto_completo), "\\W+"))

# 4. Remover palavras comuns (stopwords simples)
stopwords_pt <- c("a", "o", "e", "de", "da", "do", "em", "para", "com", 
                  "na", "no", "é", "são", "se", "que", "por", "uma", "um",
                  "as", "os", "nas", "nos", "para", "com", "sem")

palavras_filtradas <- palavras[!palavras %in% stopwords_pt]

# 5. Contar frequência
frequencia <- table(palavras_filtradas)
frequencia <- sort(frequencia, decreasing = TRUE)

# 6. Mostrar resultados
cat(" PALAVRAS MAIS FREQUENTES\n")


cat("🔝 TOP 15 palavras:\n")
for (i in 1:min(15, length(frequencia))) {
  cat(sprintf("%2d. %-20s: %2d ocorrências\n", 
              i, names(frequencia)[i], frequencia[i]))
}
cat("\n")

# 7. Gráfico de barras
# Pegar as top 10 palavras
top10 <- head(frequencia, 10)

# Criar gráfico de barras 
barplot(top10,
        main = "Palavras Mais Frequentes em Textos Educacionais",
        xlab = "Palavras",
        ylab = "Frequência",
        col = rainbow(10),
        las = 2,  # Texto vertical no eixo x
        cex.names = 0.8)

# 8. Estatísticas básicas
cat("\n📋 ESTATÍSTICAS DO TEXTO:\n")
cat("• Total de textos:", length(textos), "\n")
cat("• Total de palavras (todas):", length(palavras), "\n")
cat("• Total de palavras (filtradas):", length(palavras_filtradas), "\n")
cat("• Palavras únicas:", length(unique(palavras_filtradas)), "\n")
cat("• Palavra mais frequente: '", names(frequencia)[1], 
    "' (", frequencia[1], " vezes)\n", sep = "")

cat("📊 Gráfico de barras gerado.\n")
