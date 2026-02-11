import 'package:flutter/material.dart';
import 'package:flutter_icons_web/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Icons Gallery',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A1B9A), // Morado
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          surfaceTintColor: Colors.transparent, // 👈 clave
          backgroundColor: Color(0xFF6A1B9A),
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9800), // Naranja
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color(
            0xFF151E31,
          ), //Color(0xFF1E1E1E), // dark sólido
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final icons = [
//       Icons.home,
//       Icons.favorite,
//       Icons.settings,
//       Icons.star,
//       Icons.person,
//       Icons.email,
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Icons Gallery'),
//         centerTitle: true,
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: icons.length,
//         itemBuilder: (_, index) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icons[index], size: 40),
//               const SizedBox(height: 8),
//               Text(
//                 icons[index].toString(),
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
