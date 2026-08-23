import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/permission_dialog.dart';

class AiScannerScreen extends StatelessWidget {
  const AiScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('AI Scanner'),
      ),
      body: Center(
        child: FadeSlideIn(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GlassCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.fromLTRB(
                22,
                28,
                22,
                24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 104,
                    height: 104,
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.08),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primary.withOpacity(0.15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primary.withOpacity(0.08),
                          blurRadius: 26,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.document_scanner_outlined,
                      size: 48,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Scan anything you are learning',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Scan documents, extract text, and analyze images with AI.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  _ScannerButton(
                    icon: Icons.camera_alt_outlined,
                    label: 'Camera',
                    onTap: () =>
                        PermissionDialog.showCamera(context),
                  ),
                  const SizedBox(height: 10),
                  _ScannerButton(
                    icon: Icons.photo_library_outlined,
                    label: 'Gallery',
                    onTap: () =>
                        PermissionDialog.showStorage(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScannerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ScannerButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 14),
      borderRadius: BorderRadius.circular(17),
      blur: 5,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppTheme.primary,
            size: 20,
          ),
          const SizedBox(width: 11),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}