// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/add/bloc/nutrition_label_widget/nutrition_label_bloc.dart'
    as _i496;
import '../features/add/bloc/recipe_steps_widget/recipe_steps_bloc.dart'
    as _i364;
import '../features/add/bloc/structure_widget/structure_bloc.dart' as _i442;

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
    gh.singleton<_i496.NutritionLabelBloc>(() => _i496.NutritionLabelBloc());
    gh.singleton<_i442.StructureBloc>(() => _i442.StructureBloc());
    gh.singleton<_i364.RecipeStepsBloc>(() => _i364.RecipeStepsBloc());
    return this;
  }
}
