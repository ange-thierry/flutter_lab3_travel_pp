import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import '../widgets/destination_card.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;

  const DetailScreen({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Hero Image ──────────────────────────────────────
                Stack(
                  children: [
                    SizedBox(
                      height: 360,
                      width: double.infinity,
                      child: Image.network(
                        destination.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF1A3C5E),
                          child: const Icon(Icons.image, color: Colors.white54, size: 80),
                        ),
                      ),
                    ),
                    // Gradient overlay
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Back button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
                        ),
                      ),
                    ),
                    // Share button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.share_outlined, color: Colors.white, size: 22),
                      ),
                    ),
                    // Category + rating badge
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00C9A7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              destination.category,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.45),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Color(0xFFFFD700), size: 15),
                                const SizedBox(width: 4),
                                Text(
                                  '${destination.rating}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ── Content Card ────────────────────────────────────
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6F9FC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  transform: Matrix4.translationValues(0, -24, 0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + country
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination.title,
                                    style: const TextStyle(
                                      color: Color(0xFF1A3C5E),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: Color(0xFF00C9A7), size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        destination.country,
                                        style: const TextStyle(
                                          color: Color(0xFF00C9A7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Rating row
                        Row(
                          children: [
                            StarRating(rating: destination.rating, size: 18),
                            const SizedBox(width: 10),
                            Text(
                              '${destination.rating} (${destination.reviews} reviews)',
                              style:
                                  TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Info grid
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: InfoRow(
                                          icon: Icons.calendar_today_outlined,
                                          label: 'Duration',
                                          value: '7 Days')),
                                  Expanded(
                                      child: InfoRow(
                                          icon: Icons.people_outline,
                                          label: 'Group',
                                          value: 'Max 12')),
                                ],
                              ),
                              const Divider(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                      child: InfoRow(
                                          icon: Icons.cloud_outlined,
                                          label: 'Weather',
                                          value: '24°C')),
                                  Expanded(
                                      child: InfoRow(
                                          icon: Icons.language,
                                          label: 'Language',
                                          value: 'Local')),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Description
                        const Text(
                          'About Destination',
                          style: TextStyle(
                            color: Color(0xFF1A3C5E),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          destination.longDescription,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Highlights
                        const Text(
                          'Highlights',
                          style: TextStyle(
                            color: Color(0xFF1A3C5E),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          children: destination.highlights
                              .map((h) => HighlightChip(label: h))
                              .toList(),
                        ),

                        const SizedBox(height: 24),

                        // Price section
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1A3C5E), Color(0xFF0D5C8C)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Starting from',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7), fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${destination.price.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'per person',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7), fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(Icons.local_offer,
                                      color: Color(0xFF00C9A7), size: 22),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF00C9A7).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xFF00C9A7), width: 1),
                                    ),
                                    child: const Text(
                                      'Best Price',
                                      style: TextStyle(
                                          color: Color(0xFF00C9A7),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Floating Book Now Button ──────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E7EF), width: 2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.favorite_border,
                        color: Color(0xFF1A3C5E), size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingScreen(destination: destination),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00C9A7), Color(0xFF009E86)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00C9A7).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bookmark_add_outlined,
                                color: Colors.white, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}