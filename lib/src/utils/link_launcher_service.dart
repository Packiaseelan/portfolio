import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

/// A centralized service to handle launching URLs, emails, and assets.
/// 
/// Replaces previous `dart:html` usage to ensure cross-platform compatibility
/// (Web, macOS, iOS, Android) and to support future Flutter WebAssembly (Wasm) builds.
/// Web-only libraries like `dart:html` prevent compilation on native platforms
/// and are deprecated in favor of `package:web` or cross-platform plugins.
class LinkLauncherService {
  const LinkLauncherService._();

  /// Opens an external URL (e.g., GitHub, LinkedIn).
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback: try launching anyway, as canLaunchUrl can be restrictive
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      log('Error launching $url: $e');
    }
  }

  /// Opens the default email client.
  static Future<void> openEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await launchUrl(uri);
      }
    } catch (e) {
      log('Error launching email client: $e');
    }
  }

  /// Opens or downloads the resume PDF.
  static Future<void> openResume() async {
    // On Flutter Web, url_launcher handles relative asset paths.
    // By using url_launcher instead of dart:html's AnchorElement, we maintain
    // cross-platform capability and Wasm compatibility.
    final uri = Uri.parse('assets/pdf/Packiaseelan_Resume.pdf');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      log('Error launching resume: $e');
    }
  }
}
