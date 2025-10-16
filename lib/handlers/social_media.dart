import 'package:url_launcher/url_launcher.dart' show launchUrl;

Future<void> openUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    print('The URL could not be opened: $url');

    return;
  }

  print('URL $url opened correctly');
}
