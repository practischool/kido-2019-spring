# Java答疑课 - 第十二周

- [Java答疑课 - 第十二周](#java%E7%AD%94%E7%96%91%E8%AF%BE---%E7%AC%AC%E5%8D%81%E4%BA%8C%E5%91%A8)
  - [项目：帮助Avaj小学的人完成作业](#%E9%A1%B9%E7%9B%AE%E5%B8%AE%E5%8A%A9avaj%E5%B0%8F%E5%AD%A6%E7%9A%84%E4%BA%BA%E5%AE%8C%E6%88%90%E4%BD%9C%E4%B8%9A)
  - [总结](#%E6%80%BB%E7%BB%93)
  - [题解讲评](#%E9%A2%98%E8%A7%A3%E8%AE%B2%E8%AF%84)
  - [反例代码](#%E5%8F%8D%E4%BE%8B%E4%BB%A3%E7%A0%81)

## 项目：帮助Avaj小学的人完成作业

1. 上周以来的改变
   1. 我：作业方式，视频选择
   2. 你们：保持时间投入，坐到前面且不用手机电脑，学习习惯（有制度吗？）
2. 作业完成情况
   1. 故意没做规划
   2. 艺璇漏填，青松乱填
   3. 燕群、诚杰填得比较清晰
   4. 青松、艾克，到底想不想完成？不要急着回答我，思考清楚。
   5. 下一周，任务会重得多
3. 方案
   1. 我：难度偏高，减少课程内容
   2. 你们
      1. 时间投入不够，时间安排不合理（拖到最后一天），自律能力不够
      2. 每周一起规划，继续记录
      3. 加课时，集体学，收手机

## 总结

1. 如何声明/创建一个变量？
2. 有哪些类型？
3. 如何声明一个数组？

## 题解讲评

1. 类型的重要性，不同的类型，可进行的操作是不一样的。[例子][3]
2. 清晰的思路，一次只干好一件事。反例，[题目][1]，[代码][2]。

## 反例代码

```java
import java.util.Scanner;
import java.io.PrintStream;

public class Sketch {
    public static void main(String[] args) throws java.io.UnsupportedEncodingException {
        PrintStream ps = new PrintStream(System.out, true, "UTF-8");
        Scanner in = new Scanner(System.in, "UTF-8");

        int geshu = in.nextInt();

        int xuehao[] = new int[geshu];
        String mingzi[] = new String[geshu];
        double fenshu[] = new double[geshu];

        for (int i = 0; i < xuehao.length; i++) {
            xuehao[i] = in.nextInt();
            mingzi[i] = in.next();
            fenshu[i] = in.nextDouble();
        }
        
        int k = 0;
        for (int j = 0; j < xuehao.length; j++) {
            if (fenshu[k] < fenshu[j]) {
                fenshu[k] = fenshu[j];
                k = j;
            }
            if (j == geshu - 1) {
                ps.println("分数最高的是" + mingzi[k]);
                ps.println(mingzi[k] + "的学号是" + xuehao[k]);
                ps.println(mingzi[k] + "考了" + (int) fenshu[k] + "分");
            }
        }
    }
}
```

[1]:https://vijos.org/d/kidolab_2019_Spring/homework/5cc5a1c1f413627f6f940bb8/1040
[2]:#反例代码
[3]:https://vijos.org/d/kidolab_2019_Spring/discuss/5ce37b15f4136234c9c27e75