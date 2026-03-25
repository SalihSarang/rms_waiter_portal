import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Footer showing the current application version.
class ProfileVersionFooter extends StatelessWidget {
  const ProfileVersionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          return Text(
            'V${snapshot.data?.version ?? '1.0.0'}',
            style: const TextStyle(
              color: NeutralColors.icon,
              fontSize: 12,
            ),
          );
        },
      ),
    );
  }
}
