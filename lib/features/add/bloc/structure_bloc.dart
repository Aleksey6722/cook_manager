import 'package:cook_manager/utils/ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'structure_event.dart';
part 'structure_state.dart';

@singleton
class StructureBloc extends Bloc<StructureEvent, StructureState> {
  StructureBloc() : super(StructureInitState()) {
   on<AddTileEvent>((event, emmit){});
  }
}