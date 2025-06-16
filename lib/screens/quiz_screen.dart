// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:sukoon_setu/models/user_info_model.dart';
// import 'package:sukoon_setu/screens/chat_screen.dart';
// import 'package:sukoon_setu/screens/home_screen.dart';

// class Question {
//   final String section;
//   final String text;
//   final List<String> options;
//   Question({required this.section, required this.text, required this.options});
// }

// class QuizScreen extends StatefulWidget {
//   final Function(Locale) onLocaleChange;
//   final UserInfo userInfo;

//   const QuizScreen({
//     super.key,
//     required this.userInfo,
//     required this.onLocaleChange,
//   });
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   final PageController _controller = PageController();
//   int _currentIndex = 0;
//   late Timer _timer;
//   int _timeLeft = 180;

//   // Track selected option index per question; null if none selected yet
//   List<int?> _selectedOptions = [];

//   final List<Question> questions = [
//     // Section A
//     Question(
//       section: "🟠 Section A: General Wellbeing (Last 2 Weeks)",
//       text: 'Do you often feel sad, empty, or hopeless?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🟠 Section A: General Wellbeing (Last 2 Weeks)",
//       text:
//           'Have you lost interest or joy in things you once enjoyed (e.g., farming, chatting, festivals)?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🟠 Section A: General Wellbeing (Last 2 Weeks)",
//       text: 'Do you feel tired or lack energy most days?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🟠 Section A: General Wellbeing (Last 2 Weeks)",
//       text: 'Do you have trouble sleeping, or sleep too much?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🟠 Section A: General Wellbeing (Last 2 Weeks)",
//       text: 'Do you feel restless, angry, or irritable for no reason?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),

//     // Section B
//     Question(
//       section: "🔶 Section B: Anxiety and Stress",
//       text:
//           'Do you worry too much about daily things (money, health, children)?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section B: Anxiety and Stress",
//       text:
//           'Do you feel nervous, fearful, or tense, even when there is no clear danger?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section B: Anxiety and Stress",
//       text: 'Do you have fast heartbeat, sweating, or shaking when anxious?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section B: Anxiety and Stress",
//       text: 'Do you have trouble concentrating due to worry or fear?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section B: Anxiety and Stress",
//       text:
//           'Do you often feel something bad is going to happen, even without a reason?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),

//     // Section C
//     Question(
//       section: "🔶 Section C: Thought and Behavior Changes",
//       text: 'Do you sometimes hear voices or see things others do not?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section C: Thought and Behavior Changes",
//       text: 'Do you believe that others are watching or trying to harm you?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section C: Thought and Behavior Changes",
//       text:
//           'Do you talk to yourself or act in a way that others find strange or confusing?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section C: Thought and Behavior Changes",
//       text: 'Have you ever forgotten what you did for long periods of time?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section C: Thought and Behavior Changes",
//       text:
//           'Do you feel like you are not yourself, or as if you are watching your own life?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),

//     // Section D
//     Question(
//       section: "🔶 Section D: Substance Use",
//       text: 'Do you drink alcohol or take tobacco/drugs regularly?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section D: Substance Use",
//       text: 'Do you feel you cannot stop using alcohol/drugs even if you try?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section D: Substance Use",
//       text:
//           'Has alcohol or drug use caused problems at home, work, or in health?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section D: Substance Use",
//       text: 'Do you use substances to feel better when you\'re sad or anxious?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section D: Substance Use",
//       text: 'Have people asked you to cut down on drinking or drug use?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),

