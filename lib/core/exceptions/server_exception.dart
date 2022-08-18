
import 'app_exception.dart';

class ServerException extends AppException {
  ServerException({String? message})
      : super(
          message: message ?? 'Đã có lỗi xảy ra, vui lòng thử lại sau.',
        );
}
