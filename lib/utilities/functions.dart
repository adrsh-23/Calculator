double calculate(String op, String input) {
  var values = input.split(op);
  double num1 = double.parse(values[0]);
  double num2 = double.parse(values[1]);
  double ans;
  if (op == "x")
    ans = num1 * num2;
  else if (op == "+")
    ans = num1 + num2;
  else if (op == "/")
    ans = num1 / num2;
  else if (op == "-")
    ans = num1 - num2;
  else
    ans = num1 % num2;
  return ans;
}

String convert(String input, String op) {
  double ans = calculate(op, input);
  input = ans.toString();
  return input;
}
