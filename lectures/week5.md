# Java答疑课 - 第五周

## Misc

1. 视频看完了吗？时间不够看吗？什么时候开始看的？截止到上周五看了多少？周日呢？
2. `print`函数试用了吗？
3. 什么时候开始做的编程挑战？希望每周花多久做完？
4. 上周周三过后，每天的时间投入统计。有没有投入？什么时间投入的？投入了多久？
5. 做笔记。

[1]:https://vijos.org/d/kidolab_2019_Spring/
[2]:https://vijos.org/d/kidolab_2019_Spring/discuss

## 如何做作业

1. 将Vijos默认语言设置为Java：`偏好设置` - `默认代码语言` - `Java`。
2. 为每一道题目新建一个项目（project）。
3. 为每一个项目新建一个叫做`Main`的class，并勾选自动生成`main`方法。
4. 将第一行之外的所有内容，替换为初始代码（见文末）。
5. 完成你的程序，并在Eclipse跑通。
6. 输出必须**完全一样**。
7. Format code。
8. 提交。

## “低”斯求和

1. 打印“Hello World”
2. 打印1
3. 从1打印到3
4. 从1打印到100
5. 从a打印到100
6. 从a打印到b
7. 打印加号
8. 在一行之内打印

## 初始代码

```java
import java.util.Scanner;
import java.io.PrintStream;

public class Main {
    public static void main(String[] args) throws java.io.UnsupportedEncodingException {
        PrintStream ps = new PrintStream(System.out, true, "UTF-8");
        Scanner in = new Scanner(System.in);

        // 请从下一行开始你的程序
        
    }
}
```