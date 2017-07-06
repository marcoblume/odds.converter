<div style='position:relative;float:right;'><img src='r-odds-converter-sm.png'></div>

[![CRAN Status Badge](https://www.r-pkg.org/badges/version/odds.converter)](https://cran.r-project.org/package=odds.converter) [![CRAN Total Downloads](http://cranlogs.r-pkg.org/badges/grand-total/odds.converter)](https://cran.r-project.org/package=odds.converter) [![CRAN Monthly Downloads](http://cranlogs.r-pkg.org/badges/odds.converter)](https://cran.r-project.org/package=odds.converter)

# odds.converter

This package includes functions to transform sports betting odds from one format into another.

These betting odds formats are covered in odds.converter at the moment

* US Odds _(shortform us)_
* Decimal Odds _(shortform dec)_
* Probability _(shortform prob)_
* Honk Kong Odds _(shortform hk)_
* Malaysian Odds _(shortform malay)_
* Indonesian Odds _(shortform indo)_


Please contact me if there is a betting odds format that needs to be added to this package.

Fractional Odds commonly used by bookmakers in the U.K. are not included as the transformation of these Odds is not very well defined and Fractional Odds are not used outside of the U.K and have been largely replaced by Decimal Odds.

### Installation

```{r}
# Install from Cran
install.packages("odds.converter")

# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("marcoblume/odds.converter")
```

## Usage

### Transform specific odds into specific odds
The package contains functions to transform one specific odds type into another specific odds type.
These functions are called:

odds.**Shortform**2**Shortform** 

For example

```{r}
library(odds.converter)
odds.us2dec(-115)
odds.prob2malay(0.5)
odds.indo2hk(0.8)
```

### Transform specific odds into all other odds format

To transform a specific odds type into all other odds type use the functions that are called odds.**Shortform**2all 

For example

```{r}
library(odds.converter)
odds.dec2all(-115)
odds.prob2all(0.5)
odds.indo2all(0.8)
```

### Calculating the implied probability (fair value) of betting odds

Bookmakers will include a margin to their betting odds that will increase the total probability of the offered odds above 100%.
If a bookmaker would offer a coin flip instead of offering 50% for heads and 50% for tails the bookmaker would have 51% for heads and 51% for tails for example thus guaranteeing that they would make a small profit for every wager on the coin flip.


```r{}
odds.prob2dec(0.51)
```

To calculate the margin that bookmaker offers convert the odds into probability and sum them.

Betting Odds:

Manchester United  Decimal Odds 1.3
Arsenal            Decimal Odds 9.0
Draw               Decimal Odds 4.0


```{r}
sum(odds.dec2prob(c(1.3,9,4)))
1.130342
```
The build margin is slightly over 13%

To calculate the real implied probability use the function odds.fv()

Example: Calculate the implied probability of the above match without margin added

```{r}
odds.fv(1.3,9,4,input = "dec",output = "dec")
1.469444 10.173077  4.521368
```

Example: Calculate the implied probability of the above match without margin added

```{r}
odds.fv(1.3,9,4,input = "dec",output = "prob")
0.68052930 0.09829868 0.22117202
```

Example: Calculate the implied probability of a data.frame containing Home and Away odds

```{r}
df <- data.frame(Home = c(1.5,1.8,1.9),
                 Away = c(2.9,2.2,2.05))
odds.fv(df,input = "dec",output = "prob")
        Home      Away
[1,] 0.6590909 0.3409091
[2,] 0.5500000 0.4500000
[3,] 0.5189873 0.4810127
```
It is also possible to submit vectors as input to calculate the implied Probability

```{r}
odds.fv(df$Home,df$Away,input="dec",output="prob")
```

Example: Calculate the implied probablity of home and away lines with dplyr

```{r}
library(dplyr)

df <- data.frame(Home = c(1.5,1.8,1.9),
                 Away = c(2.9,2.2,2.05))
                 

df %>% 
  rowwise() %>% 
  mutate(FairHome = odds.fv(Home,Away,
                            input =   "dec",
                            output = "prob")[1]) %>% 
  mutate(FairAway = 1 - FairHome)
```

As rowwise() slows down the calculation and the calculation of fair values for Home and Away odds is a common use case odds.fv() has an option (Vectorized2wayOutput1stElement = TRUE), which can speed up the computation significantly for this specific use case.

```{r}
df %>% 
  mutate(FairHome = odds.fv(Home,Away,
                            input =   "dec",
                            output = "prob",
                            Vectorized2wayOutput1stElement = TRUE)) %>% 
  mutate(FairAway = 1 - FairHome)
```

### Calculate Parlays

To calculate the fair price for a parlay input the betting odds of each of the parlay legs and use odds.parlay()

```{r}
odds.parlay(c(-105,-110),output="dec")