//     // Section E
//     Question(
//       section: "🔶 Section E: Social and Functional Impairment",
//       text: 'Have you been avoiding people or staying alone more than before?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section E: Social and Functional Impairment",
//       text:
//           'Are you able to work properly or manage household responsibilities?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section E: Social and Functional Impairment",
//       text: 'Do you feel ashamed, useless, or like a burden to others?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section E: Social and Functional Impairment",
//       text: 'Have you ever thought about harming yourself or ending your life?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//     Question(
//       section: "🔶 Section E: Social and Functional Impairment",
//       text: 'Do you feel there is no reason to live?',
//       options: ['Never', 'Sometimes', 'Often', 'Always'],
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _selectedOptions = List<int?>.filled(questions.length, null);
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_timeLeft == 0) {
//         _timer.cancel();
//         _navigateToHome();
//       } else {
//         setState(() => _timeLeft--);
//       }
//     });
//   }

//   void _navigateToHome() {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (_) => ChatScreen(onLocaleChange: widget.onLocaleChange),
//       ),
//     );
//   }

//   void _onOptionSelected(int optionIndex) {
//     setState(() {
//       _selectedOptions[_currentIndex] = optionIndex;
//     });
//   }

//   void _goNext() {
//     if (_currentIndex < questions.length - 1) {
//       setState(() {
//         _currentIndex++;
//       });
//       _controller.nextPage(
//         duration: Duration(milliseconds: 350),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       _timer.cancel();
//       _navigateToHome();
//     }
//   }

//   void _goPrevious() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//       });
//       _controller.previousPage(
//         duration: Duration(milliseconds: 350),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   String _formatTime(int seconds) {
//     final minutes = seconds ~/ 60;
//     final remainingSeconds = seconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final question = questions[_currentIndex];
//     final selectedOption = _selectedOptions[_currentIndex];

//     return Scaffold(
//       backgroundColor: Colors.orange.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         title: Text(
//           "🧠 Mental Health Quiz",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               LinearProgressIndicator(
//                 value: (_currentIndex + 1) / questions.length,
//                 backgroundColor: Colors.orange.shade100,
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
//                 minHeight: 8,
//               ),
//               SizedBox(height: 12),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   "Time Left: ${_formatTime(_timeLeft)}",
//                   style: TextStyle(
//                     color: Colors.red.shade700,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 question.section,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.deepOrange.shade700,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.orange.shade100,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.orange.shade200.withOpacity(0.5),
//                       blurRadius: 8,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   question.text,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.deepOrange.shade900,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),

//               // Options
//               ...List.generate(question.options.length, (index) {
//                 final optionText = question.options[index];
//                 final isSelected = selectedOption == index;

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 6.0),
//                   child: ElevatedButton(
//                     onPressed: () => _onOptionSelected(index),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: isSelected
//                           ? Colors.deepOrange
//                           : Colors.white,
//                       foregroundColor: isSelected
//                           ? Colors.white
//                           : Colors.deepOrange,
//                       side: BorderSide(color: Colors.deepOrange),
//                       padding: EdgeInsets.symmetric(
//                         vertical: 16,
//                         horizontal: 20,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: isSelected ? 6 : 2,
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           isSelected
//                               ? Icons.check_circle
//                               : Icons.circle_outlined,
//                           color: isSelected ? Colors.white : Colors.deepOrange,
//                         ),
//                         SizedBox(width: 14),
//                         Expanded(
//                           child: Text(
//                             optionText,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),

//               Spacer(),

//               // Previous & Next buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Previous
//                   ElevatedButton.icon(
//                     onPressed: _currentIndex > 0 ? _goPrevious : null,
//                     icon: Icon(Icons.arrow_back),
//                     label: Text("Previous"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: _currentIndex > 0
//                           ? Colors.deepOrange
//                           : Colors.orange.shade200,
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 14,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

//                   // Next
//                   ElevatedButton.icon(
//                     onPressed: selectedOption != null ? _goNext : null,
//                     icon: Text(
//                       _currentIndex == questions.length - 1 ? "Finish" : "Next",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     label: Icon(Icons.arrow_forward),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOption != null
//                           ? Colors.deepOrange
//                           : Colors.orange.shade200,
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 14,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/chat_page.dart';

Map<String, int> sectionScores = {};

class Question {
  final String sectionKey; // e.g., "Section A"
  final String section;    // full name like "🟠 Section A: General Wellbeing..."
  final String text;

