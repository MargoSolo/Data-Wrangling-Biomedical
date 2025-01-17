## ---- include = FALSE---------------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
iris_lab <- iris



## -----------------------------------------------------------------------------
iris_lab %>% 
  mutate(across(.cols = !Species, round)) %>%
  head()


## -----------------------------------------------------------------------------

iris_lab %>% 
  mutate(across(.cols = !Species, ~ round(.x, digits = 1))) %>%
  head()


## -----------------------------------------------------------------------------
new_function = function(x){(x+2)/6}
iris_lab %>% 
  mutate(across(.cols = !Species, ~ new_function(.x))) %>%
  head()


## -----------------------------------------------------------------------------
div_function <- function(x, y){(x/y)+ 3}


## -----------------------------------------------------------------------------
map2_dbl(iris_lab$Sepal.Length, iris_lab$Sepal.Width, div_function) %>%
  head()


## -----------------------------------------------------------------------------
iris_lab %>%
filter(if_all(starts_with(c("Petal", "Sepal")), ~.x > 2 & .x < 6))  %>%
  head()


## -----------------------------------------------------------------------------
iris_lab <-iris_lab %>% 
              as_tibble() %>%
              modify_if(is.numeric, as.character)

head(iris_lab)

