part of 'image_box_bloc.dart';

sealed class ImageBoxEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetPicture extends ImageBoxEvent {
  final  Uint8List? imageBytes;

  SetPicture({required this.imageBytes});

  @override
    List<Object?> get props => [imageBytes];
}

class RemovePicture extends ImageBoxEvent {}

class SetEditingPicture extends ImageBoxEvent {
  final Uint8List imageBytes;

  SetEditingPicture({required this.imageBytes});

  @override
  List<Object?> get props => [imageBytes];
}
