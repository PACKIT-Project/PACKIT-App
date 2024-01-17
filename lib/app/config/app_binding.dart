import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:packit/app/network/builder/dio_builder.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/data/datasources/remote/auth_api.dart';
import 'package:packit/data/repositories_impl/auth_repository_impl.dart';
import 'package:packit/domain/repositories/auth_repository.dart';
import 'package:packit/domain/usecases/auth_use_cases.dart';

import 'app_const.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectNetworkProvider();
    injectRepository();
    injectService();
    injectUseCase();
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

    // API
    Get.lazyPut(() => AuthAPI(Get.find<DioBuilder>(tag: DioBuilderType.withoutToken.name)), fenix: true);
  }

  void injectRepository() {
    Get.put<AuthRepository>(AuthRepositoryImpl());
  }

  void injectService() {
    Get.put(AuthService());
  }

  void injectUseCase() {
    Get.put(AuthUseCases());
  }
}
