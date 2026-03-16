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

final List<String> travelCategories = [
  'All',
  'Beach',
  'Mountains',
  'City',
  'Adventure',
  'Culture',
];

final List<Destination> destinations = [
  Destination(
    id: '1',
    title: 'Santorini',
    country: 'Greece',
    description: 'Iconic white buildings with blue domes',
    longDescription:
        'Santorini is a volcanic island in the Cyclades group of the Greek islands. It is famous for dramatic views, stunning sunsets from Oia town, the strange, bare landscape, the White Beach and unique culture. The island was once part of one of the largest volcanic eruptions in recorded history — the Minoan eruption — that took place approximately 3,600 years ago.',
    price: 1299,
    rating: 4.9,
    reviews: 2847,
    imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=800',
    category: 'City',
    highlights: ['Oia Sunset', 'Caldera Views', 'Black Sand Beach', 'Wine Tasting'],
    isFavorite: true,
  ),
  Destination(
    id: '2',
    title: 'Bali',
    country: 'Indonesia',
    description: 'Tropical paradise with rice terraces',
    longDescription:
        'Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Aside from a welcoming attitude, the Balinese are known for their artistry, which is reflected in the unique Hindu temples and artisan villages. Ubud is considered the cultural heart of Bali, with traditional arts, crafts, and dance performances.',
    price: 899,
    rating: 4.8,
    reviews: 3621,
    imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
    category: 'Culture',
    highlights: ['Tegalalang Rice Terraces', 'Ubud Monkey Forest', 'Tanah Lot Temple', 'Seminyak Beach'],
    isFavorite: false,
  ),
  Destination(
    id: '3',
    title: 'Maldives',
    country: 'Maldives',
    description: 'Crystal-clear waters and overwater villas',
    longDescription:
        'The Maldives is an archipelago nation in the Indian Ocean, situated in the Arabian Sea. It is known for its beaches, blue lagoons and extensive reefs. The country consists of more than a thousand coral islands grouped in a double chain of 26 atolls. The atolls are composed of live coral reefs and sand bars.',
    price: 2499,
    rating: 5.0,
    reviews: 1893,
    imageUrl: 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
    category: 'Beach',
    highlights: ['Overwater Bungalows', 'Snorkeling', 'Dolphin Watching', 'Diving'],
    isFavorite: true,
  ),
  Destination(
    id: '4',
    title: 'Patagonia',
    country: 'Argentina',
    description: 'Untamed wilderness at the end of the world',
    longDescription:
        'Patagonia is a sparsely populated region at the southern end of South America, spanning Argentina and Chile. It includes the southern Andes mountains, lakes, fjords, and glaciers in the west, and deserts, tablelands, and steppes to the east. Torres del Paine is one of the most awe-inspiring national parks in the world.',
    price: 1799,
    rating: 4.7,
    reviews: 1204,
    imageUrl: 'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
    category: 'Adventure',
    highlights: ['Torres del Paine', 'Perito Moreno Glacier', 'Trekking W Circuit', 'Wildlife Safari'],
    isFavorite: false,
  ),
  Destination(
    id: '5',
    title: 'Kyoto',
    country: 'Japan',
    description: 'Ancient temples and cherry blossoms',
    longDescription:
        'Kyoto, once the capital of Japan, is a city on the island of Honshu. It\'s famous for its numerous classical Buddhist temples, as well as gardens, imperial palaces, Shinto shrines and traditional wooden houses. It\'s also known for formal traditions such as kaiseki dining, consisting of multiple courses of seasonal dishes.',
    price: 1599,
    rating: 4.9,
    reviews: 4102,
    imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
    category: 'Culture',
    highlights: ['Fushimi Inari', 'Arashiyama Bamboo Grove', 'Gion District', 'Nijo Castle'],
    isFavorite: false,
  ),
  Destination(
    id: '6',
    title: 'Swiss Alps',
    country: 'Switzerland',
    description: 'Majestic peaks and alpine villages',
    longDescription:
        'The Swiss Alps are the portion of the Alps mountain range that lies within Switzerland. Because of their central position within the Alps, they are also known as the Central Alps. The Swiss Alps represent a region with a unique culture: a combination of mountain life, alpine sports, watches, chocolate and scenic beauty.',
    price: 2199,
    rating: 4.8,
    reviews: 2356,
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
    category: 'Mountains',
    highlights: ['Matterhorn', 'Jungfraujoch', 'Skiing', 'Scenic Train Rides'],
    isFavorite: true,
  ),
];