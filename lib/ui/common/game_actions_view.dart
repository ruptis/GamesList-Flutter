import 'package:flutter/material.dart';
import 'package:gameslist/model/status.dart';
import 'package:material_symbols_icons/symbols.dart';

class GameActionsView extends StatelessWidget {
  const GameActionsView({super.key, this.status, required this.onToggleStatus});

  final Status? status;
  final Function(Status) onToggleStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(context, Status.playing, status, onToggleStatus,
            Symbols.sports_esports_rounded, const Color(0xFF754AB8)),
        _buildActionButton(
            context,
            Status.planning,
            status,
            onToggleStatus,
            Symbols.nest_clock_farsight_analog_rounded,
            const Color(0xFFE2AB08)),
        _buildActionButton(context, Status.passed, status, onToggleStatus,
            Symbols.check_circle_rounded, const Color(0xFF81EA9A)),
        _buildActionButton(context, Status.abandoned, status, onToggleStatus,
            Symbols.stop_circle_rounded, const Color(0xFFB41919)),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context,
      Status initialStatus,
      Status? status,
      Function(Status) onToggleStatus,
      IconData icon,
      Color color) {
    return IconButton(
        onPressed: () => onToggleStatus(initialStatus),
        icon: Icon(
          icon,
          fill: status == initialStatus ? 1.0 : 0.0,
          color: status == initialStatus
              ? color
              : Theme.of(context).colorScheme.onSurface,
        ));
  }
}
