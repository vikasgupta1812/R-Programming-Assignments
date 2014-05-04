Title
========================================================



```r
library(data.table)
```



```r
`?`(data.table)
```



```r
df <- data.frame(x = c("b", "b", "b", "a", "a"), v = rnorm(5))
df
```

```
##   x       v
## 1 b  0.3658
## 2 b  0.2822
## 3 b  1.2991
## 4 a -1.1545
## 5 a -1.1217
```




```r
dt <- data.table(x = c("b", "b", "b", "a", "a"), v = rnorm(5))
dt
```

```
##    x       v
## 1: b  1.2678
## 2: b -1.5329
## 3: b  0.8948
## 4: a -1.0158
## 5: a -1.8249
```



```r
CARS <- data.table(cars)
head(CARS)
```

```
##    speed dist
## 1:     4    2
## 2:     4   10
## 3:     7    4
## 4:     7   22
## 5:     8   16
## 6:     9   10
```



```r
tables()
```

```
##      NAME NROW MB COLS       KEY
## [1,] CARS   50 1  speed,dist    
## [2,] dt      5 1  x,v           
## Total: 2MB
```




```r
dt
```

```
##    x       v
## 1: b  1.2678
## 2: b -1.5329
## 3: b  0.8948
## 4: a -1.0158
## 5: a -1.8249
```




```r
dt[2, ]
```

```
##    x      v
## 1: b -1.533
```





```r
dt[dt$x == "b", ]
```

```
##    x       v
## 1: b  1.2678
## 2: b -1.5329
## 3: b  0.8948
```





```r
dt["b", ]
```

```
## Error: When i is a data.table (or character vector), x must be keyed (i.e.
## sorted, and, marked as sorted) so data.table knows which columns to join
## to and take advantage of x being sorted. Call setkey(x,...) first, see
## ?setkey.
```




```r
setkey(dt, x)
```



```r
dt
```

```
##    x       v
## 1: a -1.0158
## 2: a -1.8249
## 3: b  1.2678
## 4: b -1.5329
## 5: b  0.8948
```




```r
haskey(dt)
```

```
## [1] TRUE
```



```r
key(dt)
```

```
## [1] "x"
```





```r
dt["b", ]
```

```
##    x       v
## 1: b  1.2678
## 2: b -1.5329
## 3: b  0.8948
```



```r
dt["b", mult = "first"]
```

```
##    x     v
## 1: b 1.268
```



```r
dt["b", mult = "last"]
```

```
##    x      v
## 1: b 0.8948
```




```r
dt["b"]
```

```
##    x       v
## 1: b  1.2678
## 2: b -1.5329
## 3: b  0.8948
```




```r
grpsize <- ceiling(1e+07/26^2)
grpsize
```

```
## [1] 14793
```




```r
tt = system.time(df <- data.frame(x = rep(LETTERS, each = 26 * grpsize), y = rep(letters, 
    each = grpsize), v = runif(grpsize * 26^2), stringsAsFactors = F))
tt
```

```
##    user  system elapsed 
##   1.705   0.196   1.901
```




```r
head(df, 3)
```

```
##   x y      v
## 1 A a 0.6725
## 2 A a 0.6047
## 3 A a 0.4608
```






```r
tail(df, 3)
```

```
##          x y      v
## 10000066 Z z 0.3352
## 10000067 Z z 0.9158
## 10000068 Z z 0.8208
```





```r
dim(df)
```

```
## [1] 10000068        3
```


Extract arbitrary group from df



```r
tt = system.time(ans1 <- df[df$x == "R" & df$y == "h", ])
tt
```

```
##    user  system elapsed 
##   1.520   0.073   1.593
```



```r
head(ans1, 3)
```

```
##         x y      v
## 6642058 R h 0.8479
## 6642059 R h 0.8844
## 6642060 R h 0.2180
```



```r
dim(ans1)
```

```
## [1] 14793     3
```

Convert to data.table 


```r
dt <- as.data.table(df)
system.time(setkey(dt, x, y))
```

```
##    user  system elapsed 
##   0.206   0.013   0.219
```


Binary search

```r
ss = system.time(ans2 <- dt[J("R", "h")])
ss
```

```
##    user  system elapsed 
##   0.002   0.000   0.002
```

```r
# tt
```


vector scan


```r
system.time(ans1 <- dt[x == "R" & y == "h", ])
```

```
##    user  system elapsed 
##   0.685   0.021   0.706
```



