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
      appBar: AppBar(
        title: Row(
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          int columns;
          EdgeInsets padding;

          if (width < 600) {
            // 📱 Phone
            columns = 2;
            padding = const EdgeInsets.all(12);
          } else if (width < 1024) {
            // 📱 Tablet
            columns = 4;
            padding = const EdgeInsets.all(16);
          } else if (width < 1500) {
            // 📱 Tablet
            columns = 6;
            padding = const EdgeInsets.all(16);
          } else {
            // 💻 Web / Desktop
            columns = 10;
            padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
          }

          return Column(
            children: [
              Padding(padding: padding, child: _buildSearch()),
              Expanded(child: _buildGrid(columns, padding)),
              const Footer(),
            ],
          );
        },
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
        childAspectRatio: 1,
      ),
      itemBuilder: (_, index) {
        final item = filteredIcons[index];
        return IconCard(icon: item);
      },
    );
  }
}
