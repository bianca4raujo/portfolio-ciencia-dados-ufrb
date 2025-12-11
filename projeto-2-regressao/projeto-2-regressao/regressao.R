# PROJETO 2 - REGRESSÃO LINEAR SIMPLES

cat("=== PROJETO 2: MODELO DE REGRESSÃO ===\n\n")
# 1. Dados de exemplo (horas de estudo vs notas)
horas_estudo <- c(5, 8, 12, 15, 20, 10, 7, 18, 14, 9, 22, 16, 11, 13, 17)
notas <- c(4.5, 5.0, 6.0, 6.5, 7.5, 5.5, 5.0, 7.0, 6.5, 5.5, 8.0, 7.0, 6.0, 6.5, 7.0)
# 2. Criar modelo de regressão
modelo <- lm(notas ~ horas_estudo)
# 3. Mostrar resultados
cat("RESUMO DO MODELO:\n")
print(summary(modelo))
cat("\n")
# 4. Coeficientes 
cat("EQUAÇÃO DA RETA:\n")
cat(sprintf("Nota = %.2f + %.2f * Horas de Estudo\n", 
            coef(modelo)[1], coef(modelo)[2]))
cat("\n")
# 5. Fazer previsão
cat("PREVISÃO PARA 10 HORAS DE ESTUDO:\n")
nova_hora <- data.frame(horas_estudo = 10)
previsao <- predict(modelo, nova_hora)
cat(sprintf("Nota prevista: %.2f\n", previsao))
cat("\n")
# 6. Gráfico
plot(horas_estudo, notas,
     main = "Regressão Linear: Horas de Estudo vs Nota",
     xlab = "Horas de estudo",
     ylab = "Nota",
     col = "darkgreen",
     pch = 19,
     cex = 1.2)
# Linha de regressão
abline(modelo, col = "red", lwd = 2)
# Legenda
legend(x = 5, y = 8,  # Coordenadas específicas no eixo
       legend = c("Dados", "Linha"),
       col = c("darkgreen", "red"),
       pch = c(19, NA),
       lty = c(NA, 1))
cat("✅ PROJETO 2 CONCLUÍDO!\n")
cat("Gráfico gerado com sucesso.\n")