```r
system.time(ans2 <- df[df$x == "R" & df$y == "h", ])
```

```
##    user  system elapsed 
##   1.546   0.071   1.617
```



```r
identical(dt[J("R", "h"), ], dt[data.table("R", "h"), ])
```

```
## [1] TRUE
```


Fast grouping 



```r
head(dt)
```

```
##    x y      v
## 1: A a 0.6725
## 2: A a 0.6047
## 3: A a 0.4608
## 4: A a 0.5769
## 5: A a 0.4294
## 6: A a 0.5180
```

```r
dt[, sum(v)]
```

```
## [1] 5001246
```

When we supply a j expression and a ’by’ list of expressions, the j expression is repeated for each ’by’ group:



```r
dt[, sum(v), by = x]
```

```
##     x     V1
##  1: A 192437
##  2: B 192116
##  3: C 192560
##  4: D 192644
##  5: E 192450
##  6: F 192465
##  7: G 192597
##  8: H 192131
##  9: I 192120
## 10: J 192514
## 11: K 192400
## 12: L 192644
## 13: M 192162
## 14: N 192374
## 15: O 192222
## 16: P 192349
## 17: Q 191988
## 18: R 192212
## 19: S 192257
## 20: T 192193
## 21: U 192423
## 22: V 192539
## 23: W 192446
## 24: X 192074
## 25: Y 192470
## 26: Z 192458
##     x     V1
```

The by in data.table is fast. Let’s compare it to tapply.



```r
ttt = system.time(tt <- tapply(dt$v, dt$x, sum))
ttt
```

```
##    user  system elapsed 
##   3.158   0.261   3.418
```



```r
sss = system.time(ss <- dt[, sum(v), by = x])
sss
```

```
##    user  system elapsed 
##   0.222   0.039   0.261
```



```r
head(tt)
```

```
##      A      B      C      D      E      F 
## 192437 192116 192560 192644 192450 192465
```



```r
head(ss)
```

```
##    x     V1
## 1: A 192437
## 2: B 192116
## 3: C 192560
## 4: D 192644
## 5: E 192450
## 6: F 192465
```



```r
as.vector(tt)
```

```
##  [1] 192437 192116 192560 192644 192450 192465 192597 192131 192120 192514
## [11] 192400 192644 192162 192374 192222 192349 191988 192212 192257 192193
## [21] 192423 192539 192446 192074 192470 192458
```



```r
ss$V1
```

```
##  [1] 192437 192116 192560 192644 192450 192465 192597 192131 192120 192514
## [11] 192400 192644 192162 192374 192222 192349 191988 192212 192257 192193
## [21] 192423 192539 192446 192074 192470 192458
```




```r
identical(as.vector(tt), ss$V1)
```

```
## [1] TRUE
```


Next, let’s group by two columns:



```r
ttt = system.time(tt <- tapply(dt$v, list(dt$x, dt$y), sum))
ttt
```

```
##    user  system elapsed 
##   3.832   0.366   4.199
```




```r
sss = system.time(ss <- dt[, sum(v), by = "x,y"])
sss
```

```
##    user  system elapsed 
##   0.273   0.005   0.277
```




```r
tt[1:5, 1:5]
```

```
##      a    b    c    d    e
## A 7429 7394 7363 7402 7431
## B 7421 7432 7391 7350 7474
## C 7389 7407 7407 7413 7389
## D 7410 7441 7411 7383 7451
## E 7382 7436 7403 7375 7413
```



```r
head(ss)
```

```
##    x y   V1
## 1: A a 7429
## 2: A b 7394
## 3: A c 7363
## 4: A d 7402
## 5: A e 7431
## 6: A f 7400
```




```r
identical(as.vector(t(tt)), ss$V1)
```

```
## [1] TRUE
```

```r

```



t(tt)


==========================================================
http://stackoverflow.com/questions/13493124/outer-join-data-table-r


```r
a <- data.table(a = c(1, 2, 3), b = c(3, 4, 5))
a
```

```
##    a b
## 1: 1 3
## 2: 2 4
## 3: 3 5
```

```r
b <- data.table(a = c(1, 2), k = c(1, 2))
b
```

```
##    a k
## 1: 1 1
## 2: 2 2
```

```r
setkey(a, a)
setkey(b, a)

key(a)
```

```
## [1] "a"
```

```r
key(b)
```

```
## [1] "a"
```



```r
b[a, ]
```

