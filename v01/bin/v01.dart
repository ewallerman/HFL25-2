import 'dart:io';

void main(List<String> arguments) {
  int firstValue = getIntArg('Ange första talet: ');
  int secondValue = getIntArg('Ange andra talet: ');
  String operator = getOperator();
  calculateAndPrintResult(firstValue, secondValue, operator);
}

int getIntArg(String inputLabel) {
  while (true) {
    print(inputLabel);
    String? readArg = stdin.readLineSync();

    if (readArg != null) {
      int? val = int.tryParse(readArg);

      if (val != null) {
        return val;
      }
    }

    print('Incorrect argument, please try again!');
  }
}

String getOperator() {
  while (true) {
    print('Vilken operation vill du göra? (+ eller -): ');
    String? readArg = stdin.readLineSync();

    if (readArg != null && (readArg == "+" || readArg == "-")) {
      return readArg;
    }

    print('Incorrect argument, please try again!');
  }
}

void calculateAndPrintResult(int firstValue, int secondValue, String operator) {
  if (operator == "+") {
    printResult(firstValue + secondValue);
  } else if (operator =="-") {
    printResult(firstValue - secondValue);
  } else {
    print("Unsupported operator");
  }
}

void printResult(int result) {
  print("Resultatet är: $result");
}