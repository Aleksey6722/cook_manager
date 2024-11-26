import 'dart:io';

import 'package:cook_manager/features/edit/bloc/image_box_bloc/image_box_bloc.dart';
import 'package:cook_manager/utils/image_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({super.key});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  final ImageBoxBloc _imageBoxBloc = GetIt.instance<ImageBoxBloc>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DottedBorder(
      dashPattern: const [12, 6],
      borderType: BorderType.RRect,
      borderPadding: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(2),
      radius: const Radius.circular(10),
      color: theme.colorScheme.primary,
      strokeWidth: 1,
      child: BlocBuilder<ImageBoxBloc, ImageBoxState>(
        bloc: _imageBoxBloc,
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: (MediaQuery.of(context).size.width - 40) / 1.5,
                width: MediaQuery.of(context).size.width - 40,
                decoration: state.imageFile != null
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: FileImage(File(state.imageFile!.path))))
                    : null,
                child: state.imageFile != null
                    ? _buildDeleteIcon()
                    : _buildButtonsColumn(),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<CroppedFile?> _cropImage(File imageFile) async =>
      await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1.5, ratioY: 1),
      );

  Widget _buildButtonsColumn() {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/meal_placeholder.png',
          height: 80,
          color: theme.hintColor,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              textStyle: theme.textTheme.bodyMedium,
              padding: const EdgeInsets.all(10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            onPressed: _pickImageFromCamera,
            child: const Text('Загрузить фото с камеры'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              textStyle: theme.textTheme.bodyMedium,
              padding: const EdgeInsets.all(10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            onPressed: _pickImageFromGallery,
            child: const Text('Загрузить фото с галереи'),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Future _pickImageFromGallery() async {
    final file = await ImageHelper.pickImage(
      isGallery: true,
      cropImage: _cropImage,
    );

    if (file == null) return;

    // final bytes = await file.readAsBytes();

    _imageBoxBloc.add(SetPicture(imageFile: file));
  }

  Future _pickImageFromCamera() async {
    final file = await ImageHelper.pickImage(
      isGallery: false,
      cropImage: _cropImage,
    );

    if (file == null) return;

    _imageBoxBloc.add(SetPicture(imageFile: file));
  }

  Widget _buildDeleteIcon() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: _deleteImage,
        icon: const Icon(
          Icons.delete_rounded,
          size: 40,
          color: Color(0xFFd14141),
        ),
      ),
    );
  }

  void _deleteImage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(),
          title: const Text('Удаление фотографии'),
          content: const Text('Вы уверене что хотите удалить фотографию?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _imageBoxBloc.add(RemovePicture());
                },
                child: const Text('Удалить')),
          ],
        );
      },
    );
  }
}
