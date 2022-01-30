import 'package:flutter/material.dart';
import 'package:nonqueue_app/utils/constants.dart';

class OrderTile extends StatelessWidget {
  final Map<String, String> order;
  const OrderTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Spaces.vertical10,
        const Text(
          'Thu 11/11',
          style: TextStyle(
            color: ColorPalette.lightBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        ListTile(
          onTap: (){ },
          contentPadding: Paddings.p8,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order['name'] ?? '',
                softWrap: true,
                style: const TextStyle(
                  color: ColorPalette.lightBlack,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                ),
              ),
              Text(
                order['desc'] ?? '',
                softWrap: true,
                style: const TextStyle(
                  color: ColorPalette.greyInputText,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spaces.vertical10,
              Row(
                children: [
                  Text(
                    order['value'] ?? '',
                    style: const TextStyle(
                      color: ColorPalette.lightBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    order['time'] ?? '',
                    style: const TextStyle(
                      color: ColorPalette.lightBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: ColorPalette.greyInputText,
            backgroundImage: NetworkImage(order['image'] ?? ''),
            radius: 30,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                '5.0',
                style: TextStyle(
                  color: ColorPalette.lightBlack,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
            ],
          ),
        )
      ],
    );
  }
}
