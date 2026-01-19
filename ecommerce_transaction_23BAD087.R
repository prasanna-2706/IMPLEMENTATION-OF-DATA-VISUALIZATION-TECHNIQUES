library(ggplot2)
library(dplyr)
library(lubridate)
ecommerce_data <- read.csv(
  "C:/Users/PRASANNA/OneDrive/Documents/ecommerce_transactions.csv"
)
ecommerce_data <- na.omit(ecommerce_data)
cat("Name: PRASANNA S M\n")
cat("Roll No: 23BAD087\n")
ggplot(ecommerce_data, aes(x = Transaction_Amount)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 20) +
  ggtitle("Histogram of Transaction Amounts\nPRASANNA S M | 23BAD087") +
  theme_minimal()
ggplot(ecommerce_data, aes(y = Transaction_Amount)) +
  geom_boxplot(fill = "orange") +
  ggtitle("Outlier Detection using Boxplot\nPRASANNA S M | 23BAD087") +
  theme_minimal()
ecommerce_data$Transaction_Date <- as.Date(ecommerce_data$Transaction_Date)

ecommerce_data$Month <- floor_date(ecommerce_data$Transaction_Date, "month")

monthly_sales <- ecommerce_data %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Transaction_Amount))

ggplot(monthly_sales, aes(x = Month, y = "Total Sales", fill = Total_Sales)) +
  geom_tile() +
  scale_fill_gradient(low = "yellow", high = "red") +
  ggtitle("Monthly Sales Heatmap\nPRASANNA S M | 23BAD087") +
  xlab("Month") +
  ylab("") +
  theme_minimal()



