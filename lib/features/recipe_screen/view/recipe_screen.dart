import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cook_manager/features/recipe_screen/bloc/recipe_bloc.dart';
import 'package:cook_manager/features/recipe_screen/view/view.dart';
import 'package:cook_manager/models/recipe.dart';
import 'package:cook_manager/router/router.dart';
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
  Recipe? recipe;

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
          IconButton(
              onPressed: () {
                context.router.push(EditRoute(recipe: recipe));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                //TODO: add to favourite functionality
              },
              icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        bloc: _recipeBloc,
        builder: (BuildContext context, RecipeState state) {
          switch (state) {
            case RecipeStateLoading():
              return const Center(child: CircularProgressIndicator());
            case RecipeStateLoaded():
              recipe = state.recipe;
              return _buildPage(state);
            case RecipeStateError():
              return const Text('Something went wrong. Try later ...');
          }
        },
      ),
    );
  }

  Widget _buildPage(RecipeStateLoaded state) {
    final String? imageUrl = state.recipe.imageUrl;
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 2 * screenWidth / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageUrl != null ? FileImage(
                        File(state.recipe.imageUrl!)) : const AssetImage('assets/images/image_placeholder.jpg') ,
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              SizedBox(
                height: (2 * screenWidth / 3) - 20,
              ),
              Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          '${state.recipe.title}(${state.recipe.id})',
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Subtitle(state: state),
                      const SizedBox(height: 10),
                      NutritionBanner(state: state),
                      const SizedBox(height: 10),
                      Text(state.recipe.description ?? ''),
                      const SizedBox(height: 10),
                      Row(children: [
                        InkWell(
                          onTap: () async {
                            final url = state.recipe.recipeUrl ?? "";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                          child: Text(
                            state.recipe.recipeUrl ?? "",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: theme.primaryColor),
                          ),
                        ),
                      ]),
                      TabWidget(
                        steps: state.recipe.listOfSteps,
                        ingredients: state.recipe.listOfIngredients,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
