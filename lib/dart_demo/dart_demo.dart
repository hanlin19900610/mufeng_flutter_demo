///Hello, world!
//void main(){
//  print('Hello, world!');
//}

void main(){
  //Dart 语言本质上是动态类型语言, 类型是可选的
  //可以使用var声明变量, 也可以使用类型来声明变量
  //一个变量也可以被赋予不同类型的对象
  //但大多数情况, 我们不会去改变一个类型的变量

  //字符串赋值的时候可以使用单引号, 也可以使用双引号
  var str1 = "MuFeng";
  var str2 = 'MuFeng';

  //如果使用的是双引号, 可以内嵌单引号
  //如果使用的是单引号, 可以内嵌双引号, 否则需要进行转义
  String str3 = 'She\'s Andy';
  String str4 = "She's Andy";

  //使用三个单引号或双引号
  var str5 = '''MuFeng Study
  Dart for Flutter!
  ''';
  var str6 = """MuFeng Study
  Dart for Flutter!
  """;
  /*
  在Dart中, 相邻的字符串在编译的时候会自动连接,
  这里出现一个问题, 如果多个字符串相邻, 中间的字符串不能为空, 否则会报错,
  但是如果单引号和双引号相邻, 即使是空值也不会报错
   */
  var name = 'Mu'""'Feng';
//  var name1 = 'Mu''''Feng'; // 会报错

  /*
  assert 是语言内置的断言函数, 仅在检查模式下有效,
  如果断言失败则程序立即终止
   */
  assert(name == "MuFeng");

  /*
  Dart中字符串不支持"+"操作符, 如str1 + str2,
  如果要连接字符串,除了上面说的, 相邻字符串自动连接外,
  还可以使用"$"插入变量的值
   */
  var name1 = "MuFeng";
  print("My name is "+name1+"ceshi");

  /*
  声明原始字符串, 直接在字符串前加字符"r", 可以避免"\"的转义作用, 在正则表达式中很有用
   */
  print(r"换行符: \n");

  /*
  Dart中数值是num, 它有两个子类型: int和double, int是任意长度的整数, double是双精度浮点数
   */
  var h = 59506490075;
  //进制转换方法
  print("整型转换为16进制: $h -> 0x${h.toRadixString(16).toUpperCase()}");

  var isShow = true;
  bool isHide = false;

  /*
  在声明变量的时候, 除了var, 还可以使用const和final, 同时,在使用const和final的时候, 可以省略var或者其他类型
   */
//  var n = 100;
//  const n = 100;
//  final n = 100;
//
//  int m = 100;
//  const int m = 100;
//  final int m = 100;

//  const list = const[1,2,3];//Ok
//  const list = [1,2,3];//Error

//  final list = [1,2,3];//Ok
//  final list = const[1,2,3];//Ok
//  final list = const[new DateTime.now(),2,3];//Error,const右边必须是常量

//print(list);


}