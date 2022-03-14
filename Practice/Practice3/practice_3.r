#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#profit
profit <- revenue - expenses
round(profit / 1000, 0) #profit result

#profit after tax
tax <- round(0.30 * profit, 2)
tax

profit.after.tax <- profit - tax
profit.after.tax

#mean profit
mean_pat <- mean(profit.after.tax)
mean_pat

#4. good months
good.months <- profit.after.tax[profit.after.tax > mean_pat]
good.months

#5. bad months
bad.months <- profit.after.tax[profit.after.tax < mean_pat]
bad.months

#6. best month
best.month <- profit.after.tax[profit.after.tax == max(profit.after.tax)]
best.month

# 7. worst month
worst.month <- profit.after.tax[profit.after.tax == min(profit.after.tax)]
worst.month