```
##    a  k b
## 1: 1  1 3
## 2: 2  2 4
## 3: 3 NA 5
```

```r
a[b, ]
```

```
##    a b k
## 1: 1 3 1
## 2: 2 4 2
```



TODO:http://stackoverflow.com/questions/12773822/why-does-xy-join-of-data-tables-not-allow-a-full-outer-join-or-a-left-join







================================================


```r
require(data.table)
```




```r
# create a regular data.frame
theDF <- data.frame(A = 1:10, B = letters[1:10], C = LETTERS[11:20], D = rep(c("One", 
    "Two", "Three"), length.out = 10))
theDF
```

```
##     A B C     D
## 1   1 a K   One
## 2   2 b L   Two
## 3   3 c M Three
## 4   4 d N   One
## 5   5 e O   Two
## 6   6 f P Three
## 7   7 g Q   One
## 8   8 h R   Two
## 9   9 i S Three
## 10 10 j T   One
```



```r
# create a data.table
theDT <- data.table(A = 1:10, B = letters[1:10], C = LETTERS[11:20], D = rep(c("One", 
    "Two", "Three"), length.out = 10))
# print them and compare
theDF
```

```
##     A B C     D
## 1   1 a K   One
## 2   2 b L   Two
## 3   3 c M Three
## 4   4 d N   One
## 5   5 e O   Two
## 6   6 f P Three
## 7   7 g Q   One
## 8   8 h R   Two
## 9   9 i S Three
## 10 10 j T   One
```


Multiple columns in a data.frame should be specified as a character vector. With data.tables the columns should be specified as a list of the actual names, not as characters.


```r
theDT[, list(A, C)]
```

```
##      A C
##  1:  1 K
##  2:  2 L
##  3:  3 M
##  4:  4 N
##  5:  5 O
##  6:  6 P
##  7:  7 Q
##  8:  8 R
##  9:  9 S
## 10: 10 T
```




```r
# just one column
theDT[, B]
```

```
##  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
```


one column while maintaining data.table structure

```r
theDT[, list(B)]
```

```
##     B
##  1: a
##  2: b
##  3: c
##  4: d
##  5: e
##  6: f
##  7: g
##  8: h
##  9: i
## 10: j
```


If we must specify the column names as characters (perhaps because they were passed as arguments to a function), the with argument should be set to FALSE.



```r
theDT[, "B", with = FALSE]
```

```
##     B
##  1: a
##  2: b
##  3: c
##  4: d
##  5: e
##  6: f
##  7: g
##  8: h
##  9: i
## 10: j
```



```r
theDT[, c("A", "C"), with = FALSE]
```

```
##      A C
##  1:  1 K
##  2:  2 L
##  3:  3 M
##  4:  4 N
##  5:  5 O
##  6:  6 P
##  7:  7 Q
##  8:  8 R
##  9:  9 S
## 10: 10 T
```


This time we used a vector to hold the column names instead of a list. These nuances are important to proper functions of data.tables but can lead to a great deal of frustration.

##Keys

show tables

```r
tables()
```

```
##      NAME        NROW  MB COLS       KEY
## [1,] a              3   1 a,b        a  
## [2,] ans1      14,793   1 x,y,v      x,y
## [3,] b              2   1 a,k        a  
## [4,] CARS          50   1 speed,dist    
## [5,] dt    10,000,068 229 x,y,v      x,y
## [6,] ss           676   1 x,y,V1     x,y
## [7,] theDT         10   1 A,B,C,D       
## Total: 235MB
```

The key is used to index the data.table and will provide the extra speed.

set the key


```r
setkey(theDT, D)
```


show the data.table again


```r
theDT
```

```
##      A B C     D
##  1:  1 a K   One
##  2:  4 d N   One
##  3:  7 g Q   One
##  4: 10 j T   One
##  5:  3 c M Three
##  6:  6 f P Three
##  7:  9 i S Three
##  8:  2 b L   Two
##  9:  5 e O   Two
## 10:  8 h R   Two
```


The data have been reordered according to column D, which is sorted alphabetically.



```r
key(theDT)
```

```
## [1] "D"
```



```r
tables()
```

```
##      NAME        NROW  MB COLS       KEY
## [1,] a              3   1 a,b        a  
## [2,] ans1      14,793   1 x,y,v      x,y
## [3,] b              2   1 a,k        a  
## [4,] CARS          50   1 speed,dist    
## [5,] dt    10,000,068 229 x,y,v      x,y
## [6,] ss           676   1 x,y,V1     x,y
## [7,] theDT         10   1 A,B,C,D    D  
## Total: 235MB
```



