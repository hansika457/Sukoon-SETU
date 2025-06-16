import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/screens/home_page.dart';

class PersonalInfoScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const PersonalInfoScreen({super.key, required this.onLocaleChange});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String? selectedGender;

  InputDecoration customInputDecoration(String label, String hint) {
    final theme = Theme.of(context);
    return InputDecoration(
      labelText: label,
      hintText: hint,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(color: theme.hintColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      filled: true,
      fillColor: theme.colorScheme.surface,
    );
  }


    bool _isLoading = false;


  Future<void> _submitUserInfo() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;

    setState(() => _isLoading = true);

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': nameController.text.trim(),
      'age': ageController.text.trim(),
      'profession': professionController.text.trim(),
      'area': areaController.text.trim(),
      'weight': weightController.text.trim(),
      'height': heightController.text.trim(),
      'phone': FirebaseAuth.instance.currentUser?.phoneNumber,
      'createdAt': FieldValue.serverTimestamp(),
    });

    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  HomeScreen(onLocaleChange: widget.onLocaleChange,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    final genders = [
      localizations.genderMale,
      localizations.genderFemale,
      localizations.genderOther,
    ];

    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          localizations.personalInfoTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            // ignore: deprecated_member_use
            color: theme.colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
        // ignore: deprecated_member_use
        backgroundColor: theme.colorScheme.background,
        // ignore: deprecated_member_use
        foregroundColor: theme.colorScheme.onBackground,
        elevation: 0,
        // ignore: deprecated_member_use
        leading: BackButton(color: theme.colorScheme.onBackground),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Icon(Icons.person_outline, size: 60, color: theme.colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                localizations.tellUsAboutYou,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                localizations.helpUsServeBetter,
                style: theme.textTheme.bodyMedium?.copyWith(
                  // ignore: deprecated_member_use
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 24),

              // Name
              TextFormField(
                controller: nameController,
                decoration: customInputDecoration(localizations.nameLabel, localizations.nameHint),
                validator: (value) => value!.isEmpty ? localizations.nameError : null,
              ),
              const SizedBox(height: 16),

              // Age + Gender
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration(localizations.ageLabel, localizations.ageHint),
                      validator: (value) => value!.isEmpty ? localizations.ageError : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: customInputDecoration(localizations.genderLabel, localizations.genderHint),
                      value: selectedGender,
                      items: genders.map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      )).toList(),
                      onChanged: (value) => setState(() => selectedGender = value),
                      validator: (value) => value == null ? localizations.genderError : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Profession
              TextFormField(
                controller: professionController,
                decoration: customInputDecoration(localizations.professionLabel, localizations.professionHint),
                validator: (value) => value!.isEmpty ? localizations.professionError : null,
              ),
              const SizedBox(height: 16),

              // Area
              TextFormField(
                controller: areaController,
                decoration: customInputDecoration(localizations.areaLabel, localizations.areaHint),
                validator: (value) => value!.isEmpty ? localizations.areaError : null,
              ),
              const SizedBox(height: 16),

              // Weight + Height
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration(localizations.weightLabel, localizations.weightHint),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration(localizations.heightLabel, localizations.heightHint),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitUserInfo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading ? const CircularProgressIndicator() : Text(
                    localizations.ccontinue,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
