import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:trivia_app/screens/score_screen.dart';
import 'package:trivia_app/services/quiz_maker.dart';
import 'package:trivia_app/utility/card_details.dart';
import 'package:trivia_app/widgets/close_button.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({required this.questionData, required this.categoryIndex});

  final questionData;
  final int categoryIndex;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    quizMaker.getList(widget.questionData);
  }

  final CountDownController _controller = CountDownController();

  QuizMaker quizMaker = QuizMaker();
  int questionNumber = 0;

  bool isAbsorbing = false;

  final int duration = 10;

  List<Color> optionColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<Widget> buildOptions(int i) {
    List<String> options = quizMaker.getOptions(i);

    List<Widget> Options = [];

    for (int j = 0; j < 4; j++) {
      Options.add(OptionWidget(
        widget: widget,
        option: options[j],
        optionColor: optionColor[j],
        onTap: () async {
          _controller.pause();
          if (quizMaker.isCorrect(i, j)) {
            setState(() {
              optionColor[j] = Colors.green;
              isAbsorbing = true;
            });
            quizMaker.increaseScore();
          } else {
            setState(() {
              optionColor[j] = Colors.red;
              optionColor[quizMaker.getCorrectIndex(i)] = Colors.green;
              isAbsorbing = true;
            });
          }
          await Future.delayed(
              const Duration(seconds: 1, milliseconds: 30), () {});
          if (questionNumber < 9) {
            setState(() {
              optionColor[j] = Colors.white;
              optionColor[quizMaker.getCorrectIndex(i)] = Colors.white;
              questionNumber++;
              isAbsorbing = false;
            });
            _controller.restart();
          } else {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScoreScreen(
                  score: quizMaker.getScore(),
                  index: widget.categoryIndex,
                ),
              ),
            );
          }
        },
      ));
    }
    return Options;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isAbsorbing,
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: cardDetailList[widget.categoryIndex].gradients,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCloseButton(),
                  CircularCountDownTimer(
                    width: 50,
                    height: 50,
                    duration: duration,
                    fillColor: Colors.grey.withOpacity(0.8),
                    ringColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    autoStart: true,
                    isReverse: true,
                    controller: _controller,
                    onComplete: () {
                      if (questionNumber < 9) {
                        setState(() {
                          questionNumber++;
                        });
                        _controller.restart();
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScoreScreen(
                              score: quizMaker.getScore(),
                              index: widget.categoryIndex,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: Image.asset(
                  cardDetailList[widget.categoryIndex].iconAssetName,
                  fit: BoxFit.fitHeight,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'question ${(questionNumber + 1).toString()} of 10',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ignore: prefer_const_constructors
                    Text(
                      quizMaker.getQuestion(questionNumber),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ...buildOptions(questionNumber),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget(
      {Key? key,
      required this.widget,
      required this.option,
      required this.onTap,
      required this.optionColor})
      : super(key: key);

  final QuestionScreen widget;
  final String option;
  final VoidCallback onTap;
  final Color optionColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: optionColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 3),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: cardDetailList[widget.categoryIndex].textColor,
          ),
        ),
      ),
    );
  }
}
