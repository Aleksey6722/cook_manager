import 'package:cook_manager/utils/field_type_enum.dart';
import 'package:cook_manager/utils/ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'structure_event.dart';

part 'structure_state.dart';

@singleton
class StructureBloc extends Bloc<StructureEvent, StructureState> {
  StructureBloc() : super(StructureInitState()) {
    on<SetValueEvent>((event, emmit) {
      Ingredient ingredient = event.currentList[event.index];
      switch (event.fieldType) {
        case FieldType.name:
          ingredient.setName = event.value;
        case FieldType.value:
          ingredient.setValue = event.value;
      }
      final List<Ingredient> newList = event.currentList;
      newList.replaceRange(event.index, event.index + 1, [ingredient]);
      emmit(StructureCurrentState(listOfIngredients: newList));
    });
  }
}
