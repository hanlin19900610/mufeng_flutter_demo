### 前言
> Flutter使用Dart语言开发, Dart是面向对象编程语言, 由Google2011年推出, 目前最新版本是2.4.0. 
>
>工欲善其事,必先利其器.
>
>为了更好的开发Flutter应用, 本文将系统的学习一下Dart基础

### Hello, world!
学习任何一门编程语言时, 基本上都是输出一个Hello, world!

本文档采用的编辑器是Android Studio(因为本人是做Android开发的)进行开发

新建dart_demo.dart文件, Dart程序是从main()函数开始执行的,代码如下:
```
void main(){
  print('Hello, world!');
}
```
编辑完成后, 点击右键菜单中的Run菜单便可以运行Dart文件

### 数据类型
Dart中所有东西都是对象, 包括数字、函数等<br>
它们都继承自Object, 并且默认值都是null(包括数字)因此数字、字符串都可以调用各种方法

Dart中支持以下数据类型:

- num
- String
- bool
- List(也就是数组)
- Map

Drat语言本质上是动态类型语言, 类型是可选的, 可以使用var声明变量, 也可以使用类型来声明变量

#### 1. String(字符串类型)
字符串赋值的时候, 可以使用单引号, 也可以使用双引号
```
var str1 = "MuFeng";
String str2 = 'MuFeng';
```
如果使用的是双引号, 可以内嵌单引号, 如果使用的是单引号, 可以内嵌双引号, 否则需要"\\"转义
```
var str1 = "My name is 'MuFeng'";
var str2 = 'My name is "MuFeng"';
var str3 = "My name is \"MuFeng\"";
```
使用三个单引号或者三个双引号可以多行字符串赋值
```
var str5 = '''MuFeng Study
Dart for Flutter!
''';
var str6 = """MuFeng Study
Dart for Flutter!
""";
```
在Dart中, 相邻的字符串在编译的时候会自动连接, 这里出现一个问题, 如果多个字符串相邻, 中间的字符串不能为空, 否则会报错, 但是如果单引号和双引号相邻, 即使是空值也不会报错
```
var name = 'Mu''''Feng';//报错
var name1 = 'Mu'""'Feng';//不会报错
```
assert 是语言内置的断言函数, 仅在检查模式下有效, 如果断言失败则程序立即终止
```
assert(name == "MuFeng");
```
Dart中字符串拼接的三种方式:
1. 采用"+"拼接
2. 采用上面说的"相邻的字符串自动连接"
3. 采用"$"插入变量的值, 也可以采用"${}"插入表达式
```
var name = "MuFeng";
print("My name is $name");
```
声明原始字符串, 直接在字符串前加字符"r", 可以避免"\\"的转义作用, 在正则表达式中很有用
```
print(r"换行符: \n");
```
#### 2. num(数字类型)
Dart中数值是num, 它有两个子类型: int和double, int是任意长度的整数, double是双精度浮点数
```
var h = 59506490075;
//进制转换方法
print("整型转换为16进制: $h -> 0x${h.toRadixString(16).toUpperCase()}");
```
#### 3. bool(布尔类型)
和其他语言一样, 布尔类型只有两种结果"true"和"false"
```
var isShow = true;
bool isHide = false;
```

#### 4. const 和 final
在声明变量的时候, 除了var, 还可以使用const和final, 同时,在使用const和final的时候, 可以省略var或者其他类型
```
var n = 100;
const n = 100;
final n = 100;

int m = 100;
const int m = 100;
final int m = 100;
```
const和final定义的都是常量, 值不能改变, 并且在声明的时候就必须初始化, 区别是:

- const定义的是编译时常量, 只能用编译时常量来初始化
- final定义的常量可以用变量来初始化

```
final name = Name(); //OK
const name = Name(); //会报错
```
var、final等在左边定义变量的时候, 并不关心右边是不是常量, 但是如果右边用了const, 那么不管左边如何, 右边都必须是常量
```
const list = const[1,2,3];//Ok
const list = [1,2,3];//Ok
final list = [1,2,3];//Ok
final list = const[1,2,3];//Ok
final list = const[Name(),2,3];//Error,const右边必须是常量
```

