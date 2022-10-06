import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DioConfig {
  static Future<Response> dioConfig(dioUrl) async {
    Dio dio =
        Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/top-headlines?'));
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());

    dio.interceptors.add(dioCacheManager.interceptor);
    Options dioOptions =
        buildCacheOptions(const Duration(days: 30), forceRefresh: true);
    return await dio.get(dioUrl, options: dioOptions);
  }
}
