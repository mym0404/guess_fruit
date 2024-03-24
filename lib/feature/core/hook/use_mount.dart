import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../export.dart';

void useMount(VC fn) {
  useEffect(() {
    fn();
    return;
  }, []);
}

void useUnmount(VC fn) {
  useEffect(() {
    return () {
      fn();
    };
  }, []);
}
