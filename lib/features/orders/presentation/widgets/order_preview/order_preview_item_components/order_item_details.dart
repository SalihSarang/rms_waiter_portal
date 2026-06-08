import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/menu_models/add_ons_model/add_ons_model.dart';
import 'package:rms_shared_package/models/menu_models/portions_and_price/portions_and_price.dart';

class OrderItemDetails extends StatelessWidget {
  final PortionAndPrice? portion;
  final List<AddOnsModel> addOns;

  const OrderItemDetails({super.key, this.portion, required this.addOns});

  @override
  Widget build(BuildContext context) {
    final List<String> details = [];
    if (portion != null) {
      details.add(portion!.name);
    }
    if (addOns.isNotEmpty) {
      details.addAll(addOns.map((e) => e.name));
    }
    final detailsString = details.join('  ·  ');

    if (detailsString.isEmpty) return const SizedBox.shrink();

    return Text(
      detailsString,
      style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
    );
  }
}
