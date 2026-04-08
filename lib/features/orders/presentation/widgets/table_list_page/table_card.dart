import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class TableCard extends StatelessWidget {
  final TableModel table;
  final VoidCallback? onTap;

  const TableCard({super.key, required this.table, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (table.status) {
      case TableStatus.available:
        statusColor = SemanticColors.success;
        statusText = 'FREE';
        break;
      case TableStatus.occupied:
        statusColor = SemanticColors.info;
        statusText = 'BUSY';
        break;
      case TableStatus.billRequested:
        statusColor = StatusColors.purpleLight; // Purple
        statusText = 'BILL';
        break;
      case TableStatus.reserved:
        statusColor = SemanticColors.warning;
        statusText = 'RSVD';
        break;
      default:
        statusColor = NeutralColors.border;
        statusText = 'UNKNOWN';
    }

    return Material(
      color: NeutralColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: NeutralColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: statusColor.withValues(alpha: 0.8),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    table.name,
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          statusText,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.people_alt_outlined,
                        color: NeutralColors.icon,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${table.seats} Seats',
                        style: const TextStyle(
                          color: NeutralColors.icon,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  if (table.status == TableStatus.occupied)
                    const Icon(
                      Icons.restaurant_rounded,
                      color: SemanticColors.info,
                      size: 16,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
