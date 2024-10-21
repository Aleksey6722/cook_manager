part of 'image_box_bloc.dart';

sealed class ImageBoxEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetPicture extends ImageBoxEvent {
  final  CroppedFile? imageFile;

  SetPicture({required this.imageFile});
}

class RemovePicture extends ImageBoxEvent {}
