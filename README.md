# odds.converter

This package includes functions to transform US Odds, Decimal Odds , Malaysian Odds , Indonesian Odds , Honk Kong Odds and Probability into each other.

Please contact me if there is a betting odds format that you want added to the package.

Fractional Odds commonly used by bookmakers in th U.K. are not included as I believe them to be an artifact.

Betting Odds:

Manchester United  Decimal Odds 1.3
Arsenal            Decimal Odds 9.0
Draw               Decimal Odds 4.0

Example: Calculate the margin build into the betting odds

```{r}
sum(odds.dec2prob(c(1.3,9,4)))
1.130342
```
The build margin is slightly over 13%

Example: Calculate the implied decimal odds of the above match without margin added

```{r}
odds.fv(1.3,9,4,input = "dec",output = "dec")
1.469444 10.173077  4.521368
```

Example: Calculate the implied Probability of the above match without margin added

```{r}
odds.fv(1.3,9,4,input = "dec",output = "prob")
0.68052930 0.09829868 0.22117202
```

Example: Calculate the implied Probability of a data.frame containing Home and Away odds

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


