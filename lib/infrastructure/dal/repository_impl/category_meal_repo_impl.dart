import 'dart:convert';
import 'dart:io';

import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meal_app_with_clean_arch/domain/reporitory/category_meal_repositroy.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/daos/netwok/api_provider.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/models/category_meal_model.dart';

import '../../../core/error/app_exceptions.dart';

class CategoryMealRepostioryImpl extends CategoryMealRepository {
  final ApiProvider apiProvider;

  CategoryMealRepostioryImpl({required this.apiProvider});

  @override
  Future<Either<CategoryMealModel, AppException>> getCategoryMeal(
      String url) async {
    try {
      final result = await apiProvider.executeGet(url);
      switch (result!.statusCode) {
        case 200:
          return left(CategoryMealModel.fromJson(json.decode(result.body)));
        case 404:
          throw right(BadRequestException());
        case 401:
          throw right(UnauthorisedException());
        case 500:
          throw right(InternalServerError());
        default:
          throw right(GeneralException());
      }
    } on SocketException catch (_) {
      throw FetchDataException();
    } catch (err) {
      throw GeneralException();
    }
  }
}
