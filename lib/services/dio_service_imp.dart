import 'package:dio/dio.dart';

import 'dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.pandascore.co/fifa/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer u6CWM_HVgtcXvejY5aXAZbmxt6eOVFeu3MRtm-ctCspN5ePw8tk',
        },
      ),
    );
  }
}
