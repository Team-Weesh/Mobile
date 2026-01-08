import 'package:weesh/domain/enum/login_type.dart';

extension LoginTypeUi on LoginType {
  String get label {
    switch (this) {
      case LoginType.student:
        return '학생';
      case LoginType.teacher:
        return '선생님';
    }
  }
}
