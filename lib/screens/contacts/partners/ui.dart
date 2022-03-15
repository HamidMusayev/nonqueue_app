import 'package:flutter/material.dart';
import 'package:nonqueue_app/models/company/company_branch.dart';
import 'package:nonqueue_app/screens/partnerdetail/ui.dart';

import '../../../utils/constants.dart';
import '../../../widgets/partner_card.dart';
import '../../home/title.dart';

class PartnersScreen extends StatefulWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  _PartnersScreenState createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hey, Where would you like to buy a gift?',
          style: TextStyle(color: ColorPalette.lightBlack, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: Paddings.p16.copyWith(bottom: 0),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search restaraunts & location...',
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
            Spaces.vertical10,
            const TitlePanel(
              subtitle: 'All partners',
              viewAllButton: false,
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 235),
              child: ListView(
                primary: false,
                padding: const EdgeInsets.only(left: 16),
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6]
                    .map(
                      (e) => PartnerCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PartnerDetailScreen(),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        branch: CompanyBranch(
                            id: 12,
                            name: 'sdsad',
                            companyId: 1,
                            stars: 21,
                            status: '',
                            adress: 'asd'),
                      ),
                    )
                    .toList(),
              ),
            ),
            const TitlePanel(
              subtitle: 'Most popular',
              viewAllButton: false,
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 235),
              child: ListView(
                primary: false,
                padding: const EdgeInsets.only(left: 16),
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6]
                    .map(
                      (e) => PartnerCard(
                        onTap: () {},
                        branch: CompanyBranch(
                            id: 12,
                            name: 'sdsad',
                            companyId: 1,
                            stars: 21,
                            status: '',
                            adress: 'asd'),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
