import 'package:get_it/get_it.dart';
import 'package:meal_app_with_clean_arch/domain/reporitory/category_meal_repositroy.dart';
import 'package:meal_app_with_clean_arch/domain/usecases/category_meal_case.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/daos/netwok/api_provider.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/repository_impl/category_meal_repo_impl.dart';
import 'package:meal_app_with_clean_arch/presentation/details/controllers/details.controller.dart';
import 'package:meal_app_with_clean_arch/presentation/home/controllers/home.controller.dart';
import 'package:meal_app_with_clean_arch/presentation/landing/controllers/landing.controller.dart';
import 'package:meal_app_with_clean_arch/presentation/search/controllers/search.controller.dart';

final serviceLocator = GetIt.instance;

Future<void> initDepInject() async {
  serviceLocator.registerLazySingleton(
      () => HomeController(categoryMealCase: serviceLocator()));

  serviceLocator.registerFactory(
      () => DetailsController(categoryMealUseCase: serviceLocator()));

  serviceLocator.registerFactory(
      () => SearchController(categoryMealCase: serviceLocator()));

  serviceLocator.registerLazySingleton(() => LandingController());

  //User case (domain layer)

  serviceLocator.registerFactory(
      () => CategoryMealUseCase(categoryMealRepository: serviceLocator()));

  serviceLocator.registerFactory<CategoryMealRepository>(
      () => CategoryMealRepostioryImpl(apiProvider: serviceLocator()));

  serviceLocator.registerFactory<ApiProvider>(() => ApiProvider());
}
