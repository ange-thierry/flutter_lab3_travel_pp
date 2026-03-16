// ── Category List ─────────────────────────────────────────────────────────────
const List<String> kTravelCategories = [
  'All',
  'Beach',
  'Mountains',
  'City',
  'Adventure',
  'Culture',
];

// ── Tax Rate ──────────────────────────────────────────────────────────────────
const double kTaxRate = 0.12;

// ── Booking Constraints ───────────────────────────────────────────────────────
const int kMinTravelers = 1;
const int kMaxTravelers = 10;
const int kMaxGroupSize = 12;

// ── Hard-Coded Booking Options ────────────────────────────────────────────────
const List<String> kAvailableDates = [
  'June 15, 2025',
  'July 3, 2025',
  'July 20, 2025',
  'August 5, 2025',
];

const List<String> kRoomTypes = [
  'Standard Room',
  'Deluxe Double',
  'Suite',
  'Private Villa',
];

// ── Asset Paths ───────────────────────────────────────────────────────────────
class AssetImages {
  AssetImages._();

  static const String santorini  = 'assets/images/santorini.jpg';
  static const String bali       = 'assets/images/bali.jpg';
  static const String maldives   = 'assets/images/maldives.jpg';
  static const String patagonia  = 'assets/images/patagonia.jpg';
  static const String kyoto      = 'assets/images/kyoto.jpg';
  static const String swissAlps  = 'assets/images/swiss_alps.jpg';
}

// ── UI Dimensions ─────────────────────────────────────────────────────────────
const double kCardHeight        = 220.0;
const double kHeroHeight        = 360.0;
const double kBottomBarHeight   = 60.0;
const double kSearchBarHeight   = 48.0;
const double kCategoryChipHeight = 50.0;
const double kThumbnailSize     = 80.0;