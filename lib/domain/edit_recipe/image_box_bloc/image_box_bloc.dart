import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'image_box_event.dart';

part 'image_box_state.dart';

@singleton
class ImageBoxBloc extends Bloc<ImageBoxEvent, ImageBoxState> {
  ImageBoxBloc() : super(CurrentImageBoxState(imageBytes: null)) {
    on<SetPicture>(_setPicture);
    on<RemovePicture>(_removePicture);
    on<SetEditingPicture>(_editPicture);
  }

  void _setPicture(SetPicture event, emmit){
    emmit(CurrentImageBoxState(imageBytes: event.imageBytes));
  }

  void _removePicture(RemovePicture event, emmit){
    emmit(CurrentImageBoxState(imageBytes: null));
  }
  
  void _editPicture(SetEditingPicture event, emmit) {
    emmit(CurrentImageBoxState(imageBytes: event.imageBytes));
  }
}
