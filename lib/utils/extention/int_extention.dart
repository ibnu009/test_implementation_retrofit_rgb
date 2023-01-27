import 'package:intl/intl.dart';

extension IntegerConverter on int {
  String toThousandFormat() {
    var formatter = NumberFormat('#,###');
    return formatter.format(this).replaceAll(',', '.');
  }

}