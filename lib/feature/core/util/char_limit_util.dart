import '../../../export.dart';
import 'local_storage.dart';

const _key = 'a11y';
const delayMs = 1000 * 60 * 5;
Future<bool> trySubmitAndCheckLimit() async {
  var raw = di<LocalStorage>().getString(_key);
  List<int> list = [];
  if (raw == null) {
    list = [];
  } else {
    list = (jsonDecode(raw) as List<dynamic>).cast<int>();
  }

  if (list.length > 10 &&
      list[0] > DateTime.now().millisecondsSinceEpoch - delayMs) {
    return false;
  }

  list.add(DateTime.now().millisecondsSinceEpoch);
  list.slice(max(0, list.length - 10), list.length);

  di<LocalStorage>().setString(_key, jsonEncode(list));
  return true;
}
