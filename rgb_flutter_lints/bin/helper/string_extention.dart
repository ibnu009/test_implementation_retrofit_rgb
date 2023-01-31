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
    return !(contains("Service") ||
        contains("Response") ||
        contains("Request") ||
        contains("Constant") ||
        contains("Enum"));
  }

  bool isCorrectFileModelName() {
    return (contains("_model"));
  }

  bool isCorrectClassServiceName() {
    return (contains("Service"));
  }

  bool isCorrectFileServiceName() {
    return (contains("_services") || contains("_service"));
  }

  bool isCorrectFileResponseName() {
    return (contains("_response"));
  }

  bool isCorrectClassResponseName() {
    return (contains("Response"));
  }

  bool isCorrectFileRequestName() {
    return (contains("_request"));
  }

  bool isCorrectClassRequestName() {
    return (contains("Request"));
  }

  bool isCorrectClassEnumName() {
    return (contains("Enum"));
  }

  bool isCorrectFileEnumName() {
    return (contains("_enum"));
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

    if (contains('Enum')) {
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
        'File name is incorrect. '
        '\n please move to file to the correct directory or rename file with correct name';

    if (contains('_service')) {
      message =
          'Service file name should only be created in services directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (contains('_model')) {
      message =
      'Model file name should only be created in services directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (contains('_enum')) {
      message = 'Enum file name should only be created in enum directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (contains('_response')) {
      message =
          'Response file name should only be created in response directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    if (contains('_request')) {
      message =
          'Request file name should only be created in request directory. '
          '\n please move to file to the correct directory or rename file with correct name';
    }

    return message;
  }
}
