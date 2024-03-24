if cd flutter; then git pull && cd .. ; else git clone https://github.com/flutter/flutter.git -b stable; fi
ls
flutter/bin/flutter doctor
flutter/bin/flutter clean
flutter/bin/flutter config --enable-web
flutter/bin/flutter pub get
#flutter/bin/dart run build_runner build -d