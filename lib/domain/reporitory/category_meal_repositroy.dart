import 'package:dartz/dartz.dart';

import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';

import '../../core/error/app_exceptions.dart';

abstract class CategoryMealRepository {
  Future<Either<CategoryMealEntity, AppException>> getCategoryMeal(String url);
}
