class Person {
  String name;
  int age;
  bool sex;
  double score;

  Person({this.name,this.age,this.sex,this.score});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['name'] = this.name;
    data['age'] = this.age;
    data['sex'] = this.sex;
    data['score'] = this.score;
    return data;
  }
}