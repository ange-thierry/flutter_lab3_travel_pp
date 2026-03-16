class Destination {
  final String id;
  final String title;
  final String country;
  final String description;
  final String longDescription;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final String category;
  final List<String> highlights;
  bool isFavorite;

  Destination({
    required this.id,
    required this.title,
    required this.country,
    required this.description,
    required this.longDescription,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.category,
    required this.highlights,
    this.isFavorite = false,
  });
}