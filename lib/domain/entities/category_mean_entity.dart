import 'package:equatable/equatable.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/models/category_meal_model.dart';

class CategoryMealEntity extends Equatable {
  final List<MealsEntity> meals;

  CategoryMealEntity({
    required this.meals,
  });

  @override
  List<Object?> get props => [meals];
}

class MealsEntity extends Equatable {
  final String? strCategory;

  MealsEntity({required this.strCategory});

  @override
  List<Object?> get props => [strCategory];
}