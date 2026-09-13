# MATLAB 编码规则

## 命名规则

[ ] 命名要见名知意， 不要为了省事而写一个其他人无法看懂的名字

[ ] 文件夹名全部使用小写，单词之间使用"-"（减号）分隔, 用以增加可读性

[ ] 文档名全部使用小写，单词之间使用"-"（减号）分隔, 用以增加可读性

[ ] 函数名使用驼峰+尾词大写命名法

[ ] 函数名一般使用英文"动词"+"名词"的形式， 比如synthesizeCDAC, plotPSD, ...

[ ] 顶层wrapper/testbench使用驼峰+尾词大写命命名法

[ ] wrapper通常用来将底层函数分装成一个模型， 比如sar adc。因此，wrapper的命名一般使用"形容词"+"名词"的形式，比如conventionalSarADC

[ ] testbench用于仿真某一特定模型，所以可以使用sim，simulate, test等前缀+模型或者测试结果名， 比如simulateConventionalSarADC

[ ] 变量名使用驼峰+尾词大写命名法

## 缩进

[ ] 所有缩进使用空格

[ ] 缩进长度为2个空格

## 空格

[ ] 括号内部加括号

```matlab
( a + b )
```

[ ] 运算符， 等号两边加空格

```matlab
a = b
a + b
```

## 函数间的参数传递

[ ] 使用结构体在函数间传递参数, 具体参见sim-config文件夹里的示例

## 数组初始化

[ ] 使用nan来初始化数组

```matlab
samples = nan( 1024, 1 );
```

## 注释

[ ] 所有注释均使用英文

[ ] 要合理使用分块"%%"来提高代码块的可读性

## 循环

[ ] 如有可能避免使用for循环， 但是如果循环是模型本身的属性， 那么就可以用for

[ ] 尽量避免使用while循环

[ ] 严禁使用单个字母作为循环的index，比如"i", "j",  所有index都使用i+循环对象的命名方式

```matlab
for iSample = 1 : p.fftLen
  ...
end
```

## 出图

[ ] 避免使用系统默认的蓝黑线条，使用纯蓝, 线宽设置为2.5

```matlab
plot(iterRange, adc.enob, 'b', 'LineWidth', 2.5)
```

[ ] 可以使用marker来区分不同的线条

[ ] 每张图都要加grid， title， xlabel， ylabel

[ ] 合理设置xlim， ylim， 做到左右不留白， 上下不顶天立地