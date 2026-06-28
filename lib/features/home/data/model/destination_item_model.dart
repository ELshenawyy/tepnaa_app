import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DestinationItemModel extends Equatable {
  final String imagePath;
  final String flagEmoji;
  final String countryName;
  final String hospitalsCount;
  final String badgeText;
  final Color badgeColor;
  final Color badgeTextColor;
  final String? description;
  final bool showButton;
  final bool showIcon;

  final FlagPosition flagPosition;
  final double titleFontSize;

  const DestinationItemModel({
    required this.imagePath,
    required this.flagEmoji,
    required this.countryName,
    required this.hospitalsCount,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeTextColor,
    this.description,
    this.showButton = false,
    this.showIcon = false,
    this.flagPosition = FlagPosition.topLeft,
    this.titleFontSize = 18,
  });

  @override
  List<Object?> get props => [
        imagePath,
        countryName,
        flagEmoji,
        hospitalsCount,
        badgeText,
        badgeColor,
        badgeTextColor,
        description,
        showButton,
        flagPosition,
        titleFontSize,
      ];
}

enum FlagPosition { topLeft, topRight, bottomLeft, bottomRight }
