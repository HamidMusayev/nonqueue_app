import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:nonqueue_app/screens/contacts/partners/ui.dart';
import 'package:nonqueue_app/utils/constants.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool _granted = true;
  bool _loading = true;
  List<Contact> _contacts = [];

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Paddings.p16.copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.person_add_rounded),
              title: Text('Send a gift & invite your friend'),
              horizontalTitleGap: 0,
            ),
            const Divider(
              color: ColorPalette.greyInputText,
              height: 40,
              thickness: 1,
            ),
            const Text(
              'NQP Contacts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorPalette.lightBlack,
              ),
            ),
            Spaces.vertical20,
            _granted
                ? _loading
                    ? const LinearProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _contacts.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PartnersScreen(),
                                fullscreenDialog: true,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/splash/contact.png'),
                              radius: 24,
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(_contacts[index].displayName),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.card_giftcard_rounded,
                                  color: ColorPalette.qlessApp,
                                ),
                                Spaces.horizontal6,
                                Spaces.horizontal6,
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                : Column(
                    children: [
                      const Text(
                        'You must allow the application to access your contacts to see who is using this application from your contacts',
                        style: TextStyle(
                          color: ColorPalette.greyInputText,
                        ),
                      ),
                      Spaces.vertical20,
                      TextButton(
                        onPressed: () => getContacts(),
                        child: const Text('Allow access'),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void getContacts() async {
    setState(() => _loading = true);
    if (await FlutterContacts.requestPermission()) {
      _contacts = await FlutterContacts.getContacts(withPhoto: false);
      _granted = true;
    } else {
      _granted = false;
    }
    setState(() => _loading = false);
  }
}
