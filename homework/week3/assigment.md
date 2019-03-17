# 第三周作业

## 注册Vijos（30分）

1. 在浏览器中打开[Vijos][1]，或手动在地址栏中输入并访问https://vijos.org/
2. 点击页面右上角的`注册`。
3. 输入自己的邮箱地址，并点击`发送验证邮件`。
4. 登录自己的邮箱，你应该收到了一封题目类似`注册 - Vijos`的邮件。
5. 点击这封邮件中的链接，会新打开一个页面。
6. 输入你想用的用户名，建议使用首字母缩写+数字的组合，如`张三丰`可使用`zsf`或`zsf2019`。
7. 输入你想用的密码，并重复输入确认密码。
8. 点击`注册`。
9. 恭喜你！你已经注册完成啦！

[1]:https://vijos.org/

## 加入科蚪（10分）

1. 在浏览器中打开[Vijos-科蚪实务学堂2019春季邀请页面][2]，或手动在地址栏中输入并访问https://vijos.org/d/kidolab_2019_Spring/join?code=kidolab2019
2. 邀请码（**应该已经自动填好**）为`kidolab2019`，然后点击`加入`。
3. Yeah~！10分到手！

[2]:https://vijos.org/d/kidolab_2019_Spring/join?code=kidolab2019
   
## 认领作业（10分）

1. 在浏览器中打开[Vijos-科蚪实务学堂2019春季首页][3]，或手动在地址栏中输入并访问https://vijos.org/d/kidolab_2019_Spring/
2. 点击`作业`-`第三周`
3. 在打开的页面右边点击`认领作业`。
4. 如果认领成功，你将会看到3道题目：
   1. P1000 Hello World
   2. P1001 你好世界
   3. P1002 科蚪学堂自动售货机
5. 注意这次作业的开始时间和截至时间哦:)

[3]:https://vijos.org/d/kidolab_2019_Spring/

## 完成作业（50分）

1. 三道题目依次为5分、15分、30分。
2. 点击任意一道题目，阅读相关信息。
3. 编程完成题目。（你可以选择在Eclipse里面编写代码，完成后经过简单调整，即可复制粘贴到Vijos。）
4. 点击页面右边的`递交`。
5. 代码语言选择`Java`
6. 将你的代码复制、粘贴。
7. 点击`提交`，等待结果。

## 重要提示

在线编程平台对于中文字符的处理比较特殊，所有提交的程序都必须注意以下几点：

1. 你的程序最开始**不能**有类似`package xxx;`一行。
2. 你的程序最开始的`import`部分，必须有一行是`import java.io.PrintStream;`。
3. 你的`class`必须是`Main`，注意大小写。
4. 你的`main`函数必须长这个样子：`public static void main(String[] args) throws java.io.UnsupportedEncodingException`
5. `main`函数的第一行必须写成这样：`PrintStream ps = new PrintStream(System.out, true, "UTF-8");`
6. 你不可以再使用`System.out.println`，而必须得全部替换成`ps.println`。

关于这几点提示，可以参考下面这个程序

```Java
import java.util.Scanner;               // 注意事项1，没有package xxxx
import java.io.PrintStream;             // 注意事项2

public class Main {                     // 注意事项3
    public static void main(String[] args) throws java.io.UnsupportedEncodingException {    // 注意事项4
        PrintStream ps = new PrintStream(System.out, true, "UTF-8");    // 注意事项5
        ps.println("五个注意事项都弄对了~");         // 注意事项6
        ps.println("程序才能通过~HAHAHAHAHA~");     // 注意事项6
        ps.println("不然~");                      // 注意事项6
        ps.println("别怪我没提示你");               // 注意事项6
	}
}
```