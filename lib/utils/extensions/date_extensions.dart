import 'package:demo_project/utils/logs/log_utils.dart';
import 'package:intl/intl.dart';

/// The single source-of-truth display format used across the entire app.
const String _kDisplayFormat = 'dd-MMM-yyyy';

/// Ordered list of formats we try when parsing a stored date string.
/// DB may contain yyyy-MM-dd (legacy) or dd-MMM-yyyy (new). Both are handled.
const List<String> _kParseFormats = [
  'dd-MMM-yyyy', // new display  format  e.g. 07-Apr-2026
  'yyyy-MM-dd', // legacy stored format  e.g. 2026-04-07
];

// ---------------------------------------------------------------------------
// Extension on String
// ---------------------------------------------------------------------------

extension DateStringExtension on String {
  /// Converts any stored date string to the display format `dd-MMM-yyyy`.
  /// Returns the original string unchanged if parsing fails.
  String toDisplayDate() {
    final parsed = _tryParse(this);
    return parsed != null ? DateFormat(_kDisplayFormat).format(parsed) : this;
  }

  /// Parses this string to a [DateTime] trying all known stored formats.
  /// Returns `null` if the string cannot be parsed.
  DateTime? toDateTime() => _tryParse(this);
}

// ---------------------------------------------------------------------------
// Extension on DateTime
// ---------------------------------------------------------------------------

extension DateTimeExtension on DateTime {
  /// Formats this [DateTime] to the app's display format `dd-MMM-yyyy`.
  String toDisplayDate() => DateFormat(_kDisplayFormat).format(this);
}

// ---------------------------------------------------------------------------
// Private helper
// ---------------------------------------------------------------------------

DateTime? _tryParse(String raw) {
  for (final fmt in _kParseFormats) {
    try {
      return DateFormat(fmt).parseStrict(raw);
    } catch (e) {
      LogUtils.error('Date parsing failed for format: $fmt');
    }
  }
  return null;
}
