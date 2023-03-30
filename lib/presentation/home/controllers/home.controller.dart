import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/domain/usecases/category_meal_case.dart';
import '../../../config.dart';

class HomeController extends GetxController with StateMixin {
  final CategoryMealUseCase categoryMealCase;
  RxList<MealsEntity> categoryList = <MealsEntity>[].obs;
  RxList<MealsEntity> ingriedentsList = <MealsEntity>[].obs;
  RxList<MealsEntity> cityList = <MealsEntity>[].obs;
  RxString selectedCityValue = ''.obs;
  RxString slectedMealId = ''.obs;
  HomeController({required this.categoryMealCase});

  final count = 0.obs;
  @override
  void onInit() async {
    getCategoriesData();
    getCity('inidan');
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

  Future<void> getCategoriesData() async {
    try {
      change(null, status: RxStatus.loading());
      final response = await categoryMealCase
          .featchData(ConfigEnvironments.categorieListUrl);
      response.fold((value) {
        categoryList.value = value.meals;
        final category = categoryList.first.strCategory;
        getIngidentsData(category!);
      }, (err) {
        change(err, status: RxStatus.error(err.runtimeType.toString()));
      });
    } catch (err) {
      change(err, status: RxStatus.error(err.runtimeType.toString()));
    }
  }

  Future<void> getIngidentsData(String cat) async {
    try {
      final response = await categoryMealCase
          .featchData('${ConfigEnvironments.categrieWiseUrl}$cat');
      response.fold((value) {
        ingriedentsList.value = value.meals;
        change(value, status: RxStatus.success());
      }, (err) {
        change(null, status: RxStatus.error(err.runtimeType.toString()));
      });
    } catch (err) {
      change(err, status: RxStatus.error(err.runtimeType.toString()));
    }
  }

  Future<void> getCity(String city) async {
    try {
      change(null, status: RxStatus.loading());
      final response =
          await categoryMealCase.featchData(ConfigEnvironments.areaWiseMealUrl);
      response.fold((value) {
        cityList.value = value.meals;
        selectedCityValue.value = cityList.first.area!;
        change(value, status: RxStatus.success());
      }, (err) {
        change(null, status: RxStatus.error(err.runtimeType.toString()));
      });
    } catch (err) {
      change(err, status: RxStatus.error(err.runtimeType.toString()));
    }
  }

  selectCategories(MealsEntity catItems) {
    slectedMealId.value = catItems.idMeal.toString();
    getIngidentsData(catItems.strCategory.toString());
  }
}
