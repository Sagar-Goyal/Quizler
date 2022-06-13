import 'package:flutter/material.dart';

class ListDetail {
  ListDetail(
      {required this.title,
      required this.iconAssetName,
      required this.gradients,
      required this.shadowColor,
      required this.iconTag,
      required this.category,
      required this.textColor});
  final String title;
  final String iconAssetName;
  final List<Color> gradients;
  final Color shadowColor;
  final Object iconTag;
  final String category;
  final Color textColor;
}

const double opacity = 0.4;

final List<ListDetail> cardDetailList = [
  ListDetail(
    title: 'Art and Literature',
    iconAssetName: 'assets/images/art and literature.png',
    gradients: [
      const Color(0xff089e44),
      const Color(0xff3dd178),
    ],
    shadowColor: const Color(0xff3dd178).withOpacity(opacity),
    iconTag: 'art_icon',
    category: 'arts_and_literature',
    textColor: const Color(0xff089e44),
  ),
  ListDetail(
    title: 'Film and TV',
    iconAssetName: 'assets/images/film and tv.png',
    gradients: [
      const Color(0xff5718d6),
      const Color(0xff8048f0),
    ],
    shadowColor: const Color(0xff8048f0).withOpacity(opacity),
    iconTag: 'film_icon',
    category: 'film_and_tv',
    textColor: const Color(0xff5718d6),
  ),
  ListDetail(
    title: 'Food and Drink',
    iconAssetName: 'assets/images/food and drink.png',
    gradients: [
      const Color(0xffd6182e),
      const Color(0xffed475a),
    ],
    shadowColor: const Color(0xffed475a).withOpacity(opacity),
    iconTag: 'food_icon',
    category: 'food_and_drink',
    textColor: const Color(0xffd6182e),
  ),
  ListDetail(
    title: 'General Knowledge',
    iconAssetName: 'assets/images/general knowledge.png',
    gradients: [
      const Color(0xff0846a3),
      const Color(0xff387ee8),
    ],
    shadowColor: const Color(0xff387ee8).withOpacity(opacity),
    iconTag: 'gk_icon',
    category: 'general_knowledge',
    textColor: const Color(0xff0846a3),
  ),
  ListDetail(
    title: 'Geography',
    iconAssetName: 'assets/images/geography.png',
    gradients: [
      const Color(0xffd97014),
      const Color(0xfff2a057),
    ],
    shadowColor: const Color(0xfff2a057).withOpacity(opacity),
    iconTag: 'geography_icon',
    category: 'geography',
    textColor: const Color(0xffd97014),
  ),
  ListDetail(
    title: 'History',
    iconAssetName: 'assets/images/history.png',
    gradients: [
      const Color(0xff1c0659),
      const Color(0xff3c2a70),
    ],
    shadowColor: const Color(0xff3c2a70).withOpacity(opacity),
    iconTag: 'history_icon',
    category: 'history',
    textColor: const Color(0xff3c2a70),
  ),
  ListDetail(
    title: 'Music',
    iconAssetName: 'assets/images/music.png',
    gradients: [
      const Color(0xff28272b),
      const Color(0xff48474a),
    ],
    shadowColor: const Color(0xff48474a).withOpacity(opacity),
    iconTag: 'music_icon',
    category: 'music',
    textColor: const Color(0xff28272b),
  ),
  ListDetail(
    title: 'Science',
    iconAssetName: 'assets/images/science.png',
    gradients: [
      const Color(0xffeb2aeb),
      const Color(0xfffc7efc),
    ],
    shadowColor: const Color(0xfffc7efc).withOpacity(opacity),
    iconTag: 'science_icon',
    category: 'science',
    textColor: const Color(0xffeb2aeb),
  ),
  ListDetail(
    title: 'Society and Culture',
    iconAssetName: 'assets/images/society and culture.png',
    gradients: [
      const Color(0xfff2bd05),
      const Color(0xffe6c657),
    ],
    shadowColor: const Color(0xffe6c657).withOpacity(opacity),
    iconTag: 'society_icon',
    category: 'society_and_culture',
    textColor: const Color(0xfff2bd05),
  ),
  ListDetail(
    title: 'Sports and Leisure',
    iconAssetName: 'assets/images/sports and leisure.png',
    gradients: [
      const Color(0xff395c91),
      const Color(0xff75aafa),
    ],
    shadowColor: const Color(0xff75aafa).withOpacity(opacity),
    iconTag: 'sports_icon',
    category: 'sport_and_leisure',
    textColor: const Color(0xff395c91),
  ),
];
