import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/permission_dialog.dart';

class PdfToolsScreen extends StatelessWidget {
  const PdfToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      const _PdfTool(Icons.visibility_outlined, 'Read PDF', 'Open and read PDF files'),
      const _PdfTool(Icons.search_rounded, 'Search PDF', 'Find text inside documents'),
      const _PdfTool(Icons.summarize_outlined, 'Summarize', 'AI-powered PDF summary'),
      const _PdfTool(Icons.text_fields_rounded, 'Extract text', 'Copy text from PDF pages'),
      const _PdfTool(Icons.merge_type_rounded, 'Merge PDFs', 'Combine multiple files'),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('PDF Tools')),
      body: ListView.builder(
        itemCount: tools.length,
        itemBuilder: (context, index) {
          final tool = tools[index];
          return GlassCard(
            onTap: () => PermissionDialog.showStorage(context),
            child: Row(
              children: [
                Icon(tool.icon, color: AppTheme.mint),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tool.title),
                      Text(tool.subtitle),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PdfTool {
  final IconData icon;
  final String title;
  final String subtitle;

  const _PdfTool(this.icon, this.title, this.subtitle);
}