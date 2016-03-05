---
layout:     post
title:      Transient Array使用
category: Card
description: Creates a transient array
---
在Applet开发中，我们经常会遇到这种需求：当校验PIN命令成功后，我们可以获得文件的读权限，当复位或者重新选择应用后需要再次重新校验PIN才可以获取权限。  
可能你会这样做：定义一个变量a，校验PIN成功后给a赋值1，重新选择的时候给赋值为0。  
这种做法在PC编程中没有问题。  
在Java Card Applet开发中如果你把a定义在了E2P/Flash中也可以实现需求，但我们有更好的办法，那就是使用 transient array。  
 Transient Array对象的头是存放在E2P/Flash中的，而对象体（数值）却是存放在RAM中的。RAM的读写速度要比E2P/Flash快很多。   

Java Card API在JCSystem类中提供了makeTransientByteArray、makeTransientShortArray、makeTransientObjectArray、makeTransientBooleanArray四个临时数组创建的API，
其参数均有两个length与event，length代表了创建临时数组的大小，event代表在哪种情况下数组元素会被清空；event可取的值有CLEAR_ON_RESET、CLEAR_ON_DESELECT，当event为前者时
只有在复位时临时数组的值才会被清空，当event为后者时执行选择指令或复位时会情况数值。  

举个例子：  
private byte [] data1 ;  
private byte [] data2 ;  
//data1为4字节的临时数组，其初始值为0   
data1 = JCSystem.makeTransientByteArray((short)4, JCSystem.CLEAR_ON_DESELECT);  
//data2为4字节的临时数组，其初始值为0  
data2 = JCSystem.makeTransientByteArray((short)4, JCSystem.CLEAR_ON_RESET);  
data1[1] = 1;  
data2[1] = 2;  

当我们执行选择命令时data1数组的值变为全零，而data2[1]为2，其余为零；当执行复位时data1、data2数组的值全为零。  
Transient Array数组值既保证了速度，又降低了开发者的繁琐赋值。  
