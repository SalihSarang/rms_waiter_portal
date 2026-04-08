import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class OrderItemImage extends StatelessWidget {
  final String imageUrl;

  const OrderItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const OrderItemPlaceholderImage(),
            )
          : const OrderItemPlaceholderImage(),
    );
  }
}

class OrderItemPlaceholderImage extends StatelessWidget {
  const OrderItemPlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: NeutralColors.card,
      child: const Icon(
        Icons.broken_image,
        color: NeutralColors.icon,
        size: 20,
      ),
    );
  }
}

class OrderItemHeader extends StatelessWidget {
  final String name;
  final double price;

  const OrderItemHeader({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              color: NeutralColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(
            color: NeutralColors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

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

class OrderItemSpecialInstructions extends StatelessWidget {
  final String? instructions;

  const OrderItemSpecialInstructions({super.key, this.instructions});

  @override
  Widget build(BuildContext context) {
    if (instructions == null || instructions!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        'Note: $instructions',
        style: const TextStyle(
          color: SemanticColors.info,
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
