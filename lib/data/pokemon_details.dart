class PokemonDetails {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final String description;
  PokemonDetails({
    this.id,
    this.name,
    this.imageUrl,
    this.height,
    this.weight,
    this.description,
    this.types,
  });
}
