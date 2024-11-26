import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:injectable/injectable.dart';

part 'image_box_event.dart';

part 'image_box_state.dart';

@singleton
class ImageBoxBloc extends Bloc<ImageBoxEvent, ImageBoxState> {
  ImageBoxBloc() : super(CurrentImageBoxState(imageFile: null)) {
    on<SetPicture>(_mapSetPictureToState);
    on<RemovePicture>(_mapRemovePictureToState);
    on<SetEditingPicture>(_mapEditPictureToState);
  }

  void _mapSetPictureToState(SetPicture event, emmit){
    emmit(CurrentImageBoxState(imageFile: event.imageFile));
  }

  void _mapRemovePictureToState(RemovePicture event, emmit){
    emmit(CurrentImageBoxState(imageFile: null));
  }
  
  void _mapEditPictureToState(SetEditingPicture event, emmit) {
    final image = CroppedFile(event.path);
    emmit(CurrentImageBoxState(imageFile: image));
  }
}
