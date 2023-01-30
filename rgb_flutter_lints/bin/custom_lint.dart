import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'network_lint.dart';

main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, _RgbCustomLint());
}

class _RgbCustomLint extends PluginBase {
  @override
  Stream<Lint> getLints(
    ResolvedUnitResult unit,
  ) async* {
    final library = unit.libraryElement;
    final classes = library.topLevelElements.whereType<ClassElement>().toList();
    final path = library.source.fullName;

    if (isFileOrFolderExcluded(path)) {
      print("Path is $path");
      if (classes.length > 1) {
        for (final classInstance in classes) {
          final location = classInstance.nameLintLocation;
          yield Lint(
              code: 'only_one_class_per_file',
              message: 'Only one public class allowed per file',
              correction: 'Move one of the classes into another file!',
              location: unit.lintLocationFromLines(
                  startLine: location?.startLine ?? 1,
                  endLine: location?.endLine ?? 1,
                  endColumn: location?.endColumn ?? 1,
                  startColumn: location?.startColumn ?? 1));
        }
      }
    }
  }

  bool isFileOrFolderExcluded(String path) {
    return !(path.contains(".g.dart") ||
        path.contains("/base/network/") ||
        path.contains("/app/component/") ||
        path.contains("/app/routes/") ||
        path.contains("/common/themes/") ||
        path.contains("/utils/") ||
        path.contains("/util/") ||
        path.contains("/utility/"));
  }
}
