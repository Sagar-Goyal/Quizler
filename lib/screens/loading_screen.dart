import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:trivia_app/screens/question_screen.dart';
import 'package:trivia_app/utility/card_details.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trivia_app/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  final int index;
  final String selectedDif;
  const LoadingScreen({required this.index, required this.selectedDif});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Timer(const Duration(milliseconds: 500), () {
        getQuestions();
      });
    });
  }

  Future<bool> checkConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  void getQuestions() async {
    bool result = await checkConnectivity();
    if (result) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://the-trivia-api.com/api/questions?categories=' +
              cardDetailList[widget.index].category +
              '&limit=10&difficulty=' +
              widget.selectedDif);
      var questionData = await networkHelper.getData();

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => QuestionScreen(
                questionData: questionData,
                categoryIndex: widget.index,
              )),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('No internet connection. Try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[widget.index].gradients,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
