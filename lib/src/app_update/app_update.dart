import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';

class AppUpdate {
  static checkAppUpdate(BuildContext context) async {
    NewVersionPlus newVersionPlus =
        NewVersionPlus(androidId: 'np.com.alokmishra.alc_book');
    VersionStatus? versionStatus = await newVersionPlus.getVersionStatus();

    if (versionStatus != null && versionStatus.canUpdate) {
      newVersionPlus.showUpdateDialog(
        context: context,
        versionStatus: versionStatus,
        dialogText: versionStatus.releaseNotes,
        launchModeVersion: LaunchModeVersion.external,
      );
    }
  }
}
