import '../../../export.dart';

extension BorderRadiusExtension on num {
  BorderRadius get radius => BorderRadius.circular(toDouble());
}

extension BorderR2Extension on (Color, num) {
  Border get border => Border.all(color: $1, width: $2.toDouble());
}
