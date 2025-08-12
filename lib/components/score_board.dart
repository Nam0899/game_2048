import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_2048/manager/board.dart';
import 'package:game_2048/utilities/colors.dart';

class ScoreBoardWidget extends ConsumerWidget {
  const ScoreBoardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(boardManager.select((board) => board.score));
    final best = ref.watch(boardManager.select((board) => board.best));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScoreWidget(
          label: 'Score',
          score: '$score',
        ),
        const SizedBox(
          width: 8,
        ),
        ScoreWidget(
          label: 'Best',
          score: '$best',
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ],
    );
  }
}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.label,
    required this.score,
    this.padding,
  });

  final String label;
  final String score;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
      decoration: BoxDecoration(
        color: AppColors.kColorBoard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white60,
              fontFamily: 'FiraMono',
            ),
          ),
          Text(
            score,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'FiraMono',
            ),
          ),
        ],
      ),
    );
  }
}
