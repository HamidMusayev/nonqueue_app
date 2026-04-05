import 'package:flutter/material.dart';

class DateRangeDialog extends StatelessWidget {
  final Function(DateTimeRange _range) onPick;
  const DateRangeDialog({Key? key, required this.onPick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final picked = await showDateRangePicker(
          context: context,
          locale: const Locale('az'),
          lastDate: DateTime.now(),
          firstDate: DateTime(2017, 07, 07),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.copyWith(
                      titleLarge: const TextStyle(fontSize: 16),
                    ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                  ),
                ),
              ),
              child: child ?? Container(),
            );
          },
        );
        if (picked != null) {
          onPick.call(picked);
        }
      },
      icon: const Icon(
        Icons.date_range_rounded,
        size: 28,
      ),
    );
  }
}
