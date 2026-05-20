import 'package:flutter/material.dart';
import 'package:waiter_portal/features/orders/presentation/pages/menu_page.dart';
import '../table_view_canvas.dart';

class HallLayoutCanvas extends StatelessWidget {
  const HallLayoutCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return TableViewCanvas(
      onTableTap: (table) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(tableNumber: table.name),
          ),
        );
      },
    );
  }
}
