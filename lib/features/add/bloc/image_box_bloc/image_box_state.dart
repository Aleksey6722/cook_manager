part of 'image_box_bloc.dart';

sealed class ImageBoxState extends Equatable {
  late final Uint8List? imageBytes;
  @override
  List<Object?> get props => [imageBytes];

}

class CurrentImageBoxState extends ImageBoxState {
  final Uint8List? imageBytes;

  CurrentImageBoxState({required this.imageBytes});

}
