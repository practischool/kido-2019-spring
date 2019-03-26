# Java答疑课 - 第五周

## Misc

1. 视频看完了吗？时间不够看吗？什么时候开始看的？截止到上周五看了多少？周日呢？
2. `print`函数试用了吗？
3. 什么时候开始做的编程挑战？希望每周花多久做完？
4. 上周周三过后，每天的时间投入统计。有没有投入？什么时间投入的？投入了多久？
5. 做笔记。

## 提问

1. 进入[科蚪实务学堂2019春季][1]，然后点页面最顶部的[讨论][2]。也可直接输入网址https://vijos.org/d/kidolab_2019_Spring/discuss
2. 提问之前，先找找看有没有类似的问题。
3. 如果没有的话，点右边的`问答`（在`讨论节点`-`探索`下面），然后点`创建一个讨论`。
4. 使用`插入代码`功能（也就是`<>`），将你的源代码填写进去。
5. 再次`插入代码`功能，将你的错误信息填写进去。
6. 填写标题等其他信息，然后`创建`。
7. 我会每晚查看一次。

[1]:https://vijos.org/d/kidolab_2019_Spring/
[2]:https://vijos.org/d/kidolab_2019_Spring/discuss

## 如何做作业

1. 将Vijos默认语言设置为Java：`偏好设置` - `默认代码语言` - `Java`。
2. 为每一道题目新建一个项目（project）。
3. 为每一个项目新建一个叫做`Main`的class，并勾选自动生成`main`方法。
4. 将第一行之外的所有内容，替换为初始代码（见文末）。
5. 完成你的程序，并在Eclipse跑通。
6. 输出必须**完全一样**。
7. 提交。

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