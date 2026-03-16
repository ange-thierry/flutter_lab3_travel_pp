import 'package:flutter/material.dart';
import '../data/travel_data.dart';

class BookingScreen extends StatefulWidget {
  final Destination destination;

  const BookingScreen({Key? key, required this.destination}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _travelers = 2;
  String _selectedDate = 'June 15, 2025';
  String _selectedRoom = 'Deluxe Double';

  final List<String> _availableDates = [
    'June 15, 2025',
    'July 3, 2025',
    'July 20, 2025',
    'August 5, 2025',
  ];

  final List<String> _roomTypes = [
    'Standard Room',
    'Deluxe Double',
    'Suite',
    'Private Villa',
  ];

  double get _totalPrice => widget.destination.price * _travelers;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F8F5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle,
                    color: Color(0xFF00C9A7), size: 52),
              ),
              const SizedBox(height: 20),
              const Text(
                'Booking Confirmed!',
                style: TextStyle(
                  color: Color(0xFF1A3C5E),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your trip to ${widget.destination.title} is booked.\nGet ready for an amazing adventure!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00C9A7).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Booking #TRV${DateTime.now().millisecondsSinceEpoch % 100000}',
                  style: const TextStyle(
                    color: Color(0xFF00C9A7),
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFF00C9A7), Color(0xFF009E86)]),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Back to Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1A3C5E),
          fontWeight: FontWeight.w800,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F9FC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back, color: Color(0xFF1A3C5E)),
          ),
        ),
        title: const Text(
          'Book Your Trip',
          style: TextStyle(
            color: Color(0xFF1A3C5E),
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Booking Summary Card ────────────────────────────────
            _card(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        widget.destination.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF1A3C5E),
                          child: const Icon(Icons.image, color: Colors.white54),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.title,
                          style: const TextStyle(
                            color: Color(0xFF1A3C5E),
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Color(0xFF00C9A7), size: 13),
                            const SizedBox(width: 2),
                            Text(
                              widget.destination.country,
                              style: const TextStyle(
                                  color: Color(0xFF00C9A7),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Color(0xFFFFD700), size: 14),
                            const SizedBox(width: 3),
                            Text('${widget.destination.rating}',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Travel Date ─────────────────────────────────────────
            _sectionLabel('Select Travel Date'),
            _card(
              child: Column(
                children: _availableDates.map((date) {
                  final isSelected = date == _selectedDate;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDate = date),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF1A3C5E)
                            : const Color(0xFFF6F9FC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: isSelected ? const Color(0xFF00C9A7) : Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            date,
                            style: TextStyle(
                              color: isSelected ? Colors.white : const Color(0xFF1A3C5E),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          if (isSelected)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00C9A7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text('Selected',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700)),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // ── Travelers ───────────────────────────────────────────
            _sectionLabel('Number of Travelers'),
            _card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Travelers',
                          style: TextStyle(
                              color: Color(0xFF1A3C5E),
                              fontWeight: FontWeight.w700,
                              fontSize: 15)),
                      Text('Adults & children',
                          style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_travelers > 1)
                            setState(() => _travelers--);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F9FC),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFE0E7EF)),
                          ),
                          child: const Icon(Icons.remove,
                              color: Color(0xFF1A3C5E), size: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '$_travelers',
                          style: const TextStyle(
                            color: Color(0xFF1A3C5E),
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_travelers < 10)
                            setState(() => _travelers++);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A3C5E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Room Type ───────────────────────────────────────────
            _sectionLabel('Room Type'),
            _card(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedRoom,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF1A3C5E)),
                  style: const TextStyle(
                      color: Color(0xFF1A3C5E),
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  onChanged: (v) => setState(() => _selectedRoom = v!),
                  items: _roomTypes.map((room) {
                    return DropdownMenuItem(value: room, child: Text(room));
                  }).toList(),
                ),
              ),
            ),

            // ── Price Breakdown ─────────────────────────────────────
            _sectionLabel('Price Breakdown'),
            _card(
              child: Column(
                children: [
                  _priceRow('Base price (1 person)',
                      '\$${widget.destination.price.toStringAsFixed(0)}'),
                  _priceRow('× $_travelers travelers',
                      '\$${_totalPrice.toStringAsFixed(0)}'),
                  _priceRow('Taxes & fees',
                      '\$${(_totalPrice * 0.12).toStringAsFixed(0)}'),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: Color(0xFFE0E7EF)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(
                            color: Color(0xFF1A3C5E),
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          )),
                      Text(
                        '\$${(_totalPrice * 1.12).toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Color(0xFF00C9A7),
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
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

      // ── Confirm Button ────────────────────────────────────────────
      bottomNavigationBar: Container(
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
        child: GestureDetector(
          onTap: _showConfirmationDialog,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 17),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00C9A7), Color(0xFF009E86)],
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00C9A7).withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, color: Colors.white, size: 22),
                SizedBox(width: 10),
                Text(
                  'Confirm Booking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          Text(value,
              style: const TextStyle(
                  color: Color(0xFF1A3C5E),
                  fontWeight: FontWeight.w700,
                  fontSize: 14)),
        ],
      ),
    );
  }
}