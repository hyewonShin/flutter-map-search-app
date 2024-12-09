import 'package:dio/dio.dart';

abstract class BaseRemoteRepository {
  Dio get client => _client;

  static Dio _client = Dio(
    BaseOptions(
      baseUrl: 'https://openapi.naver.com/v1/search/local.json',
      headers: {
        'X-Naver-Client-Id': '',
        'X-Naver-Client-Secret': '',
      },
      // 설정안할 시 실패 응답오면 throw 던져서 에러남
      validateStatus: (status) => true,
    ),
  );
}
