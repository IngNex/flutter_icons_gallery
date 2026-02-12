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
    // Obtenemos el ancho de la pantalla
    final double screenWidth = MediaQuery.of(context).size.width;
    // Definimos si es "móvil" (menos de 400px)
    final bool isMobile = screenWidth < 400;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isMobile ? 15 : 20, // Menos padding en móvil
      ),
      color: Colors.grey.shade900,
      child: Flex(
        // Si es móvil usamos Column, si no, Row
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: isMobile
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          // Texto de copyright
          Text(
            "© MaicolDev 2026",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),

          // Espaciador para móvil para que no queden pegados
          if (isMobile) const SizedBox(height: 5),

          // Contenedor de iconos
          // Usamos Wrap en lugar de Row para que los iconos bajen si no caben
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 5, // Espacio horizontal entre iconos
            children: [
              _socialIcon(Icons.code, "https://github.com/ingnex"),
              _socialIcon(
                Icons.tiktok_rounded,
                "https://www.tiktok.com/@maicoldev",
              ),
              _socialIcon(Icons.facebook, ""),
              _socialIcon(Icons.alternate_email, ""),
              _socialIcon(Icons.code, ""),
            ],
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para no repetir código
  Widget _socialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, size: 20),
      color: Colors.white,
      onPressed: () {
        if (url.isNotEmpty) _launchUrl(url);
      },
    );
  }
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
  //     color: Colors.grey.shade900, // Fondo oscuro elegante
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         // Texto de copyright
  //         Text(
  //           "© MaicolDev 2026",
  //           style: TextStyle(color: Colors.white70, fontSize: 14),
  //         ),

  //         // Links o íconos sociales
  //         Row(
  //           children: [
  //             IconButton(
  //               icon: const Icon(Icons.code),
  //               color: Colors.white,
  //               onPressed: () {
  //                 _launchUrl("https://github.com/ingnex"); // GitHub
  //               },
  //             ),
  //             IconButton(
  //               icon: const Icon(Icons.tiktok_rounded),
  //               color: Colors.white,
  //               onPressed: () {
  //                 _launchUrl("https://www.tiktok.com/@maicoldev"); // TikTok
  //               },
  //             ),
  //             IconButton(
  //               icon: const Icon(Icons.facebook),
  //               color: Colors.white,
  //               onPressed: () {
  //                 // acción: abrir link
  //               },
  //             ),
  //             IconButton(
  //               icon: const Icon(Icons.alternate_email),
  //               color: Colors.white,
  //               onPressed: () {
  //                 // acción: abrir email
  //               },
  //             ),
  //             IconButton(
  //               icon: const Icon(Icons.code),
  //               color: Colors.white,
  //               onPressed: () {
  //                 // acción: abrir GitHub/portafolio
  //               },
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
