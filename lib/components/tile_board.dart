import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_2048/components/animated_title.dart';
import 'package:game_2048/components/button.dart';
import 'package:game_2048/manager/board.dart';
import 'package:game_2048/utilities/colors.dart';

class TileBoardWidget extends ConsumerWidget {
  const TileBoardWidget({
    super.key,
    required this.moveAnimation,
    required this.scaleAnimation,
  });

  final CurvedAnimation moveAnimation;
  final CurvedAnimation scaleAnimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(boardManager);

    //Decides the maximum size the Board can be based on the shortest size of the screen.
    final size = max(
        290.0,
        min((MediaQuery.of(context).size.shortestSide * 0.90).floorToDouble(),
            460.0));

    //Decide the size of the tile based on the size of the board minus the space between each tile.
    final sizePerTile = (size / 4).floorToDouble();
    final tileSize = sizePerTile - 12.0 - (12.0 / 4);
    final boardSize = sizePerTile * 4;
    return SizedBox(
      width: boardSize,
      height: boardSize,
      child: Stack(
        children: [
          ...List.generate(board.tiles.length, (i) {
            var tile = board.tiles[i];
            return AnimatedTitleWidget(
              key: ValueKey(tile.id),
              tile: tile,
              moveAnimation: moveAnimation,
              scaleAnimation: scaleAnimation,
              size: tileSize,
              child: Container(
                width: tileSize,
                height: tileSize,
                decoration: BoxDecoration(
                  color: AppColors.tileColors[tile.value],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${tile.value}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Rowdies',
                      color: tile.value < 8
                          ? AppColors.kColorSecondary
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
          if (board.over)
            Positioned(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kColorOverlay,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      board.won ? 'You win!' : 'Game over!',
                      style: const TextStyle(
                        color: AppColors.kColorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                      ),
                    ),
                    ButtonWidget(
                      onPressed: () {
                        ref.read(boardManager.notifier).newGame();
                      },
                      text: board.won ? 'New Game' : 'Try Again',
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
