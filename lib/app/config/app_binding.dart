import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:packit/app/network/builder/dio_builder.dart';
import 'package:packit/app/service/auth_service.dart';

import 'app_const.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectNetworkProvider();
    injectService();
  }

  void injectNetworkProvider() {
    // Dio
    Get.lazyPut(
      () => (DioBuilder(options: BaseOptions(baseUrl: AppConst.baseUrl), withToken: false)),
      tag: DioBuilderType.withoutToken.name,
      fenix: true,
    );
    Get.lazyPut(
      () => (DioBuilder(
        options: BaseOptions(baseUrl: AppConst.baseUrl),
        refreshDio: Get.find<DioBuilder>(tag: DioBuilderType.withoutToken.name),
      )),
      tag: DioBuilderType.withToken.name,
      fenix: true,
    );
  }

  void injectService() {
    Get.put(AuthService());
  }
}
