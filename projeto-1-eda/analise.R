# PROJETO 1 - ANÁLISE SIMPLES

# 1. Criar dados de exemplo
horas <- c(5, 8, 12, 15, 20, 10, 7, 18, 14, 9)
notas <- c(4.5, 5.0, 6.8, 7.2, 8.5, 6.0, 5.5, 7.8, 7.0, 5.8)

# 2. Calcular média
media_horas <- mean(horas)
media_notas <- mean(notas)

# 3. Mostrar resultados
cat("=== RESULTADOS DA ANÁLISE ===\n")
cat("Média de horas de estudo:", media_horas, "\n")
cat("Média das notas:", media_notas, "\n")
cat("Total de alunos:", length(horas), "\n")

# 4. Gráfico simples
plot(horas, notas, 
     main = "Relação: Horas de Estudo vs Notas",
     xlab = "Horas de estudo",
     ylab = "Notas",
     col = "blue",
     pch = 19)

# 5. Linha de tendência
abline(lm(notas ~ horas), col = "red")

cat("\n✅ Análise concluída! Veja o gráfico.\n")
