import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:packit/app/network/builder/dio_builder.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/app/service/fcm_service.dart';
import 'package:packit/data/datasources/remote/auth_api.dart';
import 'package:packit/data/datasources/remote/category_api.dart';
import 'package:packit/data/datasources/remote/cluster_api.dart';
import 'package:packit/data/datasources/remote/destination_api.dart';
import 'package:packit/data/datasources/remote/image_api.dart';
import 'package:packit/data/datasources/remote/item_api.dart';
import 'package:packit/data/datasources/remote/member_api.dart';
import 'package:packit/data/datasources/remote/travel_api.dart';
import 'package:packit/data/repositories_impl/auth_repository_impl.dart';
import 'package:packit/data/repositories_impl/category_repository_impl.dart';
import 'package:packit/data/repositories_impl/cluster_repository_impl.dart';
import 'package:packit/data/repositories_impl/destination_repository_impl.dart';
import 'package:packit/data/repositories_impl/image_repository_impl.dart';
import 'package:packit/data/repositories_impl/item_repository_impl.dart';
import 'package:packit/data/repositories_impl/member_repository_impl.dart';
import 'package:packit/data/repositories_impl/travel_repository_impl.dart';
import 'package:packit/domain/repositories/auth_repository.dart';
import 'package:packit/domain/repositories/category_repository.dart';
import 'package:packit/domain/repositories/cluster_repository.dart';
import 'package:packit/domain/repositories/destination_repository.dart';
import 'package:packit/domain/repositories/image_repository.dart';
import 'package:packit/domain/repositories/item_repository.dart';
import 'package:packit/domain/repositories/member_repository.dart';
import 'package:packit/domain/repositories/travel_repository.dart';
import 'package:packit/domain/usecases/auth_use_cases.dart';
import 'package:packit/domain/usecases/category_use_cases.dart';
import 'package:packit/domain/usecases/cluster_use_cases.dart';
import 'package:packit/domain/usecases/destination_use_cases.dart';
import 'package:packit/domain/usecases/image_use_cases.dart';
import 'package:packit/domain/usecases/item_use_cases.dart';
import 'package:packit/domain/usecases/member_use_cases.dart';
import 'package:packit/domain/usecases/travel_use_cases.dart';

import 'app_const.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectNetworkProvider();
    injectRepository();
    injectUseCase();
    injectService();
  }

  void injectNetworkProvider() {
    // Dio
    Get.lazyPut(() => (DioBuilder(options: BaseOptions(baseUrl: AppConst.baseUrl))), fenix: true);

    // API
    Get.lazyPut(() => AuthAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => CategoryAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => ClusterAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => DestinationAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => ImageAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => ItemAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => MemberAPI(Get.find<DioBuilder>()), fenix: true);
    Get.lazyPut(() => TravelAPI(Get.find<DioBuilder>()), fenix: true);
  }

  void injectRepository() {
    Get.put<AuthRepository>(AuthRepositoryImpl());
    Get.put<CategoryRepository>(CategoryRepositoryImpl());
    Get.put<ClusterRepository>(ClusterRepositoryImpl());
    Get.put<DestinationRepository>(DestinationRepositoryImpl());
    Get.put<ImageRepository>(ImageRepositoryImpl());
    Get.put<ItemRepository>(ItemRepositoryImpl());
    Get.put<MemberRepository>(MemberRepositoryImpl());
    Get.put<TravelRepository>(TravelRepositoryImpl());
  }

  void injectService() {
    Get.put(AuthService());
    Get.put(FCMService());
  }

  void injectUseCase() {
    Get.put(AuthUseCases());
    Get.put(CategoryUseCases());
    Get.put(ClusterUseCases());
    Get.put(DestinationUseCases());
    Get.put(ImageUseCases());
    Get.put(ItemUseCases());
    Get.put(MemberUseCases());
    Get.put(TravelUseCases());
  }
}