### 函数
#### 1. 函数定义
函数也是对象, 当没有指定返回值的时候, 函数返回null
```
String sayHello(String name){
  return 'Hello, $name!';
}
main(){
  assert(sayHello is Function, "类型判断错误");
  print(sayHello("MuFeng"));
}
```
> 注意: 断言函数assert(), Debug模式下, 当表达式的值为false时抛出异常, 在新版SDK中, assert()添加了第二个参数message, 用于在抛出异常的时候, 输出具体信息

因为Dart中类型是可选的, 也可以这样写
```
sayHello(name){
    return "Hello, $name!";
}
```
不过建议明确函数的输入类型和返回值类型, 这样方便修改,方便阅读

如果函数只是简单的返回一个表达式的值, 可以使用箭头语法"=>expr;", 它等价于"{return expr;}", 所以上面的函数可以这么修改:
```
sayHello(name) => "Hello, $name!";
```

Dart中匿名函数的写法"()=>expr;"
定义匿名函数:
```
var sayHello = (name) => "Hello, $name!";
```

#### 2. 函数别名
- 普通的函数定义. 在赋值之后, 会丢失函数签名信息
```
class Sort{
  Function compare;

  Sort(int f(Object a, Object b)){
    compare = f;
  }
}

int sort1(Object a, Object b) => 0;

main(){
  Sort sort = Sort(sort1);
  assert(sort.compare is Function); //丢失了函数的具体的信息, 函数签名信息
}
```
- 给函数起一个别名, 使用起来比较方便
```
typedef int Compare(Object a, Object b);

class Sort{
  Compare compare;

  Sort(this.compare);
}

int sort(Object a, Object b) => 0;

main(){
  Sort s = Sort(sort);
  assert(s.compare is Function);
  assert(s.compare is Compare);
}
```
#### 3. 可选参数
Dart中支持两种可选参数: 命名可选参数和位置可选参数, 但是两种可选参数不能同时使用

- 命名可选参数使用大括号{}, 大括号外的参数是必填参数, 大括号内的参数可以指定0个或多个, 并与顺序无关, 在调用函数的时候需要指明参数名, 没有赋值的参数为null
- 位置可选参数使用中括号[], 在位置可选参数的函数中, 中括号内的参数可以指定0个或多个, 在调用的时候, 参数值会依次按顺序赋值

```
FunA(a,{b,c=3,d=4,e}){
  print("$a $b $c $d $e");
}

FunB(a, [b,c=3,d=4,e]){
  print("$a $b $c $d $e");
}

main(){
  FunA(1,b: 3,c: 5,d: 6,e: 100);
  FunB(2,22,33);
}
```

