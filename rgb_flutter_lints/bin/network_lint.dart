import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

Stream<void> networkLinter(ResolvedUnitResult unit) async* {
  print("CALLED NETWORK");
  yield Lint(
      code: 'only_one_class_per_file',
      message: 'Only one public class allowed per file',
      correction: 'Move one of the classes into another file!',
      location: unit.lintLocationFromLines(
        startLine: 1,
        endLine: 1,
      ));
}
