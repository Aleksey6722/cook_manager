// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/add/bloc/image_box_bloc/image_box_bloc.dart' as _i1038;
import '../features/add/bloc/nutrition_label_bloc/nutrition_label_bloc.dart'
    as _i622;
import '../features/add/bloc/recipe_steps_bloc/recipe_steps_bloc.dart' as _i941;
import '../features/add/bloc/structure_widget_bloc/structure_bloc.dart'
    as _i103;

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
    gh.singleton<_i622.NutritionLabelBloc>(() => _i622.NutritionLabelBloc());
    gh.singleton<_i941.RecipeStepsBloc>(() => _i941.RecipeStepsBloc());
    gh.singleton<_i103.StructureBloc>(() => _i103.StructureBloc());
    gh.singleton<_i1038.ImageBoxBloc>(() => _i1038.ImageBoxBloc());
    return this;
  }
}
