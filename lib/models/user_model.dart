import 'package:flutter/material.dart';

class UserModel {
  String username;
  int level;
  int xp;
  int xpToNext;
  int streak;
  int longestStreak;
  String league;
  int rank;

  UserModel({
    this.username = 'Student',
    this.level = 1,
    this.xp = 0,
    this.xpToNext = 100,
    this.streak = 7,
    this.longestStreak = 14,
    this.league = 'Bronze',
    this.rank = 42,
  });
}

class Achievement {
  String title;
  String description;
  bool unlocked;
  IconData icon;

  Achievement({
    required this.title,
    required this.description,
    this.unlocked = false,
    required this.icon,
  });
}