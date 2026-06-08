import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../pages/seat_count_page.dart';
import 'table_card.dart';

class TableGridItem extends StatelessWidget {
  final TableModel table;

  const TableGridItem({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return TableCard(
      table: table,
      onTap: () {
        final availableSeats = table.seats - table.occupiedSeats;

        if (availableSeats <= 0) {
          RmsSnackbar.show(
            context,
            message:
                'Table ${table.name} is full. Choose another table or checkout current guests.',
            type: RmsSnackbarType.error,
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (innerContext) => SeatCountPage(
              tableName: table.name,
              tableId: table.id,
              availableSeats: availableSeats,
            ),
          ),
        );
      },
    );
  }
}
