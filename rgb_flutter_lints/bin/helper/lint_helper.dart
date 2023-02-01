import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';
import 'package:analyzer/source/source_range.dart';

import 'lint_type_constant.dart';
import 'resolved_unit_extention.dart';
import 'string_extention.dart';

class LintHelper {
  Lint getIncorrectClassNameLint(
      {required ResolvedUnitResult unit,
      LintLocation? location,
      required String path,
      required String className,
      required String lintType}) {

    String correctName = className.renameClass(type: lintType);

    if (lintType == LintTypeConstant.modelLint){
      correctName = className.rawClassName;
    }

    return Lint(
        code: 'incorrect_class_name',
        message: 'Incorrect class name',
        correction: className.getWrongModelClassNameMessage(),
        location: unit.getLintLocationByClassesLine(location),
        getAnalysisErrorFixes: (Lint lint) async* {
          final changeBuilder = ChangeBuilder(session: unit.session);
          await changeBuilder.addDartFileEdit(path, (fileEditBuilder) {
            fileEditBuilder.addReplacement(
                SourceRange(location!.offset, location.length),
                (builder) => builder.write(correctName));
          });
          yield AnalysisErrorFixes(lint.asAnalysisError(), fixes: [
            PrioritizedSourceChange(0,
                changeBuilder.sourceChange..message = 'Change to $correctName')
          ]);
        });
  }

  Lint getIncorrectFileNameLint(
      ResolvedUnitResult unit, LintLocation? location, String fileName) {
    return Lint(
        code: 'incorrect_file_name',
        severity: LintSeverity.error,
        message: 'Incorrect file name, it might seem that you have misplaced dart file to the incorrect directory. \n'
            'or there is might a typo in the file name.',
        correction: fileName.getWrongModelFileNameMessage(),
        location: unit.getLintLocationByClassesLine(location));
  }
}
