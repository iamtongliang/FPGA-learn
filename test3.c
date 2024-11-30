#include <stdio.h>
#include <math.h>
#include <stdbool.h>

#define BASE_PRICE 200
#define MAX_YEARS 20

bool can_buy(double salary, double tax_rate, double ayears, double *price) {
    // 初始化商品价格//第一年不计算涨幅
     *price = BASE_PRICE * pow(tax_rate, (ayears-1));

    if ( salary * ayears >= *price ) {
        return true;
    } else {
        return false;
    }
}

int main() {
    
    // 提示用户输入年薪和税率
    printf("Please input salary per year and tax rate: ");
    double salary, tax_rate;
    // 读取用户输入的年薪和税率
    scanf("%lf %lf", &salary, &tax_rate);
    // 打印用户输入的年薪和税率
    printf("salary: %f, tax_rate: %f\n", salary, tax_rate);

    // 初始化变量
    double ayears = BASE_PRICE / salary; // 初始化年份为1
    // 将税率从百分比转换为小数，并加1，以便后续计算
    tax_rate = tax_rate / 100 + 1;
    // 初始化商品价格
    double price = BASE_PRICE * pow(tax_rate, ayears);

    // 使用 while 循环计算需要多少年才能攒够购买商品所需的资金
    // 循环条件是总存款小于商品价格且年份小于等于MAX_YEARS
    while (can_buy(salary, tax_rate, ayears, &price) == false && ayears <= MAX_YEARS) {
        ayears++; // 每年增加1
    }

    // 打印最终的商品价格和总存款（即年薪乘以年份）
    printf("Total price is %12.2lf after %3.2f years\n", price, ayears);
    printf("Total deposit is %12.2lf after %3.2f years\n", ayears * salary, ayears);

    // 判断是否能够购买
    if (can_buy(salary, tax_rate, ayears, &price) == true) {
        // 如果总存款大于等于商品价格，则打印可以购买的信息
        printf("The number of years is %12.2lf\n You can buy it.\n", ayears);
    } else {
        // 否则，打印无法购买的信息
        printf("The number of years is %12.2lf\n ", ayears);
        printf("You can't afford it as your current salary per year.\n");
    }

    return 0; // 程序正常结束
}
