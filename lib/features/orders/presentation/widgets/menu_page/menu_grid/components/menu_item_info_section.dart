import 'package:material_ui/material_ui.dart';
import 'card_info.dart';

class MenuItemInfoSection extends StatelessWidget {
  final String name;
  final double price;

  const MenuItemInfoSection({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CardInfo(name: name, price: price),
    );
  }
}
