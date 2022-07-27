main() {
  int a = 3;
  int b = 200;

  int c = a + b;

  ///first call
  button(
      title: "Sign Up",
      color: "red",
      onPress: () {
        print("Sign Up");
      });

  ////second call
  button(
      title: "Sign In",
      color: "Green",
      onPress: () {
        print("Sign In");
      });
}

///Reusable
void button({String? title, String? color, Function? onPress}) {
  print(title);
  print(color);
  print(onPress);

  // return 34;

//{}
//[]
//()
}

add() {
  int a = 3;
  int b = 200;

  int c = a + b;
  pos(height: 2.4, age: 3, name: "John");
  return c;
}

pos({String? name, int? age, double? height}) {}
