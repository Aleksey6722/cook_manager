import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/recipe_screen/bloc/recipe_bloc.dart';
import 'package:cook_manager/features/recipe_screen/view/nutrition_banner.dart';
import 'package:cook_manager/features/recipe_screen/view/subtitle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key, required this.recipeId});

  final int recipeId;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final RecipeBloc _recipeBloc = GetIt.instance<RecipeBloc>();

  @override
  void initState() {
    _recipeBloc.add(GetRecipeEvent(id: widget.recipeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: theme.colorScheme.surface,
        backgroundColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.surface,
        elevation: 2,
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        bloc: _recipeBloc,
        builder: (BuildContext context, RecipeState state) {
          switch (state) {
            case RecipeStateLoading():
              return const Center(child: CircularProgressIndicator());
            case RecipeStateLoaded():
              return _buildPage(state);
            case RecipeStateError():
              return const Text('Something went wrong. Try later ...');
          }
        },
      ),
    );
  }

  Widget _buildPage(RecipeStateLoaded state) {
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 2 * screenWidth / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(
                      File(state.recipe.imageUrl ?? 'url_to_placeholder')),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: (2 * screenWidth / 3) - 20,
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    state.recipe.title,
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Subtitle(state: state),
                  const SizedBox(height: 10),
                  NutritionBanner(state: state),
                  const SizedBox(height: 10),
                  Text(state.recipe.description ?? ''),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                    RichText(
                      text: TextSpan(
                        text: state.recipe.recipeUrl,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final url = state.recipe.recipeUrl ?? "";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                      ),
                    ),
                  ]
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
