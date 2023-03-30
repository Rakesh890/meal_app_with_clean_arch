import 'package:dartz/dartz.dart';
import 'package:meal_app_with_clean_arch/config.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/domain/reporitory/category_meal_repositroy.dart';

import '../../core/error/app_exceptions.dart';

class CategoryMealUseCase {
  final CategoryMealRepository categoryMealRepository;

  CategoryMealUseCase({required this.categoryMealRepository});

  Future<Either<CategoryMealEntity, AppException>> featchData(
      String url) async {
    try {
      final response = await categoryMealRepository.getCategoryMeal(url);
      return response;
    } catch (err) {
      rethrow;
    }
  }

}
