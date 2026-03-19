import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/pages/home/widget/system_secret.dart';
import 'package:musicapp/pages/music/music_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerModel {
  final String title;
  final IconData icon;
  final Color color;
  final void Function(BuildContext) ontap;
  ControllerModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.ontap,
  });
  static final List<ControllerModel> listModel = [
    ControllerModel(
      title: "ابدا التشغيل",
      icon: Icons.play_arrow_outlined,
      color: Colors.red,
      ontap: (context) async {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => const MusicView(),
          ),
        );
      },
    ),
    ControllerModel(
      title: "سياسية الخصوصية",
      icon: Icons.lock,
      color: Colors.yellow,
      ontap: (context) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => SystemSecret(),
          ),
        );
      },
    ),
    ControllerModel(
      title: "تطبيقات اخري",
      icon: Icons.window,
      color: Colors.white,
      ontap: (context) {
        final Uri url = Uri.parse(
          "https://play.google.com/store/apps/dev?id=6694959770488864457",
        );

        // ignore: no_leading_underscores_for_local_identifiers
        Future<void> _launchUrl() async {
          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $url');
          }
        }

        _launchUrl();
      },
    ),
    ControllerModel(
      title: "مشاركة التطبيق",
      icon: Icons.share,
      color: Colors.blue,
      ontap: (context) {
        // ignore: deprecated_member_use
        Share.share(
          "https://play.google.com/store/apps/details?id=com.moqysite.musicapp&pcampaignid=web_share",
          subject: "مشاركة التطبيق",
        );
      },
    ),
  ];
}
