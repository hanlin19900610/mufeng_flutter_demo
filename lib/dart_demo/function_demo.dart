/// 学习函数 操作符  流程控制语句

///函数定义
//String sayHello(String name){
//  return 'Hello, $name!';
//}
//
//
//main(){
//  assert(sayHello is Function,"类型判断错误");
//  print(sayHello("MuFeng"));
//}

///函数别名
//普通的函数定义
//class Sort{
//  Function compare;
//
//  Sort(int f(Object a, Object b)){
//    compare = f;
//  }
//}
//
//int sort1(Object a, Object b) => 0;
//
//main(){
//  Sort sort = Sort(sort1);
//  assert(sort.compare is Function);
//}

//给函数起个别名
//typedef int Compare(Object a, Object b);
//
//class Sort{
//  Compare compare;
//
//  Sort(this.compare);
//}
//
//int sort(Object a, Object b) => 0;
//
//main(){
//  Sort s = Sort(sort);
//  assert(s.compare is Function);
//  assert(s.compare is Compare);
//}

///可选参数
//FunA(a,{b,c=3,d=4,e}){
//  print("$a $b $c $d $e");
//}
//
//FunB(a, [b,c=3,d=4,e]){
//  print("$a $b $c $d $e");
//}
//
//main(){
////  FunA(1,b: 3,c: 5,d: 6,e: 100);
////  FunB(2,22,33);
//}

///操作符
///取整操作符

//main(){
//  var a = 3;
//  var b = 2;
//  print(a~/b); //输出的结果是1
//  print(a/b); //输出的结果是1.5
//}

///级联操作符
//class Person{
//  String name;
//  String country;
//  void setCountry(String country) => this.country = country;
//
//  String toString() => "Name: $name\nCountry: $country";
//}
//
//void main(){
//  Person person = Person();
//  person ..name = "MuFeng"
//  ..setCountry("China");
//  print(person);
//}

///流程控制语句
///if语句
//void main(){
//  var i = 10;
//  if(i < 0){
//    print("小于");
//  }else if(i == 0){
//    print("等于0");
//  }else{
//    print("大于0");
//  }
//}
///循环
//void main(){
//  var c = [0,1,2];
//  c.forEach((x) => print("forEach: $x"));
//
//  for(var x in c){
//    print("for-in: $x");
//  }
//}
///Switch And Case
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
