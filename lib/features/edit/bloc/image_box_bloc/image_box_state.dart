part of 'image_box_bloc.dart';

sealed class ImageBoxState extends Equatable {
  late final CroppedFile? imageFile;
  @override
  List<Object?> get props => [imageFile];

}

class CurrentImageBoxState extends ImageBoxState {

  @override
  final CroppedFile? imageFile;

  CurrentImageBoxState({required this.imageFile});

}
