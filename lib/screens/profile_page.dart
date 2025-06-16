import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const ProfilePage({super.key, required this.onLocaleChange});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  Map<String, dynamic>? userData;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists) {
      setState(() {
        userData = doc.data();
        ageController.text = userData?['age'] ?? '';
        professionController.text = userData?['profession'] ?? '';
        areaController.text = userData?['area'] ?? '';
        weightController.text = userData?['weight'] ?? '';
        heightController.text = userData?['height'] ?? '';
      });
    }
  }

  void _updateUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'age': ageController.text,
      'profession': professionController.text,
      'area': areaController.text,
      'weight': weightController.text,
      'height': heightController.text,
    });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('Profile updated successfully'),
      backgroundColor: Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
    ),
  );

    setState(() {
      isEditing = false;
    });
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final phone = FirebaseAuth.instance.currentUser?.phoneNumber ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.profileLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          if (userData != null && !isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => setState(() => isEditing = true),
            ),
        ],
      ),
body: userData == null
    ? const Center(child: CircularProgressIndicator())
    : SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Icon(Icons.person, size: 50, color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 16),
              Text(
                userData?['name'] ?? 'User',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              if (!isEditing) _buildProfileCard(theme, phone),
              if (isEditing) _buildEditForm(theme, phone),
              const SizedBox(height: 30),
              _buildLanguageSection(theme),
              const SizedBox(height: 30),
              Text(
                '“Take a deep breath.”',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildProfileCard(ThemeData theme, String phone) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primaryContainer),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow('📞 Phone:', phone),
          _infoRow('🎂 Age:', userData?['age'] ?? ''),
          _infoRow('🧑‍💼 Profession:', userData?['profession'] ?? ''),
          _infoRow('📍 Area:', userData?['area'] ?? ''),
          _infoRow('⚖️ Weight:', '${userData?['weight'] ?? ''} kg'),
          _infoRow('📏 Height:', '${userData?['height'] ?? ''} cm'),
        ],
      ),
    );
  }

  Widget _buildEditForm(ThemeData theme, String phone) {
    return Column(
      children: [
        _editableField(label: '📞 Phone:', value: phone, enabled: false),
        _editableField(label: '🎂 Age:', controller: ageController),
        _editableField(label: '🧑‍💼 Profession:', controller: professionController),
        _editableField(label: '📍 Area:', controller: areaController),
        _editableField(label: '⚖️ Weight (kg):', controller: weightController),
        _editableField(label: '📏 Height (cm):', controller: heightController),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _updateUserData,
          child: const Text('Save Changes'),
        ),
      ],
    );
  }

  Widget _editableField({required String label, TextEditingController? controller, String? value, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller ?? TextEditingController(text: value),
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🌐 Change Language', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _LanguageButton(locale: const Locale('en'), label: '🇺🇸 English', onLocaleChange: widget.onLocaleChange),
            _LanguageButton(locale: const Locale('hi'), label: '🇮🇳 हिंदी', onLocaleChange: widget.onLocaleChange),
            _LanguageButton(locale: const Locale('mr'), label: '🇮🇳 मराठी', onLocaleChange: widget.onLocaleChange),
            _LanguageButton(locale: const Locale('te'), label: '🇮🇳 తెలుగు', onLocaleChange: widget.onLocaleChange),
            _LanguageButton(locale: const Locale('bn'), label: '🇮🇳 বাংলা', onLocaleChange: widget.onLocaleChange),
          ],
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final Locale locale;
  final String label;
  final Function(Locale) onLocaleChange;

  const _LanguageButton({required this.locale, required this.label, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: () => onLocaleChange(locale),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: theme.colorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
