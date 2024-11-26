// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/edit/bloc/image_box_bloc/image_box_bloc.dart' as _i91;
import '../features/edit/bloc/nutrition_label_bloc/nutrition_label_bloc.dart'
    as _i38;
import '../features/edit/bloc/recipe_steps_bloc/recipe_steps_bloc.dart'
    as _i672;
import '../features/edit/bloc/structure_widget_bloc/structure_bloc.dart'
    as _i565;
import '../features/main/bloc/category_bloc.dart' as _i61;
import '../features/recipe_screen/bloc/recipe_bloc.dart' as _i834;

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
    gh.singleton<_i61.CategoryBloc>(() => _i61.CategoryBloc());
    gh.singleton<_i834.RecipeBloc>(() => _i834.RecipeBloc());
    gh.singleton<_i91.ImageBoxBloc>(() => _i91.ImageBoxBloc());
    gh.singleton<_i38.NutritionLabelBloc>(() => _i38.NutritionLabelBloc());
    gh.singleton<_i672.RecipeStepsBloc>(() => _i672.RecipeStepsBloc());
    gh.singleton<_i565.StructureBloc>(() => _i565.StructureBloc());
    return this;
  }
}