This adds some new functionality to selecting rows from data.tables. In addition to selecting rows by the row number or by some expression that evaluates to TRUE or FALSE, a value of the key column can be specified.




```r
theDT["One", ]
```

```
##      D  A B C
## 1: One  1 a K
## 2: One  4 d N
## 3: One  7 g Q
## 4: One 10 j T
```




```r
theDT[c("One", "Two"), ]
```

```
##      D  A B C
## 1: One  1 a K
## 2: One  4 d N
## 3: One  7 g Q
## 4: One 10 j T
## 5: Two  2 b L
## 6: Two  5 e O
## 7: Two  8 h R
```


More than one column can be set as the key.


```r
# install.packages('ggplot2')
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```r
data(diamonds)
diamondsDT <- data.table(diamonds)
setkey(diamondsDT, cut, color)
```


To access rows according to both keys, there is a special function named J. It takes multiple arguments, each of which is a vector of values to select.


```r
diamondsDT[J("Ideal", "E"), ]
```

```
##         cut color carat clarity depth table price    x    y    z
##    1: Ideal     E  0.23     SI2  61.5    55   326 3.95 3.98 2.43
##    2: Ideal     E  0.26    VVS2  62.9    58   554 4.02 4.06 2.54
##    3: Ideal     E  0.70     SI1  62.5    57  2757 5.70 5.72 3.57
##    4: Ideal     E  0.59    VVS2  62.0    55  2761 5.38 5.43 3.35
##    5: Ideal     E  0.74     SI2  62.2    56  2761 5.80 5.84 3.62
##   ---                                                           
## 3899: Ideal     E  0.70     SI1  61.7    55  2745 5.71 5.74 3.53
## 3900: Ideal     E  0.51    VVS1  61.9    54  2745 5.17 5.11 3.18
## 3901: Ideal     E  0.56    VVS1  62.1    56  2750 5.28 5.29 3.28
## 3902: Ideal     E  0.77     SI2  62.1    56  2753 5.84 5.86 3.63
## 3903: Ideal     E  0.71     SI1  61.9    56  2756 5.71 5.73 3.54
```



```r
diamondsDT[J("Ideal", c("E", "D")), ]
```

```
##         cut color carat clarity depth table price    x    y    z
##    1: Ideal     E  0.23     SI2  61.5    55   326 3.95 3.98 2.43
##    2: Ideal     E  0.26    VVS2  62.9    58   554 4.02 4.06 2.54
##    3: Ideal     E  0.70     SI1  62.5    57  2757 5.70 5.72 3.57
##    4: Ideal     E  0.59    VVS2  62.0    55  2761 5.38 5.43 3.35
##    5: Ideal     E  0.74     SI2  62.2    56  2761 5.80 5.84 3.62
##   ---                                                           
## 6733: Ideal     D  0.51    VVS2  61.7    56  2742 5.16 5.14 3.18
## 6734: Ideal     D  0.51    VVS2  61.3    57  2742 5.17 5.14 3.16
## 6735: Ideal     D  0.81     SI1  61.5    57  2748 6.00 6.03 3.70
## 6736: Ideal     D  0.72     SI1  60.8    57  2757 5.75 5.76 3.50
## 6737: Ideal     D  0.75     SI2  62.2    55  2757 5.83 5.87 3.64
```



##data.table Aggregation

The primary benefit of indexing is faster aggregation. While aggregate and the various d*ply functions will work because data.tables are just enhanced data.frames, they will be slower than using the built-in aggregation functionality of data.table.



we calculate the mean price of diamonds for each type of cut.

```r
aggregate(price ~ cut, diamonds, mean)
```

```
##         cut price
## 1      Fair  4359
## 2      Good  3929
## 3 Very Good  3982
## 4   Premium  4584
## 5     Ideal  3458
```


To get the same result using data.table, we do this:



```r
diamondsDT[, mean(price), by = cut]
```

```
##          cut   V1
## 1:      Fair 4359
## 2:      Good 3929
## 3: Very Good 3982
## 4:   Premium 4584
## 5:     Ideal 3458
```

The only difference between this and the previous result is that the columns have different names. To specify the name of the resulting column, pass the aggregation function as a named list.



```r
diamondsDT[, list(price = mean(price)), by = cut]
```

```
##          cut price
## 1:      Fair  4359
## 2:      Good  3929
## 3: Very Good  3982
## 4:   Premium  4584
## 5:     Ideal  3458
```



To aggregate on multiple columns, specify them as a list().



```r
diamondsDT[, mean(price), by = list(cut, color)]
```

```
##           cut color   V1
##  1:      Fair     D 4291
##  2:      Fair     E 3682
##  3:      Fair     F 3827
##  4:      Fair     G 4239
##  5:      Fair     H 5136
##  6:      Fair     I 4685
##  7:      Fair     J 4976
##  8:      Good     D 3405
##  9:      Good     E 3424
## 10:      Good     F 3496
## 11:      Good     G 4123
## 12:      Good     H 4276
## 13:      Good     I 5079
## 14:      Good     J 4574
## 15: Very Good     D 3470
## 16: Very Good     E 3215
## 17: Very Good     F 3779
## 18: Very Good     G 3873
## 19: Very Good     H 4535
## 20: Very Good     I 5256
## 21: Very Good     J 5104
## 22:   Premium     D 3631
## 23:   Premium     E 3539
## 24:   Premium     F 4325
## 25:   Premium     G 4501
## 26:   Premium     H 5217
## 27:   Premium     I 5946
## 28:   Premium     J 6295
## 29:     Ideal     D 2629
## 30:     Ideal     E 2598
## 31:     Ideal     F 3375
## 32:     Ideal     G 3721
## 33:     Ideal     H 3889
## 34:     Ideal     I 4452
## 35:     Ideal     J 4918
##           cut color   V1
```


To aggregate multiple arguments, pass them as a list. Unlike with aggregate, a different metric can be measured for each column.



```r
diamondsDT[, list(price = mean(price), carat = mean(carat)), by = cut]
```

```
##          cut price  carat
## 1:      Fair  4359 1.0461
## 2:      Good  3929 0.8492
## 3: Very Good  3982 0.8064
## 4:   Premium  4584 0.8920
## 5:     Ideal  3458 0.7028
```






```r
diamondsDT[, list(price = mean(price), carat = mean(carat), caratSum = sum(carat)), 
    by = cut]
