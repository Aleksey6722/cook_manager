class Ingredient {
  const Ingredient({
    // this.index = 0,
    this.name,
    this.value,
    this.isDownIconActive = false,
    this.isUpIconActive = false,
    this.isAddIconVisible = true,
    this.isDeleteIconVisible = false,
  });

  // final int index;
  final String? name;
  final String? value;
  final bool isDownIconActive ;
  final bool isUpIconActive;
  final bool isAddIconVisible;
  final bool isDeleteIconVisible;
}
