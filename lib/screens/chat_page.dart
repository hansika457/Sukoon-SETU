import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/quiz_screen.dart';

class ChatScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  final Map<String, int>? sectionScores;

  const ChatScreen({
    super.key,
    required this.onLocaleChange,
    this.sectionScores,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  String? apiKey;

  @override
  void initState() {
    super.initState();
    _loadApiKey();

    if (widget.sectionScores != null) {
      _injectScoreSummary(widget.sectionScores!);
    }
  }

  void _injectScoreSummary(Map<String, int> scores) {
    final summaries = <String>[];

    for (var entry in scores.entries) {
      final key = entry.key;
      final score = entry.value;

      switch (key) {
        case "Section A":
          if (score <= 9) {
            summaries.add(
              "🔹 **Section A: General Wellbeing (Sadness, Fatigue, Mood)**\n"
              "\nYou seem to be emotionally balanced at the moment. You are likely handling your emotions and day-to-day challenges well. "
              "Keep doing things you enjoy, like spending time with family, being in nature, or doing religious or cultural activities.",
            );
          } else if (score <= 14) {
            summaries.add(
              "🔹 **Section A: General Wellbeing (Sadness, Fatigue, Mood)**\n"
              "\nYou may be feeling low, tired, or less interested in daily life on some days. These are common feelings, especially when stressed or overworked. "
              "Talk to someone you trust — a friend, a family member, or a community elder — and take time for activities that make you feel better.",
            );
          } else {
            summaries.add(
              "🔹 **Section A: General Wellbeing (Sadness, Fatigue, Mood)**\n"
              "\nYour responses suggest you might be experiencing strong signs of emotional distress, such as sadness, tiredness, or hopelessness. "
              "These feelings can impact your daily life. It is important to consider speaking with a trained mental health professional. Help is available, and things can improve with support.",
            );
          }
          break;

        case "Section B":
          if (score <= 9) {
            summaries.add(
              "🔹 **Section B: Anxiety and Stress**\n"
              "\nYou appear to be handling stress well. You may have developed good ways to manage worry, like prayer, talking to others, or staying active. "
              "Continue maintaining a healthy routine.",
            );
          } else if (score <= 14) {
            summaries.add(
              "🔹 **Section B: Anxiety and Stress**\n"
              "\nYour responses show moderate stress or worry. This can happen due to family, money, or health concerns. "
              "Try to take small breaks, breathe deeply, and speak to someone. You don’t have to face it all alone.",
            );
          } else {
            summaries.add(
              "🔹 **Section B: Anxiety and Stress**\n"
              "\nYou seem to be feeling very anxious or tense, even when there is no clear reason. This can affect sleep, concentration, and relationships. "
              "Please consider talking to a counselor or a doctor. There are simple techniques and medicines that can help reduce these symptoms.",
            );
          }
          break;

        case "Section C":
          if (score <= 9) {
            summaries.add(
              "🔹 **Section C: Thought and Behavior Changes**\n"
              "\nYour thinking and behavior appear normal and stable. You are likely aware of yourself and your surroundings. "
              "Continue engaging in regular routines and keeping in touch with trusted people.",
            );
          } else if (score <= 14) {
            summaries.add(
              "🔹 **Section C: Thought and Behavior Changes**\n"
              "\nThere may be some unusual experiences or thoughts that make you feel different or confused. You may not feel like yourself sometimes. "
              "These signs should not be ignored. It may help to consult a doctor who can guide you gently.",
            );
          } else {
            summaries.add(
              "🔹 **Section C: Thought and Behavior Changes**\n"
              "\nYou might be facing serious mental health symptoms like hearing voices, memory gaps, or believing in things others don't understand. "
              "These experiences can be frightening. Please seek help from a trained mental health expert as soon as possible. Treatment can help you regain clarity and calm.",
            );
          }
          break;

        case "Section D":
          if (score <= 9) {
            summaries.add(
              "🔹 **Section D: Substance Use (Alcohol, Tobacco, Drugs)**\n"
              "\nYour use of alcohol, tobacco, or other substances seems to be in control or absent. This is a healthy sign. "
              "Continue with good habits and encourage others around you to do the same.",
            );
          } else if (score <= 14) {
            summaries.add(
              "🔹 **Section D: Substance Use (Alcohol, Tobacco, Drugs)**\n"
              "\nYou may be using substances more often than you should, or to manage stress. This can become risky over time. "
              "If family members are expressing concern, it's worth paying attention. Try cutting back or seeking early guidance before it becomes a bigger problem.",
            );
          } else {
            summaries.add(
              "🔹 **Section D: Substance Use (Alcohol, Tobacco, Drugs)**\n"
              "\nYour answers suggest a high risk of substance dependency. It may already be affecting your health, family life, or work. "
              "You are not alone — help is available. Speaking to a doctor or counselor can be the first step toward a healthier life.",
            );
          }
          break;

        case "Section E":
          if (score <= 9) {
            summaries.add(
              "🔹 **Section E: Social and Functional Impairment**\n"
              "\nYou seem to be functioning well in your family, work, and social life. "
              "Staying active and connected is very important for mental wellbeing. Keep it up.",
            );
          } else if (score <= 14) {
            summaries.add(
              "🔹 **Section E: Social and Functional Impairment**\n"
              "\nYou may be withdrawing from others or feeling less able to manage household or work tasks. "
              "These changes might be signs of emotional strain. Try to share your feelings with someone and seek support from trusted people.",
            );
          } else {
            summaries.add(
              "🔹 **Section E: Social and Functional Impairment**\n"
              "\nYour responses indicate significant difficulty in daily living — you may be feeling helpless, ashamed, or even thinking of harming yourself. "
              "These are serious concerns. Please talk to a mental health counselor immediately. You're not alone, and things can improve with the right care and support.",
            );
          }
          break;

        default:
          summaries.add(
            "🔸 *$key*\nYour score is $score. This section’s interpretation is currently unavailable. Please consult a mental health expert if needed.",
          );
      }
    }

    if (summaries.isNotEmpty) {
      setState(() {
        messages.add({
          'role': 'assistant',
          'content': summaries.join('\n\n---\n\n'),
        });
      });
    }
  }

  Future<void> _loadApiKey() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
      ),
    );

    await remoteConfig.fetchAndActivate();
    setState(() {
      apiKey = remoteConfig.getString('openrouter_api_key');
    });
  }

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty || apiKey == null) return;

    setState(() {
      messages.add({'role': 'user', 'content': content});
      _controller.clear();
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "deepseek/deepseek-chat",
          "messages": [
            for (var msg in messages)
              {"role": msg['role'], "content": msg['content']},
          ],
        }),
      );

      final data = jsonDecode(response.body);
      final botReply = data["choices"][0]["message"]["content"];

      setState(() {
        messages.add({'role': 'assistant', 'content': botReply});
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        messages.add({
          'role': 'assistant',
          'content': '❌ Failed to fetch response. Check API key or network.',
        });
      });
    }
  }

  void resetChat() {
    setState(() {
      messages.clear();
    });
  }

  final userInfo = UserInfo(
    name: '',
    age: 0,
    gender: '',
    profession: '',
    area: '',
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final localizations = AppLocalizations.of(context)!;

    if (apiKey == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Sukoon Sathi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetChat,
            tooltip: "Reset Chat",
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: colorScheme.secondary
                                  .withOpacity(0.2),
                              child: Icon(
                                Icons.android,
                                color: colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Namaste, how can I help you today?',
                                    style: textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Not sure what to ask? ',
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurface
                                            .withOpacity(0.6),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Take the quiz',
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: colorScheme.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              final sectionScores =
                                                  await Navigator.of(
                                                    context,
                                                  ).push<Map<String, int>>(
                                                    MaterialPageRoute(
                                                      builder: (_) => QuizScreen(
                                                        userInfo: userInfo,
                                                        onLocaleChange: widget
                                                            .onLocaleChange,
                                                      ),
                                                    ),
                                                  );

                                              if (sectionScores != null) {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) => ChatScreen(
                                                      onLocaleChange:
                                                          widget.onLocaleChange,
                                                      sectionScores:
                                                          sectionScores,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isUser = message['role'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser
                                ? colorScheme.primary.withOpacity(0.1)
                                : colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: MarkdownBody(
                            data: message['content'] ?? '',
                            styleSheet:
                                MarkdownStyleSheet.fromTheme(
                                  Theme.of(context),
                                ).copyWith(
                                  h3: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                  p: TextStyle(
                                    fontSize: 14,
                                    color: colorScheme.onSurface,
                                  ),
                                  listBullet: TextStyle(
                                    color: colorScheme.primary,
                                  ),
                                ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Input Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: sendMessage,
                    decoration: InputDecoration(
                      hintText: 'Message SukoonSathi...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _isLoading
                    ? const CircularProgressIndicator()
                    : IconButton(
                        icon: Icon(
                          Icons.send_rounded,
                          color: colorScheme.primary,
                        ),
                        onPressed: () {
                          sendMessage(_controller.text);
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
