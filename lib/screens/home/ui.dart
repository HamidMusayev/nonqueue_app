import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nonqueue_app/models/user.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/widgets/hospital_card.dart';
import 'package:nonqueue_app/widgets/log_out_button.dart';
import 'package:nonqueue_app/widgets/payment_card.dart';
import 'package:nonqueue_app/widgets/timerange_picker.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTimeRange _pickedDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: [
              DateRangeDialog(
                onPick: (DateTimeRange pickedDate) {
                  setState(() => _pickedDateRange = pickedDate);
                },
              )
            ],
            leading: const LogOutButton(),
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Xoş gəlmisiniz!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '${DateFormat('dd MMMM yyyy', 'az').format(_pickedDateRange.start)} / ${DateFormat('dd MMMM yyyy', 'az').format(_pickedDateRange.end)}',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 10),
                  ),
                ],
              ),
              //background: Container(color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: Paddings.p24,
                  child: Text(
                    'Xəstəxanalar',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: 2,
                  itemBuilder: (context, itemIndex, pageViewIndex) =>
                      HospitalCard(hospital: widget.user),
                  options: CarouselOptions(
                    //height: 400,
                    //aspectRatio: 16 / 9,
                    //viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1300),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: Paddings.p24.copyWith(bottom: 14),
                  child: Text(
                    'Ödənişlər',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: _selectedIndex == index
                            ? Chip(
                                backgroundColor: Colors.cyan,
                                padding: Paddings.p12,
                                label: Text(
                                  'Hospdfsfsfital1',
                                  style: TextStyle(color: Colors.cyan.shade50),
                                ),
                              )
                            : Chip(
                                backgroundColor: Colors.cyan.shade50,
                                padding: Paddings.p12,
                                label: const Text(
                                  'Hospdfsfsfital1',
                                  style: TextStyle(color: Colors.cyan),
                                ),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const PaymentCard();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