```

```
##          cut price  carat caratSum
## 1:      Fair  4359 1.0461     1684
## 2:      Good  3929 0.8492     4166
## 3: Very Good  3982 0.8064     9743
## 4:   Premium  4584 0.8920    12301
## 5:     Ideal  3458 0.7028    15147
```


Finally, both multiple metrics can be calculated and multiple grouping variables can be specified at the same time.



```r
diamondsDT[, list(price = mean(price), carat = mean(carat)), by = list(cut, 
    color)]
```

```
##           cut color price  carat
##  1:      Fair     D  4291 0.9201
##  2:      Fair     E  3682 0.8566
##  3:      Fair     F  3827 0.9047
##  4:      Fair     G  4239 1.0238
##  5:      Fair     H  5136 1.2192
##  6:      Fair     I  4685 1.1981
##  7:      Fair     J  4976 1.3412
##  8:      Good     D  3405 0.7445
##  9:      Good     E  3424 0.7451
## 10:      Good     F  3496 0.7759
## 11:      Good     G  4123 0.8509
## 12:      Good     H  4276 0.9147
## 13:      Good     I  5079 1.0572
## 14:      Good     J  4574 1.0995
## 15: Very Good     D  3470 0.6964
## 16: Very Good     E  3215 0.6763
## 17: Very Good     F  3779 0.7410
## 18: Very Good     G  3873 0.7668
## 19: Very Good     H  4535 0.9159
## 20: Very Good     I  5256 1.0470
## 21: Very Good     J  5104 1.1332
## 22:   Premium     D  3631 0.7215
## 23:   Premium     E  3539 0.7177
## 24:   Premium     F  4325 0.8270
## 25:   Premium     G  4501 0.8415
## 26:   Premium     H  5217 1.0164
## 27:   Premium     I  5946 1.1449
## 28:   Premium     J  6295 1.2931
## 29:     Ideal     D  2629 0.5658
## 30:     Ideal     E  2598 0.5784
## 31:     Ideal     F  3375 0.6558
## 32:     Ideal     G  3721 0.7007
## 33:     Ideal     H  3889 0.7995
## 34:     Ideal     I  4452 0.9130
## 35:     Ideal     J  4918 1.0636
##           cut color price  carat
```



