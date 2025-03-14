
data.df <- read.table("http://people.math.umass.edu/~anna/Stat597AFall2016/rnf6080.dat", header = FALSE, sep = "")


nrow(data.df)#строки
ncol(data.df) #колонки

#имена
names(data.df)

#5 строка 7 столбца
data.df[5, 7]

# 2 строка
data.df[2,]


# 1-3  колонки год месяц день остальные колонки часы задается последовательно
names(data.df) <- c("year", "month", "day", seq(0,23))

#чекаем изменения
head(data.df)
tail(data.df)



#daily с суммой осадков 
data.df$daily <- rowSums(data.df[, 4:27])


hist(data.df$daily, main = "Гистограмма суточных осадков", xlab = "Количество осадков")

# Выводы:
#Гистограмма показывает, что большинство дней имеют небольшое количество осадков. 
#замена отрицательных осадков на 0
fixed.df <- data.df
fixed.df[, 4:27][fixed.df[, 4:27] < 0] <- 0

# Пересчет
fixed.df$daily <- rowSums(fixed.df[, 4:27])
hist(fixed.df$daily, main = "Гистограмма суточных осадков (исправлено)", xlab = "Количество осадков")
