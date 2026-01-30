import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      color: Colors.grey.shade900, // Fondo oscuro elegante
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Texto de copyright
          Text(
            "© MaicolDev 2026",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),

          // Links o íconos sociales
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.code),
                color: Colors.white,
                onPressed: () {
                  _launchUrl("https://github.com/ingnex"); // GitHub
                },
              ),
              IconButton(
                icon: const Icon(Icons.tiktok_rounded),
                color: Colors.white,
                onPressed: () {
                  _launchUrl("https://www.tiktok.com/@maicoldev"); // TikTok
                },
              ),
              IconButton(
                icon: const Icon(Icons.facebook),
                color: Colors.white,
                onPressed: () {
                  // acción: abrir link
                },
              ),
              IconButton(
                icon: const Icon(Icons.alternate_email),
                color: Colors.white,
                onPressed: () {
                  // acción: abrir email
                },
              ),
              IconButton(
                icon: const Icon(Icons.code),
                color: Colors.white,
                onPressed: () {
                  // acción: abrir GitHub/portafolio
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
