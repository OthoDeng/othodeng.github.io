#import "../book.typ": book-page
#import "@preview/dvdtyp:1.0.1": *
#show: book-page.with(title: "数值天气预报")

#show: dvdtyp.with(
  title: "数值天气预报",
  author: "Otto Deng"
)
#outline()


= 大气运动的基本方程组及坐标变换
== 旋转坐标系中的基本方程组
#example([物理定律$->$ 特定数学表现形式])[
  - 牛顿第二定律 $->$ 运动方程
  - 质量守恒定律 $->$ 连续方程
  - 能量守恒定律 $->$ 热力学方程
  - 气体实验定律 $->$ 状态方程
  - 水汽守恒定律定律 $->$ 水汽方程
]

1. 运动方程
#theorem("牛二")[
  $
    (dif arrow(V))/(dif t) = 
    - 1/rho gradient p 
    - 2 arrow(Omega) times arrow(V)
    + arrow(g)
    + arrow(F)
  $
气压梯度力+偏向力+重力+摩擦力
]

2. 连续方程
#theorem("质量守恒")[
  $
 
    &(dif rho)/(dif t) + rho gradient dot arrow(V) = 0\
    &(partial rho)/(partial t) + gradient dot (rho arrow(V)) &= 0
  
  $
]

3. 热力学方程
#theorem("能量守恒定律")[
  $
    &C_V (dif T)/(dif t) + p (dif alpha)/(dif t) = Q\
    ==>
    &C_p (dif T)/(dif t) - (R T)/p (dif p)/(dif t) = Q
  $
]

绝热情况下：
$
  C_p (dif T)/(dif t) - 1/rho (dif p)/(dif t) = 0, 
  (dif ln theta)/(dif t) = 0
$

4. 水汽方程
#theorem("水汽守恒")[
  $
    &(dif (rho_v delta tau))/(dif t) = S delta tau, rho_v = rho q\
    &(partial (rho q))/(partial t) + gradient dot (rho q arrow(V)) = S\
    ==>
    &(dif q)/(dif t) = (partial q)/(partial t) + arrow(V) gradient q = S/rho
  $
]

== 球坐标，局地坐标
For any location $P$ in the space can be expressed as: $P(lambda,Phi,r)$.

#definition("球坐标下位移、速度")[
  $
    cases( x = r cos phi delta lambda, delta y = r delta phi, delta z = delta r) =>
cases(
  u = r cos phi (dif lambda)/(dif t),
  v = r (dif phi)/(dif t),
  w = (dif r)/(dif t)
)
  $
]

$(partial arrow(i))/(partial x)$指向地轴，单位矢量$sin phi arrow(j) - cos phi arrow(k)$,
有：
$
(dif arrow(i))/(dif t) = u (partial arrow(i))/(partial x)
= u/(r cos phi) (sin phi arrow(j) - cos phi arrow(k))
$
$
  (dif arrow(j))/(dif t) = u (partial arrow(j))/(partial x) + v (partial arrow(j))/(partial y) ... =>
  (dif arrow(j))/(dif t) = - (u tg phi)/r arrow(i) + v/r arrow(k)
$

$
(dif arrow(k))/(dif t) = u/r arrow(i) + v/r arrow(j)
$

== 薄层近似以及简化方程组
#definition[
  薄层近似：$z << a$，其中$a$为地球半径
  $
    r = a + z approx.eq a => delta x = a cos phi delta lambda, delta y = a delta phi, delta z = delta r\
    ==>
    dif/(dif t) = partial/(partial t) + u/(a cos phi) (partial)/(partial lambda) + v/a (partial)/(partial phi) + w (partial)/(partial z)
  $
]