### 操作符和流程控制语句
#### 1. 取整
**/**除法操作符, 两数相除得出的结果是double类型的,<br>
要取两数相除的整数部分, 需要用到取整操作符**~/**
```
var a = 3;
var b = 2;
print(a~/b); //输出的结果是1
print(a/b); //输出的结果是1.5
```

#### 2. 级联
当你要对一个单一的对象进行一系列的操作的时候, 可以使级联操作符**..**
```
class Person{
  String name;
  String country;
  void setCountry(String country) => this.country = country;

  String toString() => "Name: $name\nCountry: $country";
}

void main(){
  Person person = Person();
  person ..name = "MuFeng"
  ..setCountry("China");
  print(person);
}
```
#### 3. if语句
if语句的判断条件为bool值, 用法和大多语言一样
```
void main(){
  var i = 10;
  if(i < 0){
    print("小于");
  }else if(i == 0){
    print("等于0");
  }else{
    print("大于0");
  }
}
```
在checked模式下, 如果是非bool值会抛出异常<br>
而在production模式下, 非bool值会被翻译成false

#### 4. 循环
```
for(int i = 0; i<3; i++){
    print(i);
}
```
如果迭代的对象是容器, 那么可以使用forEach或者for-in
```
var c = [0,1,2];
c.forEach((x) => print("forEach: $x"));

for(var x in c){
    print("for-in: $x");
}
```
#### 5. Switch 和 Case
switch的参数可以是num, 或者String<br>

如果分句的内容为空, 想要fall-through(落空), 可以省略break, 如果分句的内容不为空, 那么必须加break, 否则抛出异常<br>

如果想要落空, case语句内容又不为空, 而又不是按顺序落空, 那么可以使用continue和标签
```
void main() {
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print('CLOSED');
      continue nowClosed; // Continues executing at the nowClosed label.
    case 'OPEN':
      print('OPEN');
      break;
    nowClosed: // Runs for both CLOSED and NOW_CLOSED.
    case 'NOW_CLOSED':
      print('NOW_CLOSED');
      break;
  }
}
```

#### 6. 异常处理

在Dart中可以抛出非空对象(不仅仅是Exception和Error)作为异常
```
throw ExpectException("值必须大于0!");
throw "值必须大于0!";
```

### 类和对象
Dart是一门使用类和单集成的面向对象语言, 所有的对象都是类的实例, 并且所有的类都是Object的子类
#### 1. 定义
类的定义用**class**关键字<br>
如果为显示定义构造函数, 会默认一个无参构造函数<br>
创建对象时 **new** 关键字不是必须的
```
class Point{
    num x;
    num y;
    num z;
}

void main(){
    var point = Point();
    print(point.hashCode);// 未定义父类的时候, 默认继承自Object
}
```

#### 2. 构造函数
如果只是简单的参数传递, 可以在构造函数的参数前加this关键字, 或者参数后加: 再赋值
```
class Point{
    num x;
    num y;
    num z;
    
    Point(this.x, this.y, z){
        //第一个值传递给this.x, 第二个值传递给this.y
        this.z = z;
    }
    
    ///命名构造函数, 格式为Class.name(var param)
    Point.fromeList(var list):
        x = list[0], y = list[1], z = list[2]{
            //使用冒号初始化比那里
        }
        
    String toString()=>'x: $x y: $y z: $z';
}

void main(){
    var p1 = new Point(1,2,3);
    var p2 = Point.fromeList([4,5,6]);
    print(p1);
    print(p2);
}
```
如果要创建一个不可变的对象, 可以定义编译时常量对象<br>
需要在构造函数前加const
```
class Point{
    final num x;
    final num y;
    const Point(this.x, this.y);
    //创建一个常量对象不能用new, 要用const
    static final Point point = const Point(1,1);
}
```
#### 3. Getters 和 Setters
get和set是用来读写一个对象属性的方法<br>
每个字段都对应一个隐式的Getter和Setter, 但是调用的时候是obj.x, 而不是obj.x()

可以使用get和set关键字扩展功能<br>
如果字段为final或者const的话, 那么它只有一个getter方法
```
class Rectangle {
    num left;
    num top;
    num width;
    num height;
    
    Rectangle(this.left, this.top, this.width, this.height);
    
    //right 和 bottom 两个属性的计算方法
    num get right => left + width;
    set right(num value) => left = value - width;
    num get bottom => top + height;
    set bottom(num value) => top = value - height;
}

void main(){
    var rect = Rectangle(3,4,20,15);
    assert(rect.left == 3);
    rect.right = 12;
    assert(rect.left == -8);
}
```

#### 4. 抽象类
在Dart中类和接口是统一的, 类就是接口<br>
如果你想重写部分功能, 那么你可以继承一个类<br>
如果你想实现某些功能, 那么你也可以实现一个类

使用abstract关键字来定义抽象类, 并且抽象类不能被实例化<br>
抽象方法不需要关键字, 直接以分好结束即可

```
abstract class Shape{//定义了一个Shape类/接口
  num perimeter(); //这是一个抽象方法, 不需要abstract关键字, 是隐式接口的一部分
}

class Rectangle implements Shape{
  //Rectangle实现了Shape接口
  final num height, width;
  Rectangle(this.height, this.width);
  @override
  num perimeter() => 2*height + 2*width;
}

class Square extends Rectangle{
  Square(num size): super(size,size);
}

void main(){
  var s = Square(20);
  print(s.perimeter());
}
```
#### 5. 工厂构造函数
Factory单独拿出来讲, 因为这不仅仅是构造函数, 更是一种模式<br>
有时候为了返回一个之前已经创建的缓存对象, 原始的狗仔方法已经不能满足要求<br>
那么可以使用工厂模式来定义构造函数<br>
并且用关键字new来获取之前已经创建的缓存对象
```
class Logger{
  final String name;
  bool mute = false;

  //变量前加下划线表示私有属性
  static final Map<String, Logger> _cache = <String,Logger>{};
  factory Logger(String name){
    if(_cache.containsKey(name)){
      return _cache[name];
    }else{
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);
  void log(String msg){
    if(!mute){
      print(msg);
    }
  }
}

void main(){
  var logger = new Logger('UI');
  logger..log("Button clicker")
  ..log("EditText Edit");
}
```
### StringBuffer, List, Set, Map
#### 1. StringBuffer
StringBuffer可以特别高效的构建多个字符串
```
void main(){
  StringBuffer sb = StringBuffer();
  sb..write("Use a StringBuffer")
  ..writeAll(['name', 'sex', 'age'])
  ..write("My name is")
  ..write("MuFeng");
  print(sb.toString());
  sb.clear();
}
```
#### 2. List
列表, 也叫数组, 常见的添加、索引、删除等方法
```
//使用List的构造函数, 也可以添加int参数, 标识list固定长度
  var list = List();
  var list1 = List(10);

  //使用简单的List来赋值
  var list2 = ['a','b',1];

  //添加元素
  list.add(2);

  //添加多个元素
  list.addAll(list2);

  //获取List的长度
  print(list.length);

  //利用索引获取元素
  print(list[0]);

  //查找某个元素的索引号
  print(list.indexOf('b'));

  //利用索引号删除某个元素
  var index = list.indexOf(1);
  list.removeAt(index);
  print(list);

  //删除所有元素
  list.clear();
  print(list.length);
```
使用sort()对List的元素进行排序<br>
并且必须制定比较两个对象的函数, 函数的返回值中<br>
return < 0 表示小于, =0表示相同, >0表示大于<br>
```
var list3 = ['c','a','r','y'];
  list3.sort((a,b)=>a.compareTo(b));
  print(list3);
```
List以及其他的容器可以指定参数类型
```
var list = List<String>();
list.add("a");
list.add(5);//报错, 指定参数类型后, 类型必须统一
```
#### 3. Set
集合在Dart中无序的, 并且每个元素具有唯一性, 因为它是无序的, 因此不能像List那样用索引来访问元素
```
void main(){
  var set = Set();

  set.addAll(['name', 'sex', 'age']);
  print(set.length);

  //添加已有的元素无效
  set.add("name");
  print(set.length);

  //删除元素
  set.remove("sex");
  print(set);

  //检查Set中是否包含某个元素
  print(set.contains("name"));

  //检查在Set中是否包含多个元素
  print(set.containsAll(["name","age"]));
  set.addAll(['name', 'sex', 'age']);

  //获取两个集合的交集
  var set1 = Set.from(['name','MuFeng']);
  var set2 = set.intersection(set1);
  print("set2 = $set2");

}
```

#### 4. Map
映射, 也称之为字典, Map是一个无序的键值对容器
```
void main(){
  //Map的声明
  var map = {
    "name": "MuFeng",
    "age": 25,
    "la": ["Android", 'Java','Kotlin','Flutter']
  };
  var map1 = Map();

  //指定键值对的参数类型
  var map2 = Map<String, Object>();

  //Map的赋值, 中括号中是Key, 这里不是数组
  map["sex"] = "男";

  //Map中的键值对是唯一的
  //同Set不同, 第二次输入的Key如果存在, Value会覆盖之前的数据
  map["age"] = 30;
  print(map);

  //检索Map是否包含有某Key
  print(map.containsKey("age"));

  //删除某个键值对
  map.remove("sex");
  print(map);
}
```
可以使用getKeys和getValues获取所有Key或者所有Values的迭代器
```
 var keys = map.keys;
  print(keys);

  var values = map.values;
  print(values);

  //迭代器中有一个函数any, 用来检测迭代器中的数据
  //当其中一个元素运行函数时return true, 那么any的返回值就是true, 否则为false
  //与之相对的是函数every, 要所有函数运行return true, 那么every返回true
  print(values.any((v) => v == 'MuFeng'));
  print(values.every((v) => v == 'MuFeng'));

  //可以使用forEach来遍历数据, 但它是无序的
  map.forEach((k,v){
    print("$k and $v");
  });

  //检索是否包含某个key或value
  print(map.containsKey("name"));
  print(map.containsValue("MuFeng"));

  //V putIfAbsent(K key, Function V ifAbsent())函数, 通过key来查找Value
  //当某个Key不存在的时候, 会执行第二参数的Function来添加Value
  var map3 = {};
  map3.putIfAbsent("name", ()=>'MuFeng');
  print(map3);
```