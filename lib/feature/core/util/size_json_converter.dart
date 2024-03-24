import '../../../export.dart';

class SizeJsonConverter extends JsonConverter<Size, String> {
  const SizeJsonConverter();
  @override
  Size fromJson(String json) {
    var w = double.tryParse(json.split(',')[0]) ?? 0;
    var h = double.tryParse(json.split(',')[1]) ?? 0;
    return Size(w, h);
  }

  @override
  String toJson(Size object) {
    return '${object.width},${object.height}';
  }
}