#theorem("薄层近似下的大气运动方程组")[
$
&(dif u)/(dif t) - (u v tg phi)/a = -1/rho (partial p)/(a cos phi partial lambda) +f v + F_lambda\
&(dif v)/(dif t) + (u^2 tg phi)/a = -1/rho (partial p)/(a partial phi) - f u + F_phi\
&(dif w)/(dif t) = -1/rho (partial p)/(partial z) - g + F_z\
&(dif rho)/(dif t) + rho ((partial u)/(a cos phi partial lambda) + (partial v)/(a partial phi) + (partial w)/(partial z) - v/a tg phi) = 0\
&C_p (dif T)/(dif t) - 1/rho (dif p)/(dif t) = Q\
&p = rho R T\
$
省略去了$(u^2 + v^2 )\/2, f u$（机械能守恒）
]

== 局地直角坐标系下方程组
#highlight[地球曲率不存在]，$tg phi$项删去。
#definition[$arrow(i),arrow(j),arrow(k)$不变][
  $
  &(dif arrow(i))/(dif t) = 0, (dif arrow(j))/(dif t) = 0, (dif arrow(k))/(dif t) = 0\
  ==> 
  &dif/(dif t) = partial/(partial t)  + v/a (partial)/(partial phi) + w (partial)/(partial z)
  $
]

== $p$坐标系下方程组
天气尺度大气运动具有准静力平衡$partial p \/ partial z = - rho g$

利用复合函数求导:
$
  cases(
    ((partial F)/(partial s))_z = 
  )
$

= 数值计算方法

== 时间积分以及空间积分
$
  (dif q)/(dif t) = f[q(t),t],  (dif q)/(dif t) = - kappa q a sin(omega t)
$
$
  (q^(n+1) - q^n)/((1+m)delta t) = beta f^(n+1) + a_n f^(n) + a_(n-1) f^(n-1) + ... + a_0 f^(0)
$


- $beta = 0$ 全隐格式，根据此时状态解出下一时刻状态。

$
  m =1, I = 0\
1/(2 delta t)
$

- $beta != 0$ 显式格式，同时解出此时状态和下一时刻状态。
Backward Scheme


Milne Scheme

1. 时间积分方式

$
  (dif u)/(dif t) =F
$

- 如果$(partial F)/(partial t)$ 为虚数，大气运动中常见的震动类问题。

假设$u = A(t) e^(-I k x)$，有：
#theorem[一维平流方程][
  $
&(partial u)/(partial t) + c (partial u)/(partial x) = 0\
 ==>&\
    &(dif A)/(dif t) = I k c A = I omega A, omega = k c
  $
]

如果$(partial F)/(partial t)$ 为实数，
#definition[
  1. $u^(n+1) = u^n + Delta t F^(n)$ 欧拉格式,$G>= 1$
  2. $u^(n+1) = u^n + Delta t F^(n+1)$ 后差格式 $G<= 1$
  3. $u^(n+1) = u^n +  Delta t (1/2 F^(n)+ 1/2 F^(n+1))$ 梯形格式 $G= 1$，绝对不稳定格式
]
化简为普遍形式：$u^(n+1) = u^n +  Delta t (A F^(n)+ B F^(n+1)), A+B = 1$
其中$F = I omega u$,进而有$F^n = I omega u^n$

增幅因子$G$：
$
  G = u^(n+1)/u^n  = (1+ A I  omega delta t)/(1 -B I omega delta t)
$


- 欧拉—后差格式（显式格式）：
$
  cases(
    u^(*,n+1) = u^n + Delta t F^n,
    u^(n+1) = u^n + Delta t F^(*, n+1)
  )
$
条件稳定。
- 修恩格式（隐式格式）：
$  cases(
    u^(*,n+1) = u^n + Delta t F^n,
    u^(n+1) = u^n + (Delta t)/2 (F^n + F^(*, n+1))
) 
$


2. 时间的截断误差
以惯性震荡为例
$
  (dif u)/(dif t) - f v = 0, (dif v)/(dif t) + f u = 0
$

令$W = u + i v, (dif W)/(dif t) = (dif u)/(dif t) + i (dif v)/(dif t) = - i f W$
