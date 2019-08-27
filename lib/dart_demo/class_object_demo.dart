import 'dart:core';
///学习类和对象
///
/// 1. 定义
//class Point{
//  num x;
//  num y;
//  num z;
//}
//
//void main(){
//  var point = Point();
//  print(point.hashCode);// 未定义父类的时候, 默认继承自Object
//}

///2. 构造函数
//class Point{
//  num x;
//  num y;
//  num z;
//
//  Point(this.x, this.y, z){
//    //第一个值传递给this.x, 第二个值传递给this.y
//    this.z = z;
//  }
//
//  ///命名构造函数, 格式为Class.name(var param)
//  Point.fromeList(var list):
//        x = list[0], y = list[1], z = list[2]{
//    //使用冒号初始化比那里
//  }
//
//  String toString()=>'x: $x y: $y z: $z';
//}
//
//void main(){
//  var p1 = new Point(1,2,3);
//  var p2 = Point.fromeList([4,5,6]);
//  print(p1);
//  print(p2);
//}

///Getters And Setters
//class Rectangle {
//  num left;
//  num top;
//  num width;
//  num height;
//
//  Rectangle(this.left, this.top, this.width, this.height);
//
//  //right 和 bottom 两个属性的计算方法
//  num get right => left + width;
//  set right(num value) => left = value - width;
//  num get bottom => top + height;
//  set bottom(num value) => top = value - height;
//}
//
//void main(){
//  var rect = Rectangle(3,4,20,15);
//  assert(rect.left == 3);
//  rect.right = 12;
//  assert(rect.left == -8);
//}

///抽象类
/*
在Dart中类和接口是统一的, 类就是接口 如果你想重写部分功能, 那么你可以继承一个类 如果你想实现某些功能, 那么你也可以实现一个类
使用abstract关键字来定义抽象类, 并且抽象类不能被实例化 抽象方法不需要关键字, 直接以分好结束即可
 */
//abstract class Shape{//定义了一个Shape类/接口
//  num perimeter(); //这是一个抽象方法, 不需要abstract关键字, 是隐式接口的一部分
//}
//
//class Rectangle implements Shape{
//  //Rectangle实现了Shape接口
//  final num height, width;
//  Rectangle(this.height, this.width);
//  @override
//  num perimeter() => 2*height + 2*width;
//}
//
//class Square extends Rectangle{
//  Square(num size): super(size,size);
//}
//
//void main(){
//  var s = Square(20);
//  print(s.perimeter());
//}

///工厂构造函数
//class Logger{
//  final String name;
//  bool mute = false;
//
//  //变量前加下划线表示私有属性
//  static final Map<String, Logger> _cache = <String,Logger>{};
//  factory Logger(String name){
//    if(_cache.containsKey(name)){
//      return _cache[name];
//    }else{
//      final logger = new Logger._internal(name);
//      _cache[name] = logger;
//      return logger;
//    }
//  }
//
//  Logger._internal(this.name);
//  void log(String msg){
//    if(!mute){
//      print(msg);
//    }
//  }
//}
//
//void main(){
//  var logger = new Logger('UI');
//  logger..log("Button clicker")
//  ..log("EditText Edit");
//}

///StringBuffer
//void main(){
//  StringBuffer sb = StringBuffer();
//  sb..write("Use a StringBuffer")
//  ..writeAll(['name', 'sex', 'age'])
//  ..write("My name is")
//  ..write("MuFeng");
//  print(sb.toString());
//  sb.clear();
//}

///List
//void main(){
//  //使用List的构造函数, 也可以添加int参数, 标识list固定长度
//  var list = List();
//  var list1 = List(10);
//
//  //使用简单的List来赋值
//  var list2 = ['a','b',1];
//
//  //添加元素
//  list.add(2);
//
//  //添加多个元素
//  list.addAll(list2);
//
//  //获取List的长度
//  print(list.length);
//
//  //利用索引获取元素
//  print(list[0]);
//
//  //查找某个元素的索引号
//  print(list.indexOf('b'));
//
//  //利用索引号删除某个元素
//  var index = list.indexOf(1);
//  list.removeAt(index);
//  print(list);
//
//  //删除所有元素
//  list.clear();
//  print(list.length);
//
//  //使用sort()对List的元素进行排序
//  //并且必须制定比较两个对象的函数, 函数的返回值中
//  //return < 0 表示小于, =0表示相同, >0表示大于
//
//  var list3 = ['c','a','r','y'];
//  list3.sort((a,b)=>a.compareTo(b));
//  print(list3);
//
//  //List
//
//}

///Set
//void main(){
//  var set = Set();
//
//  set.addAll(['name', 'sex', 'age']);
//  print(set.length);
//
//  //添加已有的元素无效
//  set.add("name");
//  print(set.length);
//
//  //删除元素
//  set.remove("sex");
//  print(set);
//
//  //检查Set中是否包含某个元素
//  print(set.contains("name"));
//
//  //检查在Set中是否包含多个元素
//  print(set.containsAll(["name","age"]));
//  set.addAll(['name', 'sex', 'age']);
//
//  //获取两个集合的交集
//  var set1 = Set.from(['name','MuFeng']);
//  var set2 = set.intersection(set1);
//  print("set2 = $set2");
//
//}

///Map
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
}