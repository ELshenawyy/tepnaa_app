import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'destination_item_model.dart';
class SpecialtyModel extends Equatable {
  final String key;
  final String chipLabel;
  final IconData chipIcon;
  final Color chipIconColor;
  final List<DestinationItemModel> destinations;

  const SpecialtyModel({
    required this.key,
    required this.chipLabel,
    required this.chipIcon,
    required this.chipIconColor,
    required this.destinations,
  });

  @override
  List<Object?> get props => [
        key,
        chipLabel,
        chipIcon,
        chipIconColor,
        destinations,
      ];
}
