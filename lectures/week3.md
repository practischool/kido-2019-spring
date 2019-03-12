# Java答疑课 - 第二周

## 作业情况

1. 用邮箱注册中国大学MOOC？
2. 注册第六次课程？
3. 作业进度？
4. 视频进度？

## 上周出现的问题

1. Package Explorer
2. 变量名。`Scanner in = new Scanner(System.in);`与`Scanner sc = new Scanner(System.in);`。
3. `System.out.println("找零" + ("应收：" + in.nextLine) - ("实收：" + in.nextLine));`
4. `System.out.println("找零" + ("应收：" + in.nextLine() - "实收：" + in.nextLine());`
5. `System.out.println("找零" + "in.nextLine() - in.nextLine());"`
6. 代码自动排版：Source - Format
    ```Java
    import java.util.Scanner;

    public class Main {

        public static void main(String[] args) {
            int a = 0;
                double b = 3.14;
                    int c = 10;
    System.out.println(a); System.out.println(b);
    System.out.println("HAHAHAHAHA");
        }
    }
    ```