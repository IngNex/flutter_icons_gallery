import 'package:flutter/material.dart';
import 'package:flutter_icons_web/core/data/flutter_icons.dart';
import 'package:flutter_icons_web/core/model/model_flutter_icon.dart';
import 'package:flutter_icons_web/ui/widgets/footer.dart';
import 'package:flutter_icons_web/ui/widgets/icon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';

  List<FlutterIcon> get filteredIcons {
    if (query.isEmpty) return flutterIcons;

    return flutterIcons
        .where((icon) => icon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.all(30.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           children: [
      //             Icon(Icons.whatshot_outlined, color: Color(0xFFFF9800)),
      //             Text(
      //               "MaicolDev",
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.bold,
      //                 color: Color(0xFFFF9800),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row(
      //           children: [
      //             Text(
      //               'Flutter'.toUpperCase(),
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             ),
      //             SizedBox(width: 10),
      //             CircleAvatar(
      //               backgroundColor: Colors.grey.shade200,
      //               child: Icon(
      //                 Icons.flutter_dash_rounded,
      //                 //color: Color(0xFFFF9800),
      //               ),
      //             ),
      //             SizedBox(width: 10),
      //             Text(
      //               'Icons'.toUpperCase(),
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             ),
      //           ],
      //         ),
      //         Text(
      //           'More +2000 icons',
      //           style: TextStyle(
      //             fontSize: 12,
      //             fontWeight: FontWeight.bold,
      //             color: Color(0xFFFF9800),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: Color(0xFF0F172A),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          int columns;
          EdgeInsets padding;

          if (width < 600) {
            // 📱 Phone
            columns = 2;
            padding = const EdgeInsets.all(10);
          } else if (width < 800) {
            // 📱 Phone
            columns = 3;
            padding = const EdgeInsets.all(10);
          } else if (width < 1000) {
            // 📱 Tablet
            columns = 4;
            padding = const EdgeInsets.all(12);
          } else if (width < 1200) {
            // 📱 Tablet
            columns = 5;
            padding = const EdgeInsets.all(16);
          } else if (width < 1500) {
            // 📱 Tablet
            columns = 6;
            padding = const EdgeInsets.all(16);
          } else if (width < 1800) {
            // 📱 Tablet
            columns = 8;
            padding = const EdgeInsets.all(16);
          } else {
            // 💻 Web / Desktop
            columns = 10;
            padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 15);
          }

          return Column(
            children: [
              _buildHeader(),
              Padding(padding: padding, child: _buildSearch()),
              Expanded(child: _buildGrid(columns, padding)),
              const Footer(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Color(0xFF0F172A).withValues(alpha: 0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.whatshot_outlined, color: Color(0xFFFF9800)),
              Text(
                "MaicolDev",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Flutter'.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.flutter_dash_rounded,
                  //color: Color(0xFFFF9800),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Icons'.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'More +2000 icons',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF9800),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: (value) {
          setState(() => query = value);
        },

        decoration: InputDecoration(
          hintText: 'Buscar ícono...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
      ),
    );
  }

  Widget _buildGrid(int columns, EdgeInsets padding) {
    return GridView.builder(
      padding: padding,
      itemCount: filteredIcons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (_, index) {
        final item = filteredIcons[index];
        return IconCard(icon: item);
      },
    );
  }
}
