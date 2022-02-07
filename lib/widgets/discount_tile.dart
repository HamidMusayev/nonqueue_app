import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class DiscountTile extends StatelessWidget {
  final VoidCallback onTap;
  const DiscountTile({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: ColorPalette.stroke,
        ),
      ),
      child: InkWell(
        onTap: () => onTap.call(),
        child: ListTile(
          contentPadding: Paddings.p24.copyWith(left: 0, right: 0),
          horizontalTitleGap: 0,
          leading: const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://q-xx.bstatic.com/xdata/images/hotel/max500/189610604.jpg?k=2b5dcd2c03ec8a9a9605a158234a461883714349064e0478c99f72d11df48173&o='),
          ),
          title: const Text('Come before 12:00 oclock get 30% discount'),
        ),
      ),
    );
  }
}
