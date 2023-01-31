import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

extension ResolvedUnitResultExt on ResolvedUnitResult {
  LintLocation getLintLocationByClassesLine(LintLocation? location) {
    return lintLocationFromLines(
        startLine: location?.startLine ?? 1,
        endLine: location?.endLine ?? 1,
        endColumn: location?.endColumn ?? 1,
        startColumn: location?.startColumn ?? 1);
  }

  Lint? checkAnnotationInModelDirectory(
      LintLocation? location, String filePath) {
    bool isLintSatisfied = false;
    bool isLintWrong = false;
    int classLength = 'class '.length;

    Lint annotationLint = Lint(
        code: 'json_serializable_annotation_is_required',
        message: 'JsonSerializable() is required to declare model for retrofit pattern',
        correction: 'You have to add JsonSerializable() on top of your model class',
        location: getLintLocationByClassesLine(location),
        getAnalysisErrorFixes: (Lint lint) async* {
          final changeBuilder = ChangeBuilder(session: session);
          await changeBuilder.addDartFileEdit(filePath, (fileEditBuilder) {
            fileEditBuilder.addReplacement(SourceRange(location!.offset - classLength, 0),
                (builder) => builder.writeln('@JsonSerializable()'));
          });
          yield AnalysisErrorFixes(lint.asAnalysisError(), fixes: [
            PrioritizedSourceChange(0,
                changeBuilder.sourceChange..message = 'Add @JsonSerializable()')
          ]);
        });

    Lint wrongAnnotationLint = Lint(
        code: 'wrong_annotation_called',
        message: '@RestApi() is only permitted to be called in services class',
        correction: 'You have to remove @RestApi() from your class',
        location: getLintLocationByClassesLine(location));

    if (unit.declarations.isEmpty) {
      return annotationLint;
    }

    for (var declaration in unit.declarations) {
      if (declaration is ClassDeclaration) {
        final classAnnotations = declaration.metadata;
        for (var annotation in classAnnotations) {
          final evaluatedAnnotation = annotation.name.name;
          if (evaluatedAnnotation.contains('JsonSerializable')) {
            isLintSatisfied = true;
          } else if (evaluatedAnnotation.contains('RestApi')){
            isLintWrong = true;
          }
          else {
            isLintSatisfied = false;
          }
        }
      }
    }

    if (isLintWrong){
      return wrongAnnotationLint;
    }

    if (!isLintSatisfied) {
      return annotationLint;
    }

    return null;
  }

  Lint? checkAnnotationInServiceDirectory(
      LintLocation? location, String filePath) {
    bool isLintSatisfied = false;
    int classLength = 'abstract class '.length;

    Lint annotationLint = Lint(
        code: 'rest_api_annotation_is_required',
        message: 'RestApi Annotation is required to declare service for retrofit pattern',
        correction: 'You have to add @RestApi() on top of your service class',
        location: getLintLocationByClassesLine(location),
        getAnalysisErrorFixes: (Lint lint) async* {
          final changeBuilder = ChangeBuilder(session: session);
          await changeBuilder.addDartFileEdit(filePath, (fileEditBuilder) {
            try {
              fileEditBuilder.addReplacement(SourceRange(location!.offset - classLength, 0),
                      (builder) => builder.writeln('@RestApi()'));
            } catch (e) {

            }

          });
          yield AnalysisErrorFixes(lint.asAnalysisError(), fixes: [
            PrioritizedSourceChange(0,
                changeBuilder.sourceChange..message = 'Add @RestApi()')
          ]);
        });

    if (unit.declarations.isEmpty) {
      return annotationLint;
    }

    for (var declaration in unit.declarations) {
      if (declaration is ClassDeclaration) {
        final classAnnotations = declaration.metadata;
        for (var annotation in classAnnotations) {
          final evaluatedAnnotation = annotation.name.name;
          if (evaluatedAnnotation.contains('RestApi')) {
            isLintSatisfied = true;
          } else {
            isLintSatisfied = false;
          }
        }
      }
    }

    if (!isLintSatisfied) {
      return annotationLint;
    }

    return null;
  }
}
