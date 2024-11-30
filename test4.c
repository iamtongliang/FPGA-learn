
/*请在下方编写你的代码,仅需提交填写的部分*/
#include <stdio.h>
#include <math.h>

int main() {
    // 提示用户输入年薪和税率
    //printf("Please input salary per year and tax rate: ");
    double salary, tax_rate;
    // 读取用户输入的年薪和税率
    scanf("%lf %lf", &salary, &tax_rate);
    // 打印用户输入的年薪和税率
    //printf("salary: %f, tax_rate: %f\n", salary, tax_rate);

    // 初始化变量
    double ayears = 1.0; // 初始化年份为1
    // 将税率从百分比转换为小数，并加1，以便后续计算
    //tax_rate = tax_rate / 100 + 1;
    // 初始化商品价格
    double price = 200 * pow(tax_rate/100+1, ayears-1);

    // 使用 while 循环计算需要多少年才能攒够购买商品所需的资金
    // 循环条件是总存款小于商品价格且年份小于等于20
    while (ayears * salary < price && ayears <= 20) {
        ayears++; // 每年增加1
        // 更新商品价格，使其按税率增长
        price = 200 * pow(tax_rate/100+1, ayears-1);
    }

    // 打印最终的商品价格和总存款（即年薪乘以年份）
    //printf("Total price is %12.2lf\n", price);
    //printf("Total deposit is %12.2lf \n", ayears * salary);

    // 判断是否能够购买
    if (ayears * salary >= price) {
        // 如果总存款大于等于商品价格，则打印可以购买的信息
        printf("%.0f", ayears);
    } else {
        // 否则，打印无法购买的信息
        printf("Impossible");
        //printf("You can't afford it as your current salary per year.\n");
    }

    return 0; // 程序正常结束
}
/*请在上方填写你的代码,仅需提交填写的部分*/