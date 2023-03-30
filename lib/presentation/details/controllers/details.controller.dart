import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/config.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/domain/usecases/category_meal_case.dart';

class DetailsController extends GetxController with StateMixin {
  //TODO: Implement DetailsController

  final count = 0.obs;
  var idMeal;
  var argument = Get.arguments;
  MealsEntity mealsEntity = MealsEntity();
  final CategoryMealUseCase categoryMealUseCase;

  DetailsController({required this.categoryMealUseCase});

  @override
  void onInit() {
    if (argument != null) {
      idMeal = argument['id'];

      getMealDetail(idMeal);
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getMealDetail(idMeal) async {
    change(null, status: RxStatus.loading());
    try {
      final data = await categoryMealUseCase
          .featchData(ConfigEnvironments.mealDetailsUrl + idMeal);
      data.fold((result) {
        if (result.meals.isNotEmpty) {
          mealsEntity = (result.meals.first);
        }
        change(null, status: RxStatus.success());
      }, (error) {
        change(null, status: RxStatus.error(error.toString()));
      });
    } catch (err) {
      change(null, status: RxStatus.error(err.runtimeType.toString()));
    }
  }
}
