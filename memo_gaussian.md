# Memo for Gaussian Mixture Model (GMM)

Gaussian distribution is a distribution that follows normal distribution with mean mu, variance sigam square.

It can be expressed as

N(x|mu, sigam^2) = 1/sqrt(2pi*sigma^2) * exp(-1/(2sigma^2)*(x - mu)^2)

ここにxに数値を与えると、その正規分布内でｘが発生する確率（確率密度）を与える。

分布の平均 mu = 1, 分布の分散 sigma = 1, の場合

x = 1 が発生する確率は

```
> x <- 1
> 1/sqrt(2*pi*sigma^2) * exp(-1/(2*sigma^2)*(x - mu)^2)
[1] 0.3989423
```
およそ40%となる。

一方、xが平均1より1離れた0ないしは2の時は、以下の通り
```
> x <- 0
> 1/sqrt(2*pi*sigma^2) * exp(-1/(2*sigma^2)*(x - mu)^2)
[1] 0.2419707
> x <- 2
> 1/sqrt(2*pi*sigma^2) * exp(-1/(2*sigma^2)*(x - mu)^2)
[1] 0.2419707
```

平均から同じ距離の差のため、平均分布にしたがって確率密度は同じ値になる。

分布の裾野は分布の中に占める率がとても低い。

```
> x <- 3
> 1/sqrt(2*pi*sigma^2) * exp(-1/(2*sigma^2)*(x - mu)^2)
[1] 0.05399097
> x <- 4
> 1/sqrt(2*pi*sigma^2) * exp(-1/(2*sigma^2)*(x - mu)^2)
[1] 0.004431848
```

xが3,4と平均1から遠ざかるにつれて、確率密度は激減するのだ。
