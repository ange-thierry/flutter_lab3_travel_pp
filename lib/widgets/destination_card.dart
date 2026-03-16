import 'package:flutter/material.dart';
import '../data/travel_data.dart';

class DestinationCard extends StatefulWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard({
    Key? key,
    required this.destination,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Background image
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.network(
                  widget.destination.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFF1A3C5E),
                    child: const Icon(Icons.image, color: Colors.white54, size: 60),
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
                        Colors.transparent,
                        Colors.black.withOpacity(0.75),
                      ],
                      stops: const [0.4, 1.0],
                    ),
                  ),
                ),
              ),
              // Category badge
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C9A7).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.destination.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              // Favorite icon
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.destination.isFavorite = !widget.destination.isFavorite;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.destination.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.destination.isFavorite ? Colors.red : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              // Bottom info
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Color(0xFF00C9A7), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            widget.destination.country,
                            style: const TextStyle(
                              color: Color(0xFF00C9A7),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.destination.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFFFD700), size: 14),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.destination.rating} (${widget.destination.reviews})',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00C9A7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '\$${widget.destination.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Star Rating Widget ───────────────────────────────────────────────────────
class StarRating extends StatelessWidget {
  final double rating;
  final double size;

  const StarRating({Key? key, required this.rating, this.size = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        double filled = rating - index;
        IconData icon;
        if (filled >= 1) {
          icon = Icons.star;
        } else if (filled > 0) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: const Color(0xFFFFD700), size: size);
      }),
    );
  }
}

// ─── Highlight Chip Widget ────────────────────────────────────────────────────
class HighlightChip extends StatelessWidget {
  final String label;

  const HighlightChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00C9A7)),
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF00C9A7).withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline, color: Color(0xFF00C9A7), size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF1A3C5E),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Info Row Widget ──────────────────────────────────────────────────────────
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({Key? key, required this.icon, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF00C9A7).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF00C9A7), size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            Text(value,
                style: const TextStyle(
                    color: Color(0xFF1A3C5E), fontSize: 15, fontWeight: FontWeight.w700)),
          ],
        ),
      ],
    );
  }
}