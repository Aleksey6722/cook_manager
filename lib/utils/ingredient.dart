class Ingredient {
  Ingredient({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  set setName(String? val) => name=val;
  set setValue(String? val) => value=val;
}