  Question({
    required this.sectionKey,
    required this.section,
    required this.text,
  });
}


class QuizScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  final UserInfo userInfo;

  const QuizScreen({
    super.key,
    required this.userInfo,
    required this.onLocaleChange,
  });
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  // late Timer _timer;
  // int _timeLeft = 180;

  List<int?> _selectedOptions = [];
  late List<Question> questions;
    bool _isInitialized = false; 


  @override
  void initState() {
    super.initState();
    // _startTimer();
    sectionScores.clear();
  }

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInitialized) return;

    final localizations = AppLocalizations.of(context)!;

    questions = [
      // Section A
      Question(section: "🟠 Section A: General Wellbeing (Last 2 Weeks)", text: localizations.quizSectionAQuestion1, sectionKey: 'Section A'),
      Question(section: "🟠 Section A: General Wellbeing (Last 2 Weeks)", text: localizations.quizSectionAQuestion2, sectionKey: 'Section A'),
      Question(section: "🟠 Section A: General Wellbeing (Last 2 Weeks)", text: localizations.quizSectionAQuestion3, sectionKey: 'Section A'),
      Question(section: "🟠 Section A: General Wellbeing (Last 2 Weeks)", text: localizations.quizSectionAQuestion4, sectionKey: 'Section A'),
      Question(section: "🟠 Section A: General Wellbeing (Last 2 Weeks)", text: localizations.quizSectionAQuestion5, sectionKey: 'Section A'),

      // Section B
      Question(section: "🔶 Section B: Anxiety and Stress", text: localizations.quizSectionBQuestion1, sectionKey: 'Section B'),
      Question(section: "🔶 Section B: Anxiety and Stress", text: localizations.quizSectionBQuestion2, sectionKey: 'Section B'),
      Question(section: "🔶 Section B: Anxiety and Stress", text: localizations.quizSectionBQuestion3, sectionKey: 'Section B'),
      Question(section: "🔶 Section B: Anxiety and Stress", text: localizations.quizSectionBQuestion4, sectionKey: 'Section B'),
      Question(section: "🔶 Section B: Anxiety and Stress", text: localizations.quizSectionBQuestion5, sectionKey: 'Section B'),

      // Section C
      Question(section: "🔶 Section C: Thought and Behavior Changes", text: localizations.quizSectionCQuestion1, sectionKey: 'Section C'),
      Question(section: "🔶 Section C: Thought and Behavior Changes", text: localizations.quizSectionCQuestion2, sectionKey: 'Section C'),
      Question(section: "🔶 Section C: Thought and Behavior Changes", text: localizations.quizSectionCQuestion3, sectionKey: 'Section C'),
      Question(section: "🔶 Section C: Thought and Behavior Changes", text: localizations.quizSectionCQuestion4, sectionKey: 'Section C'),
      Question(section: "🔶 Section C: Thought and Behavior Changes", text: localizations.quizSectionCQuestion5, sectionKey: 'Section C'),

      // Section D
      Question(section: "🔶 Section D: Substance Use", text: localizations.quizSectionDQuestion1, sectionKey: 'Section D'),
      Question(section: "🔶 Section D: Substance Use", text: localizations.quizSectionDQuestion2, sectionKey: 'Section D'),
      Question(section: "🔶 Section D: Substance Use", text: localizations.quizSectionDQuestion3, sectionKey: 'Section D'),
      Question(section: "🔶 Section D: Substance Use", text: localizations.quizSectionDQuestion4, sectionKey: 'Section D'),
      Question(section: "🔶 Section D: Substance Use", text: localizations.quizSectionDQuestion5, sectionKey: 'Section D'),

      // Section E
      Question(section: "🔶 Section E: Social and Functional Impairment", text: localizations.quizSectionEQuestion1, sectionKey: 'Section E'),
      Question(section: "🔶 Section E: Social and Functional Impairment", text: localizations.quizSectionEQuestion2, sectionKey: 'Section E'),
      Question(section: "🔶 Section E: Social and Functional Impairment", text: localizations.quizSectionEQuestion3, sectionKey: 'Section E'),
      Question(section: "🔶 Section E: Social and Functional Impairment", text: localizations.quizSectionEQuestion4, sectionKey: 'Section E'),
      Question(section: "🔶 Section E: Social and Functional Impairment", text: localizations.quizSectionEQuestion5, sectionKey: 'Section E'),
    ];

    _selectedOptions = List<int?>.filled(questions.length, null);

    _isInitialized = true;
  }

  // void _startTimer() {
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (_timeLeft == 0) {
  //       _timer.cancel();
  //       _navigateToHome();
  //     } else {
  //       setState(() => _timeLeft--);
  //     }
  //   });
  // }

// void _navigateToHome(Map<String, int> sectionScores) {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//       builder: (_) => ChatScreen(
//         onLocaleChange: widget.onLocaleChange,
//         sectionScores: sectionScores,
//       ),
//     ),
//   );
// }


// void _navigateToHome(Map<String, int> sectionScores) {
//   Navigator.pop(context, sectionScores);
// }
void _navigateBackWithScores(Map<String, int> sectionScores) {
  Navigator.pop(context, sectionScores);
}


  void _onOptionSelected(int optionIndex) {
    setState(() {
      final currentQuestion = questions[_currentIndex];
      final section = currentQuestion.sectionKey;

      // If an option was previously selected, subtract its score
      int? previousOption = _selectedOptions[_currentIndex];
      if (previousOption != null) {
        sectionScores[section] = (sectionScores[section] ?? 0) - (previousOption + 1);
      }

      // Save the new selection
      _selectedOptions[_currentIndex] = optionIndex;

      // Add the new score
      int score = optionIndex + 1;
      sectionScores[section] = (sectionScores[section] ?? 0) + score;
    });
  }



  void _goNext() {
    if (_currentIndex < questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _controller.nextPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      // _timer.cancel();
      // _navigateToHome(sectionScores);
      _navigateBackWithScores(sectionScores);

    }
  }

  void _goPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _controller.previousPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  // String _formatTime(int seconds) {
  //   final minutes = seconds ~/ 60;
  //   final remainingSeconds = seconds % 60;
  //   return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  // }

  @override
  void dispose() {
    // _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final question = questions[_currentIndex];
    final selectedOption = _selectedOptions[_currentIndex];

    final options = [localizations.optionA,localizations.optionB,localizations.optionC,localizations.optionD];
   


    

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(
          "🧠 Mental Health Quiz",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.appBarTheme.foregroundColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (_currentIndex + 1) / questions.length,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
                minHeight: 8,
              ),
              // SizedBox(height: 12),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Text(
              //     "Time Left: ${_formatTime(_timeLeft)}",
              //     style: TextStyle(
              //       color: theme.colorScheme.error,
              //       fontWeight: FontWeight.w600,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              Text(
                question.section,
                style: TextStyle(
                  fontSize: 18,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.secondary.withOpacity(0.5),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  question.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Options
              ...List.generate(options.length, (index) {
                final optionText = options[index];
                final isSelected = selectedOption == index;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ElevatedButton(
                    onPressed: () => _onOptionSelected(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.surface,
                      foregroundColor: isSelected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.primary,
                      side: BorderSide(color: theme.colorScheme.primary),
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: isSelected ? 6 : 2,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            optionText,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              Spacer(),

              // Previous & Next buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: _currentIndex > 0 ? _goPrevious : null,
                    icon: Icon(Icons.arrow_back),
                    label: Text("Previous"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentIndex > 0
                          ? theme.colorScheme.primary
                          : theme.colorScheme.primary.withOpacity(0.3),
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: selectedOption != null ? _goNext : null,
                    icon: Text(
                      _currentIndex == questions.length - 1 ? "Finish" : "Next",
                      style: TextStyle(fontSize: 16),
                    ),
                    label: Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOption != null
                          ? theme.colorScheme.primary
                          : theme.colorScheme.primary.withOpacity(0.3),
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
