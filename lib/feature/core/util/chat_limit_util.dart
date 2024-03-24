import '../../../export.dart';
import 'local_storage.dart';

const _key = 'a11y21';
const delayMs = 1000 * 60 * 5;
Future<bool> trySubmitAndCheckLimit() async {
  var raw = di<LocalStorage>().getString(_key);
  List<int> list = [];
  if (raw == null) {
    list = [DateTime.now().millisecondsSinceEpoch];
  } else {
    list = (jsonDecode(raw) as List<dynamic>).cast<int>()
      ..add(DateTime.now().millisecondsSinceEpoch);
  }

  if (list.length > 10 &&
      list[0] > DateTime.now().millisecondsSinceEpoch - delayMs) {
    list = list.slice(max(0, list.length - 10), list.length);
    await di<LocalStorage>().setString(_key, jsonEncode(list));
    return false;
  } else {
    await di<LocalStorage>().setString(_key, jsonEncode(list));
    return true;
  }
}
