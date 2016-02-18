---
layout:     post
title:      RSA 算法
category: Card
description: 非对称算法
---
1978年，MIT三位年青数学家R.L.Rivest，A.Sham和L.Adleman发现了一种用数论构造双钥的方法，称作MIT体制，后来被广泛称之RSA体制。它既可用于加密、又可用于数字签字，易懂且易于实现(如果你了解了椭圆曲线加密你就知道这个有多简单了)，是目前仍然安全并且逐步被广泛应用的一种体制。国际上一些标准化组织ISO、ITU、及SWIFT等均已接受RSA体制作为标准。在Internet中采用的PGP(Pretty GoodPrivacy)也将RSA作为传送会话密钥和数字签字的标准算法。


**1.选取两个不同的大素数 p 和 q.**

<span style="line-height: 1.7;">考虑到安全原因，p和q需要随机取而长度应该相同。</span>

**2.计算n, n = pq.**

n 是公钥和私钥的模，模长是按bit位来计算的.

<strong style="line-height: 1.7;">3. φ(n) = φ(p)φ(q) = (p &#8211; 1)(q &#8211; 1) .</strong><span style="line-height: 1.7;"> [注1]<br /> </span>

φ 是欧拉函数，φ(n)是小于或等于n中与n互质的数的个数（注意，要考虑等于的时候，比如数字1）

例如：φ(1)=1，因为1与本身互诉；φ(8)=4，因为1，3，5，7与8互质

**4.e的选择, 1 < e < φ(n) 且 gcd(e, φ(n)) = 1;即e与** φ(n)互质**.**

e 被称为公钥指数.
  
e一般推荐为3或2^16 + 1 = 65,537.但e为3时算法的可靠性降低，故取65537（0x10001）.

**5. 根据前面的e，求出e的模反元素d,d=e^1 mod n —> 1 ≡ ed mod φ(n).**

d被称为私钥指数.

**6.1.加密**

<span style="line-height: 1.7;"> c ≡ m^e mod n .   0 ≤ m < n          [注2]</span>
  
m为整数形式的明文（可以通过ASCII码/UNICODE码转换），c为加密后的结果。用公钥加密

**6.2.解密**

m ≡ c^d mod n .      [注2]
  
私钥恢复出明文。

用公钥加密，只要拥有私钥的人才能解出加密后的数据，保证了数据不会暴露；

若用私钥加密，公钥解密，这个过程叫签名与验签，私钥签名保证了数据不会被篡改，因为只有拥有私钥的人才可以签名，签名的之前一般要先计算一下重要数据的HASH值，最后连同HASH值一同签名，公钥验签的时候，先恢复出数据，再自己计算一个HASH值，然后与恢复出来的HASH值相比较。

**7.1. 签名**

****  c ≡ m^d mod n,

**7.2.验签**

m ≡ c^e mod n.

<span style="line-height: 1.7;">在实际计算过程中，若要计算a^b可以使用CRT算法（中国剩余定理）。</span>

密钥产生完毕后要注意销毁p和q。

若你实现了一个解密的函数RSA_Dencryption,且知道了e、d和n，那么这个函数都可以加密、解密、签名、验签。


注1：
  
<span style="line-height: 1.7;">p,q是两个素数，分别列出小于n的数，小于p的数，小于q的数Zn、Zp、Zq：</span>
  
Zn = { 1, 2, 3,&#8230; p,&#8230;, 2p,&#8230;,(p-2)q,&#8230;., (p-1)q, &#8230; ,pq-1 }
  
Zp = { p, 2p,3q,&#8230;,(q-1)p }
  
Zq = { q, 2q,3q,&#8230;,(p-1)q }
  
明显地，Zn 有 pq-1 个数, Zp 有 q-1 个数, Zq 有 q-1 个数;
  
而n = pq,故n mod k = 0, k 属于 Zp；<span style="line-height: 1.7;">n mod j = 0, j 属于 Zq.</span>

φ(n) = pq-1 &#8211; (q-1) &#8211; (p-1) = pq &#8211; q &#8211; p + 1
  
φ(p) = p &#8211; 1 (p 为素数)
  
φ(q) = q &#8211; 1 (q 为素数)
  
φ(p)φ(q) = (p-1)(q-1) = pq &#8211; q &#8211; p + 1

所以有 φ(n) = φ(p)φ(q)  成立。

[注2]:

<span style="line-height: 1.7;">c ≡ m1^e mod n —> c = kn + m1^e,  k为正整数.</span>

m2 ≡ c^d mod n

order a = kn , b = m1^e;
  
c^d = ( kn + m1^e )^d = a^d + a^（d-1）\*b + a^（d-2）\*b^2 + a^（d-3）\*b^3 + &#8230; + a^2\*b^（d-2）+ a*b^（d-1） + b^d
  
c ≡ b mod a/k , (a+b) mod n =(a mod n + b mod n) mod n —>
  
c^d ≡ m1^ed mod n
  
m2 ≡ c^d ≡ m1^ed mod n,
  
ed ≡ 1 mod φ(n) —> ed = k(p-1)(q-1) + 1
  
m2 ≡ m1^ed mod n = m1*(m1^(p-1))^(kq-k) mod n

m1^(p-1) ≡ 1 mod p (p 为素数, 费马小定理 )

(m1^(p-1))^(kq-k) ≡ 1^(kq-k) mod p = 1 mod p
  
m2 ≡ m1*(m1^(p-1))^(kq-k) ≡ m1 mod p
  
同理 m2 ≡ m1 mod p 可被证明.

m2 ≡ m1 mod p , m2 ≡ m1 mod q , n = pq , m1 < n , m2 < n ,p,q 是两个不同的素数 —> m2 ≡ m1 mod n = m1 , m2 mod n = m2 ,故 m1 = m2.

证毕.
