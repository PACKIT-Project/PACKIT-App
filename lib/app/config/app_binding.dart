import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:packit/app/network/builder/dio_builder.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/data/datasources/remote/auth_api.dart';
import 'package:packit/data/datasources/remote/destination_api.dart';
import 'package:packit/data/datasources/remote/image_api.dart';
import 'package:packit/data/datasources/remote/member_api.dart';
import 'package:packit/data/datasources/remote/travel_api.dart';
import 'package:packit/data/repositories_impl/auth_repository_impl.dart';
import 'package:packit/data/repositories_impl/destination_repository_impl.dart';
import 'package:packit/data/repositories_impl/image_repository_impl.dart';
import 'package:packit/data/repositories_impl/member_repository_impl.dart';
import 'package:packit/data/repositories_impl/travel_repository_impl.dart';
import 'package:packit/domain/repositories/auth_repository.dart';
import 'package:packit/domain/repositories/destination_repository.dart';
import 'package:packit/domain/repositories/image_repository.dart';
import 'package:packit/domain/repositories/member_repository.dart';
import 'package:packit/domain/repositories/travel_repository.dart';
import 'package:packit/domain/usecases/auth_use_cases.dart';
import 'package:packit/domain/usecases/destination_use_cases.dart';
import 'package:packit/domain/usecases/image_use_cases.dart';
import 'package:packit/domain/usecases/member_use_cases.dart';
import 'package:packit/domain/usecases/travel_use_cases.dart';

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
    Get.lazyPut(() => DestinationAPI(Get.find<DioBuilder>(tag: DioBuilderType.withToken.name)), fenix: true);
    Get.lazyPut(() => ImageAPI(Get.find<DioBuilder>(tag: DioBuilderType.withToken.name)), fenix: true);
    Get.lazyPut(() => MemberAPI(Get.find<DioBuilder>(tag: DioBuilderType.withToken.name)), fenix: true);
    Get.lazyPut(() => TravelAPI(Get.find<DioBuilder>(tag: DioBuilderType.withToken.name)), fenix: true);
  }

  void injectRepository() {
    Get.put<AuthRepository>(AuthRepositoryImpl());
    Get.put<DestinationRepository>(DestinationRepositoryImpl());
    Get.put<ImageRepository>(ImageRepositoryImpl());
    Get.put<MemberRepository>(MemberRepositoryImpl());
    Get.put<TravelRepository>(TravelRepositoryImpl());
  }

  void injectService() {
    Get.put(AuthService());
  }

  void injectUseCase() {
    Get.put(AuthUseCases());
    Get.put(DestinationUseCases());
    Get.put(ImageUseCases());
    Get.put(MemberUseCases());
    Get.put(TravelUseCases());
  }
}
