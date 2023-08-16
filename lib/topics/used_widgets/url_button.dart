import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteButton extends StatefulWidget {
  final String websiteUrl;

  WebsiteButton(this.websiteUrl);

  @override
  State<WebsiteButton> createState() => _WebsiteButtonState();
}

class _WebsiteButtonState extends State<WebsiteButton> {
  // bool _showWebsite = false;

  void _launchWebsite() async {
    if (await canLaunch(widget.websiteUrl)) {
      await launch(widget.websiteUrl,
          forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch ${widget.websiteUrl}';
    }
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(widget.websiteUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch ${widget.websiteUrl}');
    }
  }

  // void _openWebsiteInIframe() async {
  //   if (await canLaunch(widget.websiteUrl)) {
  //     if (html.window != null && html.window.location != null) {
  //       html.window.location.href = widget.websiteUrl;
  //     } else {
  //       await launch(widget.websiteUrl, forceSafariVC: false, forceWebView: false);
  //     }
  //   } else {
  //     throw 'Could not launch ${widget.websiteUrl}';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      onPressed: _launchUrl,
      child: const Text(
        'Go to problem',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
