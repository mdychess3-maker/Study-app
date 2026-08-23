import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/character_avatar.dart';
import '../widgets/glass_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int _selectedFace = 0;
  int _selectedHair = 0;
  int _selectedEyes = 0;
  int _selectedOutfit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Character'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          FadeSlideIn(
            child: GlassCard(
              margin: const EdgeInsets.fromLTRB(16, 6, 16, 20),
              padding: const EdgeInsets.all(24),
              gradient: [
                AppTheme.surfaceLight.withOpacity(0.9),
                AppTheme.surface.withOpacity(0.55),
              ],
              child: const Center(
                child: CharacterAvatar(
                  size: 132,
                  showBorder: true,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildOptionRow(
                  'Face',
                  4,
                  _selectedFace,
                  (i) => setState(() => _selectedFace = i),
                ),
                _buildOptionRow(
                  'Hair',
                  6,
                  _selectedHair,
                  (i) => setState(() => _selectedHair = i),
                ),
                _buildOptionRow(
                  'Eyes',
                  4,
                  _selectedEyes,
                  (i) => setState(() => _selectedEyes = i),
                ),
                _buildOptionRow(
                  'Outfit',
                  5,
                  _selectedOutfit,
                  (i) => setState(() => _selectedOutfit = i),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(
    String label,
    int count,
    int selected,
    ValueChanged<int> onSelect,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(count, (index) {
                final isSelected = index == selected;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onSelect(index),
                      borderRadius: BorderRadius.circular(15),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.primary.withOpacity(0.11)
                              : AppTheme.surface.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.primary
                                : AppTheme.glassEdge,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Icon(
                          Icons.face_rounded,
                          color: isSelected
                              ? AppTheme.primary
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}