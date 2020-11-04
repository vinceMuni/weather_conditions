import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  static final DateFormat _dayFormat = DateFormat.MEd(Get.locale.languageCode);

  String getDayFromDateTime() => _dayFormat.format(this);
}
