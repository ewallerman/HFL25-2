import 'dart:io';

class Util {

  static String readString(String inputLabel) {
    while (true) {
      print(inputLabel);
      String? readArg = stdin.readLineSync();

      if (readArg != null && readArg.trim().length != 0) {
        return readArg.trim();
      }

      print("Incorrect argument, please try again!");
    }
  }

  static String? readOptionalString(String inputLabel) {
    print(inputLabel);
    String? readArg = stdin.readLineSync();

    if (readArg != null && readArg.trim().isNotEmpty) {
      return readArg.trim();
    } else {
      return null;
    }
  }

  static String readSpecificString(String inputLabel, List<String> possibleChoices) {
    while (true) {
      print(inputLabel);
      String? readArg = stdin.readLineSync();

      if (readArg != null && readArg.trim().length != 0) {
        String arg = readArg.trim();

        if (possibleChoices.contains(arg)) {
          return arg;
        }
      }

      print("Incorrect argument, please try again!");
    }
  }

  static int readPositiveInt(String inputLabel) {
    return readPositiveIntWithMinValue(inputLabel, 0);
  }

  static int readPositiveIntWithMinValue(String inputLabel, int minValue) {
    while (true) {
      print(inputLabel);
      String? readArg = stdin.readLineSync();

      if (readArg != null) {
        int? val = int.tryParse(readArg);

        if (val != null && val >= minValue) {
          return val;
        }
      }

      print("Incorrect argument, please try again!");
    }
  }
}