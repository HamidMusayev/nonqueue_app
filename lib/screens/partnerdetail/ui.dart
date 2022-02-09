import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nonqueue_app/screens/cart/ui.dart';
import 'package:nonqueue_app/screens/inapp/drawer/account_info.dart';
import 'package:nonqueue_app/screens/partnerdetail/top.dart';
import 'package:nonqueue_app/widgets/partner_tile.dart';

import '../../utils/constants.dart';

class PartnerDetailScreen extends StatefulWidget {
  const PartnerDetailScreen({Key? key}) : super(key: key);

  @override
  _PartnerDetailScreenState createState() => _PartnerDetailScreenState();
}

class _PartnerDetailScreenState extends State<PartnerDetailScreen> {
  int _activeIndex = 0;
  int _activeSubIndex = 0;
  int _count = 0;
  int _cartcount = 0;

  final List<String> _extras = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Starbucks',
          style: TextStyle(
            color: ColorPalette.lightBlack,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60,
        child: FloatingActionButton.extended(
          backgroundColor: ColorPalette.qlessApp,
          icon: const Icon(Icons.shopping_cart_rounded),
          label: Text(
            _cartcount.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
              fullscreenDialog: true,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TopPanel(),
            Padding(
              padding: Paddings.p16.copyWith(top: 0, bottom: 0, right: 0),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  itemCount: 7,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  separatorBuilder: (context, index) => Spaces.horizontal6,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => setState(() => _activeIndex = index),
                    child: _activeIndex == index
                        ? const Chip(
                            backgroundColor: ColorPalette.qlessApp,
                            //padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                            labelStyle: TextStyle(color: Colors.white),
                            label: Text('Drinks'),
                          )
                        : const Chip(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorPalette.stroke),
                            //padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                            labelStyle:
                                TextStyle(color: ColorPalette.greyInputText),
                            label: Text('Foods'),
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: Paddings.p16.copyWith(top: 0, bottom: 0, right: 0),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  separatorBuilder: (context, index) => Spaces.horizontal6,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => setState(() => _activeSubIndex = index),
                    child: _activeSubIndex == index
                        ? const Chip(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorPalette.qlessApp),
                            labelStyle: TextStyle(color: ColorPalette.qlessApp),
                            label: Text('All drinks'),
                          )
                        : const Chip(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: ColorPalette.stroke),
                            labelStyle:
                                TextStyle(color: ColorPalette.greyInputText),
                            label: Text('Cold'),
                          ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: Paddings.p8,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: Radiuses.r10,
                      side: BorderSide(color: ColorPalette.stroke),
                    ),
                    child: ExpansionTile(
                      childrenPadding: Paddings.p12,
                      title: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Caffe Americano'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '5.00 AZN',
                              style: TextStyle(
                                color: ColorPalette.qlessApp,
                              ),
                            ),
                            Text(
                              '8.00 AZN',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: ColorPalette.greyInputText,
                              ),
                            ),
                          ],
                        ),
                        leading: const CircleAvatar(
                          radius: 24,
                          //fit: BoxFit.fill,
                          backgroundImage: NetworkImage(
                              'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2019_33/2203981/171026-better-coffee-boost-se-329p.jpg'),
                        ),
                      ),
                      children: [
                        const Text(
                          '1 Big Tasty (beef), 1 medium Fries, 1 medium Coca-Cola drink.',
                          style: TextStyle(
                            color: ColorPalette.greyInputText,
                            fontSize: 12,
                          ),
                        ),
                        Spaces.vertical10,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButtonFormField<String>(
                              hint: const Text('Size..'),
                              onChanged: (value) {},
                              items: const [
                                DropdownMenuItem<String>(
                                  child: Text('Small'),
                                  value: 'small',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Big'),
                                  value: 'big',
                                ),
                              ],
                            ),
                            Spaces.vertical10,
                            DropdownButtonFormField<String>(
                              hint: const Text('Drink..'),
                              onChanged: (value) {},
                              items: const [
                                DropdownMenuItem<String>(
                                  child: Text('Fanta'),
                                  value: 'fanta',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('Cola'),
                                  value: 'cola',
                                ),
                              ],
                            ),
                            Spaces.vertical10,
                            DropdownButtonFormField<String>(
                              hint: const Text('Extras..'),
                              onChanged: (value) {},
                              items: [
                                DropdownMenuItem<String>(
                                  child: const Text('Onion'),
                                  value: 'Onion',
                                  onTap: () =>
                                      setState(() => _extras.add('Onion')),
                                ),
                                DropdownMenuItem<String>(
                                  child: const Text('Ketchup'),
                                  value: 'Ketchup',
                                  onTap: () =>
                                      setState(() => _extras.add('Ketchup')),
                                ),
                              ],
                            ),
                            Spaces.vertical10,
                            Wrap(
                                spacing: 6,
                                children: _extras
                                    .map(
                                      (e) => Chip(
                                        label: Text(e),
                                        deleteIcon:
                                            const Icon(Icons.cancel_rounded),
                                        onDeleted: () =>
                                            setState(() => _extras.remove(e)),
                                      ),
                                    )
                                    .toList()),
                            Spaces.vertical20,
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: Radiuses.r10,
                                    border:
                                        Border.all(color: ColorPalette.stroke),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if (_count > 0) {
                                              setState(() {
                                                _count--;
                                              });
                                            }
                                          },
                                          icon:
                                              const Icon(Icons.remove_rounded)),
                                      Text(
                                        _count.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _count++;
                                            });
                                          },
                                          icon: const Icon(Icons.add_rounded)),
                                    ],
                                  ),
                                ),
                                Spaces.horizontal6,
                                Spaces.horizontal6,
                                Flexible(
                                  flex: 3,
                                  child: TextButton(
                                    child: const Text('Add to card'),
                                    onPressed: () =>
                                        setState(() => _cartcount++),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
