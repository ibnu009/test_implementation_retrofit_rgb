import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'helper/library_element_extension.dart';
import 'helper/lint_helper.dart';
import 'helper/lint_type_constant.dart';
import 'helper/resolved_unit_extention.dart';
import 'helper/string_extention.dart';

main(List<String> args, SendPort sendPort) {
  // startPlugin(sendPort, _RgbCustomLint());
  createPlugin();
}

PluginBase createPlugin() => _RgbCustomLint();

class _RgbCustomLint extends PluginBase {
  @override
  Stream<Lint> getLints(
    ResolvedUnitResult unit,
  ) async* {
    final library = unit.libraryElement;
    final path = library.source.uri.path;
    final shortName = library.source.shortName;

    if (isFileOrFolderExcluded(path)) {
      final classes =
          library.topLevelElements.whereType<ClassElement>().toList();
      final classesTotal = library.totalClasses;

      final LintHelper lintHelper = LintHelper();

      print("Path is $path");
      if (classesTotal > 1) {
        for (final classInstance in classes) {
          final location = classInstance.nameLintLocation;
          yield Lint(
              code: 'only_one_class_per_file',
              message: 'Only one public class allowed per file',
              correction: 'Move one of the classes into another file!',
              location: unit.getLintLocationByClassesLine(location));
        }
      }

      print("HEHEHE");

      //Check for model
      if (path.isPathModel()) {
        for (final classInstance in classes) {
          final name = classInstance.name;

          final location = classInstance.nameLintLocation;
          if (name.isCorrectModelClassName()) {
            Lint? annotationLintError =
                unit.checkAnnotationInModelDirectory(location, path);
            if (annotationLintError != null) {
              yield annotationLintError;
            }
          } else {
            yield lintHelper.getIncorrectClassNameLint(
              unit: unit,
              location: location,
              path: path,
              className: name,
              lintType: LintTypeConstant.modelLint,
            );
          }
          if (!path.fileName.isCorrectFileModelName()) {
            yield lintHelper.getIncorrectFileNameLint(
                unit, location, path.fileName);
          }
        }
      }

      //Check for service
      if (path.isPathServices()) {
        for (final classInstance in classes) {
          final name = classInstance.name;
          final location = classInstance.nameLintLocation;
          if (name.isCorrectClassServiceName()) {
            Lint? annotationLintError =
                unit.checkAnnotationInServiceDirectory(location, path);
            if (annotationLintError != null) {
              yield annotationLintError;
            }
          } else {
            yield lintHelper.getIncorrectClassNameLint(
              unit: unit,
              location: location,
              path: path,
              className: name,
              lintType: LintTypeConstant.serviceLint,
            );
          }
          if (!path.fileName.isCorrectFileServiceName()) {
            yield lintHelper.getIncorrectFileNameLint(
                unit, location, path.fileName);
          }
        }
      }

      //Check for Enum
      if (path.isPathEnum()) {
        for (final classInstance in classes) {
          final name = classInstance.name;
          final location = classInstance.nameLintLocation;
          if (name.isCorrectClassServiceName()) {
            Lint? annotationLintError =
                unit.checkAnnotationInServiceDirectory(location, path);
            if (annotationLintError != null) {
              yield annotationLintError;
            }
          } else {
            yield lintHelper.getIncorrectClassNameLint(
              unit: unit,
              location: location,
              path: path,
              className: name,
              lintType: LintTypeConstant.enumLint,
            );
          }
          if (!path.fileName.isCorrectFileServiceName()) {
            yield lintHelper.getIncorrectFileNameLint(
                unit, location, path.fileName);
          }
        }
      }
    }
  }

  bool isFileOrFolderExcluded(String path) {
    return !(path.contains(".g.dart") ||
        path.contains("/base/network/") ||
        path.contains("/app/modules/") ||
        path.contains("/app/module/") ||
        path.contains("/app/component/") ||
        path.contains("/app/routes/") ||
        path.contains("/common/themes/") ||
        path.contains("/utils/") ||
        path.contains("/util/") ||
        path.contains("/utility/"));
  }

  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    throw UnimplementedError();
  }
}

class RgbCustomLintCode extends DartLintRule {
  RgbCustomLintCode() : super(code: _code);

  static const _code = LintCode(
    name: 'my_custom_lint_code',
    problemMessage: 'This is the description of our custom lint',
  );



  @override
  void run(CustomLintResolver resolver, ErrorReporter reporter, CustomLintContext context) {

  }

}
