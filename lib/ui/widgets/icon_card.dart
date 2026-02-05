import 'package:flutter/material.dart';
import 'package:flutter_icons_web/core/model/model_flutter_icon.dart';

import 'package:flutter/services.dart';

class IconCard extends StatefulWidget {
  final FlutterIcon icon;

  const IconCard({super.key, required this.icon});

  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  bool isHover = false;

  void _copy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: 'Icons.${widget.icon.iconName}'));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copiado: Icons.${widget.icon.iconName}'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () => _copy(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //color: isHover ? scheme.primaryContainer : Colors.white,
            color: isHover ? Colors.grey.shade300 : Colors.grey.shade200,
            border: Border.all(color: Colors.grey.shade400),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withValues(alpha: 0.20),
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                  ),
                  child: Icon(
                    widget.icon.icon,
                    size: 36,
                    //color: scheme.primary,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.icon.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.icon.category,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withValues(alpha: 0.20),
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                  ),
                  child: Text(
                    "Icon.${widget.icon.iconName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
