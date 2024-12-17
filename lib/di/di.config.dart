// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_repository.dart' as _i717;
import '../database/database_service.dart' as _i711;
import '../domain/edit_recipe/image_box_bloc/image_box_bloc.dart' as _i537;
import '../domain/edit_recipe/nutrition_label_bloc/nutrition_label_bloc.dart'
    as _i678;
import '../domain/edit_recipe/recipe_steps_bloc/recipe_steps_bloc.dart' as _i20;
import '../domain/edit_recipe/structure_widget_bloc/structure_bloc.dart'
    as _i967;
import '../domain/favourite/favourite_list_cubit.dart' as _i162;
import '../domain/home_screen/category_bloc.dart' as _i726;
import '../domain/home_screen/recipes_list_cubit.dart' as _i120;
import '../domain/recipe_screen/recipe_cubit.dart' as _i1033;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i711.DatabaseService>(() => _i711.DatabaseService());
    gh.singleton<_i537.ImageBoxBloc>(() => _i537.ImageBoxBloc());
    gh.singleton<_i678.NutritionLabelBloc>(() => _i678.NutritionLabelBloc());
    gh.singleton<_i20.RecipeStepsBloc>(() => _i20.RecipeStepsBloc());
    gh.singleton<_i967.StructureBloc>(() => _i967.StructureBloc());
    gh.factory<_i717.DataRepository>(
        () => _i717.DataRepository(gh<_i711.DatabaseService>()));
    gh.singleton<_i162.FavouriteListCubit>(
        () => _i162.FavouriteListCubit(gh<_i717.DataRepository>()));
    gh.singleton<_i726.CategoryBloc>(
        () => _i726.CategoryBloc(gh<_i717.DataRepository>()));
    gh.singleton<_i120.RecipesListCubit>(
        () => _i120.RecipesListCubit(gh<_i717.DataRepository>()));
    gh.singleton<_i1033.RecipeCubit>(
        () => _i1033.RecipeCubit(gh<_i717.DataRepository>()));
    return this;
  }
}
