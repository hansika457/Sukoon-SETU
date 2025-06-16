import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';

class UnderstandCommonConditions extends StatelessWidget {
  final Function(Locale)? onLocaleSelected;

  UnderstandCommonConditions({super.key, this.onLocaleSelected});



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = Localizations.of(context, AppLocalizations);

    final List<Map<String, dynamic>> conditions = [
      {'title': 'Diabetes', 'icon': "assets/images/understand_common_diseases_icon_images/diabetes.jpg", 'color': theme.colorScheme.background},
      {'title': 'Blood Pressure', 'icon': "assets/images/understand_common_diseases_icon_images/bp.jpg", 'color': Color(0xFFE3F2FD)},
      {'title': 'Asthma', 'icon': "assets/images/understand_common_diseases_icon_images/asthsma.jpg", 'color': Color(0xFFE8F5E9)},
      {'title': 'Anemia', 'icon': "assets/images/understand_common_diseases_icon_images/anemia.jpg", 'color': Color(0xFFFFF3E0)},
      {'title': 'Arthritis', 'icon': "assets/images/understand_common_diseases_icon_images/arthritis.jpg", 'color': Color(0xFFF3E5F5)},
      {'title': 'Migraine', 'icon': "assets/images/understand_common_diseases_icon_images/migrane.jpg", 'color': Color(0xFFFFFDE7)},
      {'title': 'Thyroid Disorders', 'icon': "assets/images/understand_common_diseases_icon_images/thyroid.jpg", 'color': Color(0xFFE0F2F1)},
      {'title': 'PCOS/PCOD', 'icon': "assets/images/understand_common_diseases_icon_images/PCOS.jpg", 'color': Color(0xFFEDE7F6)},
      {'title': 'Anxiety', 'icon': "assets/images/understand_common_diseases_icon_images/anxiety.jpg", 'color': Color(0xFFE1F5FE)},
      {'title': 'Depression', 'icon': "assets/images/understand_common_diseases_icon_images/depression.jpg", 'color': Color(0xFFFFF9C4)},
      {'title': 'Insomnia', 'icon': "assets/images/understand_common_diseases_icon_images/insomnia.jpg", 'color': Color(0xFFF1F8E9)},
      {'title': 'Eating Disorders', 'icon': "assets/images/understand_common_diseases_icon_images/eating disorders.jpg", 'color': Color(0xFFECEFF1)},
      {'title': 'Stress and Burnout', 'icon': "assets/images/understand_common_diseases_icon_images/stress and burnout.jpg", 'color': Color(0xFFFBE9E7)},
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          localizations.commonMentalHealth,
          style: TextStyle(
            color: theme.appBarTheme.foregroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: conditions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            final item = conditions[index];
            return ConditionCard(
              title: item['title'],
              icon: item['icon'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConditionDetailPage(title: item['title']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


class ConditionCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const ConditionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: theme.colorScheme.primary,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
              backgroundImage: AssetImage(icon),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ConditionDetailPage extends StatelessWidget {
  final Function(Locale)? onLocaleSelected;
  final String title;

  ConditionDetailPage({Key? key, required this.title, this.onLocaleSelected}) : super(key: key);

  

String getConditionDetails(String title, BuildContext context) {
  final localizations = AppLocalizations.of(context)!;
  switch (title) {
    case 'Diabetes':
      return localizations.diabetes;
    case 'Blood Pressure':
      return localizations.bloodPressure;

    case 'Asthma':
      return localizations.asthma;

    case 'Anemia':
      return localizations.anaemia;

    case 'Arthritis':
      return localizations.arthritis;

    case 'Migraine':
      return localizations.migrane;

    case 'Thyroid Disorders':
      return localizations.thyroid;

    case 'PCOS/PCOD':
      return localizations.pCOSPCOD;

    case 'Anxiety':
      return localizations.anxiety;

    case 'Depression':
      return localizations.depression;

    case 'Insomnia':
      return localizations.insomnia;

    case 'Eating Disorders':
      return localizations.eatingDisorders;

    case 'Stress and Burnout':
      return localizations.stressAndBurnout;

    default:
      return 'Details for $title will be added soon.';
  }
}


  @override
  Widget build(BuildContext context) {
    final content = getConditionDetails(title,context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: Text(content)),
      ),
    );
  }
}
