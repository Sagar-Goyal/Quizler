import 'package:flutter/material.dart';
import 'package:trivia_app/utility/card_details.dart';
import 'package:trivia_app/widgets/close_button.dart';
import 'package:trivia_app/widgets/difficulty_tile.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[selectedIndex].gradients,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CustomCloseButton(),
              ],
            ),
            Text(
              cardDetailList[selectedIndex].title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            Hero(
              tag: cardDetailList[selectedIndex].iconTag,
              child: Image.asset(
                cardDetailList[selectedIndex].iconAssetName,
                height: 300,
                width: 300,
              ),
            ),
            Column(
              children: [
                const Text(
                  'Select Difficulty',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Harder the Difficulty, Lesser the Time per question.',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DifficultyTile(selectedIndex: selectedIndex, difficulty: 0),
                const SizedBox(height: 20),
                DifficultyTile(selectedIndex: selectedIndex, difficulty: 1),
                const SizedBox(height: 20),
                DifficultyTile(selectedIndex: selectedIndex, difficulty: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
