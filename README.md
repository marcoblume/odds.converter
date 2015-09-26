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


```
