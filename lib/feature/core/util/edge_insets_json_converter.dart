import '../../../export.dart';

class EdgeInsetsJsonConverter extends JsonConverter<EdgeInsets, String> {
  const EdgeInsetsJsonConverter();
  @override
  EdgeInsets fromJson(String json) {
    var l = double.tryParse(json.split(',')[0]) ?? 0;
    var t = double.tryParse(json.split(',')[1]) ?? 0;
    var r = double.tryParse(json.split(',')[2]) ?? 0;
    var b = double.tryParse(json.split(',')[3]) ?? 0;
    return EdgeInsets.fromLTRB(l, t, r, b);
  }

  @override
  String toJson(EdgeInsets object) {
    return '${object.left},${object.top},${object.right},${object.bottom}';
  }
}
