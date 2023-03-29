import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/domain/usecases/category_meal_case.dart';
import '../../../config.dart';

class HomeController extends GetxController with StateMixin {
  final CategoryMealUseCase categoryMealCase;
  RxList<MealsEntity> categoryList = <MealsEntity>[].obs;

  HomeController({required this.categoryMealCase});

  final count = 0.obs;
  @override
  void onInit() {
    featcData();
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

  void featcData() async {
    try {
      change(null, status: RxStatus.loading());
      final response = await categoryMealCase
          .featchCategoryMeal(ConfigEnvironments.CATEGORIES_LIST_URL);
      response.fold((value) {
        categoryList.value = value.meals;
        for (var item in categoryList) {
          print('name ${item.strCategory}');
        }
        change(value, status: RxStatus.success());
      }, (err) {
        change(err, status: RxStatus.error(err.runtimeType.toString()));
        print('err :$err');
      });
    } catch (err) {
      change(err, status: RxStatus.error(err.runtimeType.toString()));
    }
  }
}
