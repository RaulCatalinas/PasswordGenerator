import 'package:logkeeper/logkeeper.dart' show LogKeeper;
import 'package:url_launcher/url_launcher.dart' show launchUrl;

Future<void> openUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    LogKeeper.error('The URL could not be opened: $url');

    return;
  }

  LogKeeper.info('URL $url opened correctly');
}
