# Java答疑课 - 第四周

## Misc

1. 中国大学MOOC注册
2. Vijso注册，收藏[科蚪实务学堂2019春季][1]，网址https://vijos.org/d/kidolab_2019_Spring/
3. 用电脑，不要用手机！！
4. 用电脑，不要用手机！！
5. 用电脑，不要用手机！！
6. 收藏[kido-2019-spring][2]，网址https://github.com/wlnirvana/kido-2019-spring
   1. homework
   2. lectures
   3. tutorials
7. 耳机

[1]:https://vijos.org/d/kidolab_2019_Spring/
[2]:https://github.com/wlnirvana/kido-2019-spring


## 上周出现的问题

1. `System.out.println("Hello")；`
2. `System.out.println(4/2.0);`
3. `if (1 < 0); {System.out.println("1 < 0";)}`

## 如何做作业

1. 将Vijos默认语言设置为Java：`偏好设置` - `默认代码语言` - `Java`。
2. 为每一道题目新建一个项目（project）。
3. 为每一个项目新建一个叫做`Main`的class，并勾选自动生成`main`方法。
4. 上周作业的重要提示。
5. 在Eclipse跑通程序。
6. 输出必须**完全一样**。
7. 提交。

## 答案示例：P1002科蚪学堂自动售货机

```Java
import java.util.Scanner;

import java.io.PrintStream;

public class Main {

	public static void main(String[] args) throws java.io.UnsupportedEncodingException {
		// TODO Auto-generated method stub
		PrintStream ps = new PrintStream(System.out, true, "UTF-8");
		double paid = 0;
		int code = 0;
		String[] items = { "本子", "辣条", "电脑", "小熊" };
		double[] prices = { 2.5, 2, 1000 };

		Scanner in = new Scanner(System.in);

		ps.println("欢迎使用科蚪学堂自动售货机！");
		ps.println();
		ps.println("您可以购买：");
		ps.println("1. 本子。单价：2.5元");
		ps.println("2. 辣条。单价：2元");
		ps.println("3. 电脑。单价：1000元");
		ps.println("4. 小熊。单价：你猜？");
		ps.println();

		ps.println("请输入想要购买的物品代码：");
		code = in.nextInt();
		if (code < 0 || code > 4) {
			ps.println("您的输入有误！");
		} else if (code == 4) {
			ps.println("抱歉，小熊是非卖品:)");
		} else {
			ps.println("您选择的是[" + items[code - 1] + "]，价格为[" + prices[code - 1] + "元]");
			ps.println("请放钞（元）：");
			paid = in.nextDouble();
			ps.println();
			if (paid < prices[code - 1]) {
				ps.println("就这点钱，你逗我玩呢？");
			} else {
				ps.println("请取走您的[" + items[code - 1] + "]，以及找零[" + (paid - prices[code - 1]) + "]元");
				ps.println("感谢您的使用！欢迎再来！");
			}
		}
	}

}
```