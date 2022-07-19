import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorPopup extends StatelessWidget {
  DoctorPopup({Key? key}) : super(key: key);

  final Uri _url = Uri.parse('https://www.who.int/emergencies/diseases/novel-coronavirus-2019');

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.blue[200],
            contentPadding: const EdgeInsets.all(8.0),
            title:
                const Text("Know safety tips and precautions from top Doctors"),
            leading: Image.asset(
              'assets/images/doctor.webp',
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            subtitle: IconButton(
              icon: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                textDirection: TextDirection.ltr,
              ),
              onPressed:() async{
                Uri url = Uri.parse('https://www.who.int/emergencies/diseases/novel-coronavirus-2019');
                await _launchInBrowser(url);
              }
            ),
          ),
        ),
      ),
    );
  }
}
