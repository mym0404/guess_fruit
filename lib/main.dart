import 'export.dart';
import 'service/bootstrap/boot_strap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootStrap();
}
