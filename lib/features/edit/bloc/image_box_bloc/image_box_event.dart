part of 'image_box_bloc.dart';

sealed class ImageBoxEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetPicture extends ImageBoxEvent {
  final  CroppedFile? imageFile;

  SetPicture({required this.imageFile});

  @override
    List<Object?> get props => [imageFile];
}

class RemovePicture extends ImageBoxEvent {}

class SetEditingPicture extends ImageBoxEvent {
  final String path;

  SetEditingPicture({required this.path});

  @override
  List<Object?> get props => [path];
}
