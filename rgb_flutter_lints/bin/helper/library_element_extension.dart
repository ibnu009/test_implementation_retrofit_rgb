import 'package:analyzer/dart/element/element.dart';

extension LintLibraryElementgExt on LibraryElement {

  int get totalClasses {
    int classCount = 0;
    for (var type in library.topLevelElements) {
      if (!type.displayName.contains("_")) {
        classCount++;
      }
    }
    return classCount;
  }

}
