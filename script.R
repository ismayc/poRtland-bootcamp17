# Minimum temperature at each airport for each month 
# (ignore missing values)
library(nycflights13); library(tidyverse); library(readr)

weather <- read_csv("http://bit.ly/nyc-weather-13")

# Also need to do this to get the time to match up (Maybe skip?)
weather <- weather %>%
  mutate(time_hour = time_hour + lubridate::dhours(8))

first <- ggplot(data = weather,
  mapping = aes(x = month, group = month, y = temp)) +
  geom_boxplot() +
  scale_x_continuous(breaks = 1:12)

all_ports <- weather %>% group_by(month) %>%
  summarize(min_temp = min(temp, na.rm = TRUE))

ggplot(data = all_ports, 
  mapping = aes(x = month, y = min_temp)) +
  geom_point() +
  scale_x_continuous(breaks = 1:12)

small_temps <- weather %>% group_by(origin, month) %>%
  summarize(min_temp = min(temp, na.rm = TRUE))

ggplot(data = small_temps, 
  mapping = aes(x = month, y = min_temp)) +
  geom_line(mapping = aes(color = origin)) +
  geom_point() +
  scale_x_continuous(breaks = 1:12)

write_csv(weather, "nyc-weather-13.csv")

# What is this weird temperature?
library(plotly); ggplotly(first)

weather %>% filter(month == 5) %>%
  filter(temp == min(temp)) %>% View()
# 2013-05-09 02:00:00 
# month == 5 & day == 9 & hour == 2

weather %>% filter(month == 5, day == 9) %>%
  filter(origin == "JFK") %>% View()

# Replace value with mean of two hourly ratings around the weird one
weather <- weather %>%
  mutate(temp = ifelse(month == 5 & day == 9 & hour == 2, 
    yes = mean(c(57.02, 57.2)),
    no = temp)
  )

#####

# Redo analysis