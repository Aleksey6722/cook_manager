import 'package:cook_manager/database/database_service.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

@singleton
class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeStateLoading()){
    on<GetRecipeEvent>(_mapRecipeEventToState);
  }

  void _mapRecipeEventToState(GetRecipeEvent event, emmit) async {
    final DatabaseService db = DatabaseService.instance;
    try {
      final Recipe recipe = await db.getRecipe(event.id);
      emmit(RecipeStateLoaded(recipe));
    } catch(e) {
      emmit(RecipeStateError());
    }
  }
}