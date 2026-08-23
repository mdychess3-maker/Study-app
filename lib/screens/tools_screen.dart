import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import 'ai_scanner_screen.dart';
import 'pdf_tools_screen.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      _ToolItem(
        Icons.document_scanner_outlined,
        'AI Scanner',
        'Camera, gallery, image analysis',
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AiScannerScreen(),
          ),
        ),
      ),
      _ToolItem(
        Icons.picture_as_pdf_outlined,
        'PDF Tools',
        'Read, search, summarize PDFs',
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PdfToolsScreen(),
          ),
        ),
      ),
      _ToolItem(
        Icons.calculate_outlined,
        'Calculator',
        'Scientific calculator',
        () {},
      ),
      _ToolItem(
        Icons.translate_outlined,
        'Translator',
        'Translate study materials',
        () {},
      ),
      _ToolItem(
        Icons.format_quote_outlined,
        'Citations',
        'Generate academic citations',
        () {},
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Tools')),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: tools.length,
        itemBuilder: (context, index) => FadeSlideIn(
          delay: Duration(milliseconds: index * 50),
          child: GlassCard(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),
            onTap: tools[index].onTap,
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    tools[index].icon,
                    color: AppTheme.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tools[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        tools[index].subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppTheme.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ToolItem(
    this.icon,
    this.title,
    this.subtitle,
    this.onTap,
  );
}