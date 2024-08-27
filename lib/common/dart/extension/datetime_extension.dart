

import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy년 MM월 dd일').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get relativeDays {
    final diffDays = difference(DateTime.now().onlyDate).inDays;
    final isNegative = diffDays.isNegative; // false면 지나간 날짜

    final checkCondition = (diffDays, isNegative);
    return switch (checkCondition) {
      (0, _) => _titleToday,
      (1, _) => _tillTomorrow,
      (_, true) => _dayPassed, 
      _ => _dayLeft
      
    };
  }

  DateTime get onlyDate{
    return DateTime(year, month, day);
  }

  String get _dayLeft => 'dayLeft'
  .tr(namedArgs: {'daysCount': difference(DateTime.now().onlyDate).inDays.toString()});

  String get _dayPassed => 'daysPassed'
  .tr(namedArgs: {'daysCount': difference(DateTime.now().onlyDate).inDays.abs().toString()});

  String get _titleToday => 'titleToday'.tr();

  String get _tillTomorrow => 'tillTomorrow'.tr();

}
