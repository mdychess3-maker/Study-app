import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';

class PermissionDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required String permissionName,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          description,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              // Open app settings
              SystemChannels.platform.invokeMethod(
                'SystemNavigator.pop',
              );
            },
            child: const Text(
              'Go to settings',
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showCamera(BuildContext context) {
    show(
      context: context,
      title: 'Camera Permission Required',
      description:
          'For photo recognition and AI scanning. If you do not grant this permission, you will not be able to use this feature.',
      permissionName: 'camera',
    );
  }

  static void showStorage(BuildContext context) {
    show(
      context: context,
      title: 'Storage Permission Required',
      description:
          'To import PDFs, documents, and images for study materials. Please enable storage access in settings.',
      permissionName: 'storage',
    );
  }

  static void showMicrophone(BuildContext context) {
    show(
      context: context,
      title: 'Microphone Permission Required',
      description:
          'For voice input and AI voice chat features. Please enable microphone access in settings.',
      permissionName: 'microphone',
    );
  }
}