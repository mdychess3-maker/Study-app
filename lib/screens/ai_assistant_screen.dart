import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/permission_dialog.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [];

  bool _isTyping = false;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();

    if (text.isEmpty || _isTyping) return;

    setState(() {
      _messages.add({
        'isUser': true,
        'text': text,
      });

      _controller.clear();
      _isTyping = true;
    });

    _scrollToBottom();

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;

      setState(() {
        _isTyping = false;

        _messages.add({
          'isUser': false,
          'text':
              'Got it! I can help you understand that, make a study plan, create questions, or explain it step by step.',
        });
      });

      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.primary.withOpacity(0.18),
                ),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: AppTheme.primary,
                size: 19,
              ),
            ),
            const SizedBox(width: 11),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Ready when you are',
                  style: TextStyle(
                    color: AppTheme.success,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => PermissionDialog.showCamera(context),
            tooltip: 'Add image',
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: AppTheme.textPrimary,
            ),
          ),
          IconButton(
            onPressed: () => _showOptions(context),
            tooltip: 'More options',
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            GlassCard(
              margin: const EdgeInsets.fromLTRB(16, 84, 16, 0),
              padding: const EdgeInsets.all(16),
              blur: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project context',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Add instructions or files for the AI to reference in every conversation.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _ContextChip(
                          label: 'YESbro_doc.txt',
                          icon: Icons.description_outlined,
                          onRemove: () {},
                        ),
                        const SizedBox(width: 8),
                        _ContextChip(
                          label: 'Screenshot_1',
                          icon: Icons.image_outlined,
                          onRemove: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _messages.isEmpty && !_isTyping
                  ? Center(
                      child: FadeSlideIn(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 54,
                              color:
                                  AppTheme.textTertiary.withOpacity(0.65),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Start a conversation',
                              style:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Ask for a summary, plan, or explanation.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 12,
                                    color: AppTheme.textTertiary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                      itemCount:
                          _messages.length + (_isTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_isTyping && index == _messages.length) {
                          return const _TypingBubble();
                        }

                        final message = _messages[index];

                        return FadeSlideIn(
                          child: _ChatBubble(
                            isUser: message['isUser'] as bool,
                            text: message['text'] as String,
                          ),
                        );
                      },
                    ),
            ),
            _InputBar(
              controller: _controller,
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) => GlassCard(
        margin: EdgeInsets.zero,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        blur: 18,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 34,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.textTertiary,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 12),
              _OptionTile(
                icon: Icons.edit_rounded,
                label: 'Rename',
                onTap: () => Navigator.pop(context),
              ),
              _OptionTile(
                icon: Icons.push_pin_outlined,
                label: 'Pin to top',
                onTap: () => Navigator.pop(context),
              ),
              _OptionTile(
                icon: Icons.delete_outline_rounded,
                label: 'Delete',
                color: AppTheme.error,
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _InputBar({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 6,
      ),
      borderRadius: BorderRadius.circular(24),
      blur: 14,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              color: AppTheme.textSecondary,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 15,
              ),
              decoration: const InputDecoration(
                hintText: 'Ask anything...',
                hintStyle: TextStyle(
                  color: AppTheme.textTertiary,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 10,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic_none_rounded,
              color: AppTheme.textSecondary,
            ),
          ),
          Material(
            color: AppTheme.primary,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onSend,
              customBorder: const CircleBorder(),
              child: const SizedBox(
                width: 38,
                height: 38,
                child: Icon(
                  Icons.arrow_upward_rounded,
                  color: AppTheme.background,
                  size: 19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContextChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onRemove;

  const _ContextChip({
    required this.label,
    required this.icon,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppTheme.background.withOpacity(0.48),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: AppTheme.glassEdge,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15,
            color: AppTheme.textSecondary,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close_rounded,
              size: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final bool isUser;
  final String text;

  const _ChatBubble({
    required this.isUser,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? AppTheme.primary.withOpacity(0.94)
              : AppTheme.surfaceLight.withOpacity(0.8),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft:
                Radius.circular(isUser ? 18 : 5),
            bottomRight:
                Radius.circular(isUser ? 5 : 18),
          ),
          border: Border.all(
            color: isUser
                ? AppTheme.primaryLight.withOpacity(0.16)
                : AppTheme.glassEdge,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser
                ? AppTheme.background
                : AppTheme.textPrimary,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: AppTheme.surfaceLight.withOpacity(0.8),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppTheme.glassEdge,
          ),
        ),
        child: const SizedBox(
          width: 34,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              _Dot(),
              _Dot(),
              _Dot(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatefulWidget {
  const _Dot();

  @override
  State<_Dot> createState() => _DotState();
}

class _DotState extends State<_Dot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(
        begin: 0.35,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ),
      ),
      child: const CircleAvatar(
        radius: 3,
        backgroundColor: AppTheme.primary,
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onTap;

  const _OptionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = color ?? AppTheme.textPrimary;

    return ListTile(
      leading: Icon(
        icon,
        color: foreground,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: onTap,
    );
  }
}