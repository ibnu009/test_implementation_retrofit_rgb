extension LintStringExt on String {
  String get fileName {
    return split("/").last;
  }

  bool isPathModel() {
    return (contains("/network/models/") || contains("/network/model/"));
  }

  bool isPathServices() {
    return (contains("/network/services/") || contains("/network/service/"));
  }

  bool isPathEnum() {
    return (contains("/network/enums/") || contains("/network/enum/"));
  }

  bool isCorrectModelClassName() {
    RegExp regExp = RegExp(r"(Services|Response|Request|Constant|Enum)");
    return !regExp.hasMatch(this);
    // return !(contains("Service") ||
    //     contains("Response") ||
    //     contains("Request") ||
    //     contains("Constant") ||
    //     contains("Enum"));
  }

  bool isCorrectFileModelName() {
    RegExp regExp = RegExp(r"_model.dart$");
    return regExp.hasMatch(this);
  }

  bool isCorrectClassServiceName() {
    RegExp regExp = RegExp(r".*Services.*");
    return regExp.hasMatch(this);
  }

  bool isCorrectFileServiceName() {
    RegExp regExp = RegExp(r"_services.dart$");
    return regExp.hasMatch(this);
  }

  bool isCorrectClassResponseName() {
    RegExp regExp = RegExp(r".*Response.*");
    return regExp.hasMatch(this);
  }

  bool isCorrectFileResponseName() {
    RegExp regExp = RegExp(r"_response.dart$");
    return regExp.hasMatch(this);
  }

  bool isCorrectClassRequestName() {
    RegExp regExp = RegExp(r".*Request.*");
    return regExp.hasMatch(this);
  }

  bool isCorrectFileRequestName() {
    RegExp regExp = RegExp(r"_request.dart$");
    return regExp.hasMatch(this);
  }

  bool isCorrectClassEnumName() {
    RegExp regExp = RegExp(r".*Enum.*");
    return regExp.hasMatch(this);
  }

  bool isCorrectFileEnumName() {
    RegExp regExp = RegExp(r"_enum.dart$");
    return regExp.hasMatch(this);
  }

  String renameClass({required String type}) {
    List<String> words = split(RegExp(r'(?=[A-Z])'));
    words.removeWhere((w) {
      if (w == "Service") return true;
      if (w == "Enum") return true;
      if (w == "Constant") return true;
      if (w == "Response") return true;
      if (w == "Request") return true;
      return false;
    });
    String rawClassName = words.join();
    String newClassName = rawClassName + type;
    return newClassName;
  }

  String get rawClassName {
    List<String> words = split(RegExp(r'(?=[A-Z])'));
    words.removeWhere((w) {
      if (w == "Service") return true;
      if (w == "Enum") return true;
      if (w == "Constant") return true;
      if (w == "Response") return true;
      if (w == "Request") return true;
      return false;
    });
    String rawClassName = words.join();
    return rawClassName;
  }

  String getWrongModelClassNameMessage() {
    String message = '';

    if (contains('Service')) {
      message =
          'service class name should only be declared in services directory. '
          '\n please change class name with correct name';
    }

    if (contains('Enum')){
      message = 'Enum class name should only be declared in enum directory. '
          '\n please change class name with correct name';
    }

    if (contains('Response')) {
      message =
          'Response class name should only be declared in response directory.'
          '\n please change class name with correct name';
    }

    if (contains('Request')) {
      message =
          'Request class name should only be declared in request directory.'
          '\n please change class name with correct name';
    }

    return message;
  }

  String getWrongModelFileNameMessage() {
    String message =
        'File name is incorrect.'
        '\n please move file to the correct directory or rename file with correct name';

    if (this.isCorrectFileServiceName()) {
      message =
          'Service file name should only be created in services directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (this.isCorrectFileModelName()) {
      message =
      'Model file name should only be created in model directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (this.isCorrectFileEnumName()) {
      message = 'Enum file name should only be created in enum directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (this.isCorrectFileResponseName()) {
      message =
          'Response file name should only be created in response directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (this.isCorrectFileRequestName()) {
      message =
          'Request file name should only be created in request directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    return message;
  }
}
