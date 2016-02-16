---
layout:     post
title:      APDU命令与响应格式
category: Card
description: APDU结构及响应格式
---
####命令格式
APDU命令由命令头和命令体组成: CLA | INS | P1 | P2 | Lc | DATA | Le  
命令头: CLA | INS | P1 | P2   
命令体: Lc | DATA | Le    
######命令各字段含义
CLA：命令报文的类别字节  
P1： 参数 1  
P2：参数 2  
Lc：Data的长度（含4字节mac）  
Data：在命令的数据字段中发送的字节串  
Le：在向命令响应的数据字段中期望的字节最大数  

#####命令可分为四种情况：
Case1 |  CLA INS P1 P2  
Case2 |  CLA INS P1 P2 Le  
Case3 | CLA INS P1 P2 Lc Data  
Case4 | CLA INS P1 P2 Lc Data Le  
#####Case1
这种情况时，命令中没有数据送到卡（ Lc）中，也没有数据从卡中返回（ Le）。  
不含安全报文的命令： CLA | INS | P1 | P2   
含安全报文的命令： CLA | INS | P1 | P2 |  Lc | MAC  
注： Lc = MAC 的长度， 4 字节。
#####Case2
这种情况时，命令中没有数据送到卡（ Lc）中，有数据从卡中返回（ Le）。  
不含安全报文的命令： CLA | INS | P1 | P2 | Le  
含安全报文的命令： CLA | INS | P1 | P2 | Lc | MAC | Le  
注： Lc = MAC 的长度， 4 字节。  
#####Case3
这种情况时，命令中有数据送到卡（ Lc）中，没有数据从卡中返回（ Le）。  
不含安全报文的命令： CLA | INS | P1 | P2 | Lc | Data  
含安全报文的命令：  CLA | INS | P1 | P2 | Lc | Data+MAC  
注： Lc = 数据的长度 + MAC 的长度（ 4 字节）。  
#####Case4
这种情况时，命令中既有数据送到卡（ Lc）中，也有数据从卡中返回（ Le）。  
不含安全报文的命令： CLA | INS | P1 | P2 | Lc | Data | Le  
含安全报文的命令： CLA | INS | P1 | P2 | Lc | Data+MAC | Le  
注： Lc = 数据的长度 + MAC 的长度（ 4 字节）。  

####响应格式
#####格式1
| Data |  SW1 SW2 |  
#####格式2
| SW1 SW2 |  
######响应各字段含义
Data：在响应的数据字段中收到的字节串  
SW1：状态字 1  
SW2：状态字 2  

&nbsp;
