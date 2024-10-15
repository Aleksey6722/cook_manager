import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'image_box_event.dart';

part 'image_box_state.dart';

@singleton
class ImageBoxBloc extends Bloc<ImageBoxEvent, ImageBoxState> {
  ImageBoxBloc() : super(CurrentImageBoxState(imageBytes: null)) {
    on<SetPicture>(_mapSetPictureToState);
    on<RemovePicture>(_mapRemovePictureToState);
  }

  void _mapSetPictureToState(SetPicture event, emmit){
    emmit(CurrentImageBoxState(imageBytes: event.imageBytes));
  }

  void _mapRemovePictureToState(RemovePicture event, emmit){
    emmit(CurrentImageBoxState(imageBytes: null));
  }
}
