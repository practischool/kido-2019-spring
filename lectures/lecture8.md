# Java答疑课 - 第八周

- [Java答疑课 - 第八周](#java%E7%AD%94%E7%96%91%E8%AF%BE---%E7%AC%AC%E5%85%AB%E5%91%A8)
  - [复习](#%E5%A4%8D%E4%B9%A0)
  - [题目讲解](#%E9%A2%98%E7%9B%AE%E8%AE%B2%E8%A7%A3)
  - [小数转整数例子](#%E5%B0%8F%E6%95%B0%E8%BD%AC%E6%95%B4%E6%95%B0%E4%BE%8B%E5%AD%90)
  - [玩一玩](#%E7%8E%A9%E4%B8%80%E7%8E%A9)

## 复习

1. 如果你不教会电脑，它比婴儿的脑袋都蠢。
2. 程序运行流程
   1. 顺序
   2. 绕路（会回来）
   3. 分叉（不回来）
   4. 多路分叉
   5. 循环

## 题目讲解

1. 强盗的收入：[粗心][2]。
2. 阿里巴巴的暗号：[没验证范例][1]就提交。
3. 阿里巴巴的财富：
   1. [整数除法][3]
   2. [小数转整数][4]，参考最后的[例子](#%E5%B0%8F%E6%95%B0%E8%BD%AC%E6%95%B4%E6%95%B0%E4%BE%8B%E5%AD%90)。
4. 阿里巴巴的读心术：
   1. [玩一玩](#%E7%8E%A9%E4%B8%80%E7%8E%A9)
   2. 原理：每次排除一半答案
   3. 难点：猜错的那个数要不要排除？以1000为例。

## 小数转整数例子

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("实验1");
        System.out.println((int) 5.0);
        System.out.println((int) 5.1);
        System.out.println((int) 5.4);
        System.out.println((int) 5.5);
        System.out.println((int) 5.9);
        System.out.println();

        System.out.println("实验2");
        System.out.println(10 - 5.0);
        System.out.println(10 - 5.1);
        System.out.println(10 - 5.4);
        System.out.println(10 - 5.5);
        System.out.println(10 - 5.9);
        System.out.println();

        System.out.println("实验3");
        System.out.println((int) 10 - 5.0);
        System.out.println((int) 10 - 5.1);
        System.out.println((int) 10 - 5.4);
        System.out.println((int) 10 - 5.5);
        System.out.println((int) 10 - 5.9);
        System.out.println();

        System.out.println("实验4");
        System.out.println(10 - (int) 5.0);
        System.out.println(10 - (int) 5.1);
        System.out.println(10 - (int) 5.4);
        System.out.println(10 - (int) 5.5);
        System.out.println(10 - (int) 5.9);
        System.out.println();

        System.out.println("实验5");
        System.out.println((int) (10 - 5.0));
        System.out.println((int) (10 - 5.1));
        System.out.println((int) (10 - 5.4));
        System.out.println((int) (10 - 5.5));
        System.out.println((int) (10 - 5.9));
        System.out.println();
    }
}
```

## 玩一玩

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int cnt = 0;
        int low = 1;
        int high = 1000;
        int guess;
        int feedback;
        Scanner in = new Scanner(System.in);

        while (true) {
            guess = (low + high) / 2;
            cnt++;
            System.out.println("#" + cnt + ": " + guess);
            System.out.println("猜对了请按0。如果猜错了，你心中的数比它大请按1，并它小请按2。");
            feedback = in.nextInt();
            if (feedback == 0) {
                System.out.println("88~");
                break;
            } else if (feedback == 1) {
                low = guess + 1;
            } else {
                high = guess - 1;
            }
        }
    }
}
```

[1]:https://vijos.org/d/kidolab_2019_Spring/records/5cb19f9af41362798651523f
[2]:https://vijos.org/d/kidolab_2019_Spring/records/5caead4cf413627987515427
[3]:https://vijos.org/d/kidolab_2019_Spring/records/5caea68df4136279865150cf
[4]:https://vijos.org/d/kidolab_2019_Spring/records/5caea818f4136279865150d0