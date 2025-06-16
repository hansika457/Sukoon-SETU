import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
    Locale('te')
  ];

  /// No description provided for @ccontinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get ccontinue;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfoTitle;

  /// No description provided for @tellUsAboutYou.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get tellUsAboutYou;

  /// No description provided for @helpUsServeBetter.
  ///
  /// In en, this message translates to:
  /// **'Your info helps us serve you better'**
  String get helpUsServeBetter;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguage;

  /// No description provided for @loginWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Login with Phone'**
  String get loginWithPhone;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhone;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'OTP has been sent to'**
  String get otpSentTo;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help? Contact support.'**
  String get needHelp;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @languageServicePrompt.
  ///
  /// In en, this message translates to:
  /// **'In which language would you like the service?'**
  String get languageServicePrompt;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get nameLabel;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHint;

  /// No description provided for @nameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameError;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age *'**
  String get ageLabel;

  /// No description provided for @ageHint.
  ///
  /// In en, this message translates to:
  /// **'25'**
  String get ageHint;

  /// No description provided for @ageError.
  ///
  /// In en, this message translates to:
  /// **'Please enter age'**
  String get ageError;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender *'**
  String get genderLabel;

  /// No description provided for @genderHint.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get genderHint;

  /// No description provided for @genderError.
  ///
  /// In en, this message translates to:
  /// **'Please select gender'**
  String get genderError;

  /// No description provided for @professionLabel.
  ///
  /// In en, this message translates to:
  /// **'Profession *'**
  String get professionLabel;

  /// No description provided for @professionHint.
  ///
  /// In en, this message translates to:
  /// **'Your work'**
  String get professionHint;

  /// No description provided for @professionError.
  ///
  /// In en, this message translates to:
  /// **'Please enter profession'**
  String get professionError;

  /// No description provided for @areaLabel.
  ///
  /// In en, this message translates to:
  /// **'Area *'**
  String get areaLabel;

  /// No description provided for @areaHint.
  ///
  /// In en, this message translates to:
  /// **'City/Village name'**
  String get areaHint;

  /// No description provided for @areaError.
  ///
  /// In en, this message translates to:
  /// **'Please enter area'**
  String get areaError;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightLabel;

  /// No description provided for @weightHint.
  ///
  /// In en, this message translates to:
  /// **'60'**
  String get weightHint;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get heightLabel;

  /// No description provided for @heightHint.
  ///
  /// In en, this message translates to:
  /// **'170'**
  String get heightHint;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello! 👋'**
  String get greeting;

  /// No description provided for @howWasYourDay.
  ///
  /// In en, this message translates to:
  /// **'How was your day today?'**
  String get howWasYourDay;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @adviceFromSetu.
  ///
  /// In en, this message translates to:
  /// **'Advice from Setu'**
  String get adviceFromSetu;

  /// No description provided for @audioBooksStories.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks/Stories'**
  String get audioBooksStories;

  /// No description provided for @commonMentalHealth.
  ///
  /// In en, this message translates to:
  /// **'Understand Common Conditions'**
  String get commonMentalHealth;

  /// No description provided for @thought.
  ///
  /// In en, this message translates to:
  /// **'Thought of the Day'**
  String get thought;

  /// No description provided for @deepBreathTip.
  ///
  /// In en, this message translates to:
  /// **'Take a deep breath\n5 minutes of practice reduces stress and calms the mind.'**
  String get deepBreathTip;

  /// No description provided for @doItNow.
  ///
  /// In en, this message translates to:
  /// **'Do it now'**
  String get doItNow;

  /// No description provided for @homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// No description provided for @adviceLabel.
  ///
  /// In en, this message translates to:
  /// **'Advice'**
  String get adviceLabel;

  /// No description provided for @booksLabel.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get booksLabel;

  /// No description provided for @profileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// No description provided for @thoughtOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Even the smallest step toward healing counts — walk gently but keep walking.'**
  String get thoughtOfTheDay;

  /// No description provided for @breathingTechniques.
  ///
  /// In en, this message translates to:
  /// **'Breathing Techniques'**
  String get breathingTechniques;

  /// No description provided for @audioBook1.
  ///
  /// In en, this message translates to:
  /// **'Life-Changing Motivational Stories'**
  String get audioBook1;

  /// No description provided for @audioBook2.
  ///
  /// In en, this message translates to:
  /// **'Rural India and Mental Health'**
  String get audioBook2;

  /// No description provided for @audioBook1Link.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?v=wsNW00J-IIQ'**
  String get audioBook1Link;

  /// No description provided for @audioBook2Link.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?v=EiOzFwjFZhQ'**
  String get audioBook2Link;

  /// No description provided for @yogaLink.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?pp=0gcJCdgAo7VqN5tD&v=W-e55pc4ZSk'**
  String get yogaLink;

  /// No description provided for @meditationLink.
  ///
  /// In en, this message translates to:
  /// **'https://www.youtube.com/watch?pp=0gcJCdgAo7VqN5tD&v=JuIeF8CMU5k'**
  String get meditationLink;

  /// No description provided for @breathingAnxietyWorry.
  ///
  /// In en, this message translates to:
  /// **'Inhale through your nose for 4 seconds\nHold for 7 seconds\nExhale slowly through your mouth for 8 seconds\nRepeat 4 cycles'**
  String get breathingAnxietyWorry;

  /// No description provided for @breathingAnger.
  ///
  /// In en, this message translates to:
  /// **'Inhale deeply through your nose\nExhale making a soft “hmmm” sound\nFocus on the vibration\nRepeat 5 to 10 times'**
  String get breathingAnger;

  /// No description provided for @breathingStressIrritation.
  ///
  /// In en, this message translates to:
  /// **'Close your right nostril with your thumb, inhale through the left\nClose your left nostril, open the right and exhale\nInhale through the right, close it, exhale through the left\nRepeat for 2 to 5 minutes'**
  String get breathingStressIrritation;

  /// No description provided for @breathingSadness.
  ///
  /// In en, this message translates to:
  /// **'Sit or lie with one hand on your belly\nInhale slowly through your nose, feel your belly rise\nExhale through your mouth, feel your belly fall\nRepeat for 3 to 5 minutes'**
  String get breathingSadness;

  /// No description provided for @breathingCalming.
  ///
  /// In en, this message translates to:
  /// **'Inhale through your nose for 4 seconds\nHold for 1 second\nExhale through your mouth for 4 seconds\nPause for 1 second\nRepeat 5 to 10 times'**
  String get breathingCalming;

  /// No description provided for @aboutUsContent.
  ///
  /// In en, this message translates to:
  /// **'Sukoon SETU is a simple, multilingual mental wellness app created especially for India’s underserved and rural communities. With tools rooted in science and culture, we offer breathing techniques, yoga, sound therapy, guided meditation, and mental health audiobooks — all crafted to help you regulate emotions and build inner calm.\nOur intelligent chatbot, SukoonSaathi, answers sensitive mental health questions with compassion and accuracy, using verified knowledge from Indian medical experts and WHO. You can also explore common mental health conditions in easy language, take a quiz to understand your emotional state, or receive a thoughtful reminder with our “Thought of the Day.”\nAccessible in Hindi, English, Marathi, Bengali, and Telugu, Sukoon SETU is your quiet companion on the journey to emotional well-being — because everyone deserves peace of mind.'**
  String get aboutUsContent;

  /// No description provided for @quizSectionAQuestion1.
  ///
  /// In en, this message translates to:
  /// **'Do you often feel sad, empty, or hopeless?'**
  String get quizSectionAQuestion1;

  /// No description provided for @quizSectionAQuestion2.
  ///
  /// In en, this message translates to:
  /// **'Have you lost interest or joy in things you once enjoyed (e.g., farming, chatting, festivals)?'**
  String get quizSectionAQuestion2;

  /// No description provided for @quizSectionAQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Do you feel tired or lack energy most days?'**
  String get quizSectionAQuestion3;

  /// No description provided for @quizSectionAQuestion4.
  ///
  /// In en, this message translates to:
  /// **'Do you have trouble sleeping, or sleep too much?'**
  String get quizSectionAQuestion4;

  /// No description provided for @quizSectionAQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Do you feel restless, angry, or irritable for no reason?'**
  String get quizSectionAQuestion5;

  /// No description provided for @quizSectionBQuestion1.
  ///
  /// In en, this message translates to:
  /// **'Do you worry too much about daily things (money, health, children)?'**
  String get quizSectionBQuestion1;

  /// No description provided for @quizSectionBQuestion2.
  ///
  /// In en, this message translates to:
  /// **'Do you feel nervous, fearful, or tense, even when there is no clear danger?'**
  String get quizSectionBQuestion2;

  /// No description provided for @quizSectionBQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Do you have fast heartbeat, sweating, or shaking when anxious?'**
  String get quizSectionBQuestion3;

  /// No description provided for @quizSectionBQuestion4.
  ///
  /// In en, this message translates to:
  /// **'Do you have trouble concentrating due to worry or fear?'**
  String get quizSectionBQuestion4;

  /// No description provided for @quizSectionBQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Do you often feel something bad is going to happen, even without a reason?'**
  String get quizSectionBQuestion5;

  /// No description provided for @quizSectionCQuestion1.
  ///
  /// In en, this message translates to:
  /// **'Do you sometimes hear voices or see things others do not?'**
  String get quizSectionCQuestion1;

  /// No description provided for @quizSectionCQuestion2.
  ///
  /// In en, this message translates to:
  /// **'Do you believe that others are watching or trying to harm you?'**
  String get quizSectionCQuestion2;

  /// No description provided for @quizSectionCQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Do you talk to yourself or act in a way that others find strange or confusing?'**
  String get quizSectionCQuestion3;

  /// No description provided for @quizSectionCQuestion4.
  ///
  /// In en, this message translates to:
  /// **'Have you ever forgotten what you did for long periods of time?'**
  String get quizSectionCQuestion4;

  /// No description provided for @quizSectionCQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Do you feel like you are not yourself, or as if you are watching your own life?'**
  String get quizSectionCQuestion5;

  /// No description provided for @quizSectionDQuestion1.
  ///
  /// In en, this message translates to:
  /// **'Do you drink alcohol or take tobacco/drugs regularly?'**
  String get quizSectionDQuestion1;

  /// No description provided for @quizSectionDQuestion2.
  ///
  /// In en, this message translates to:
  /// **'Do you feel you cannot stop using alcohol/drugs even if you try?'**
  String get quizSectionDQuestion2;

  /// No description provided for @quizSectionDQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Has alcohol or drug use caused problems at home, work, or in health?'**
  String get quizSectionDQuestion3;

  /// No description provided for @quizSectionDQuestion4.
  ///
  /// In en, this message translates to:
  /// **'Do you use substances to feel better when you\'re sad or anxious?'**
  String get quizSectionDQuestion4;

  /// No description provided for @quizSectionDQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Have people asked you to cut down on drinking or drug use?'**
  String get quizSectionDQuestion5;

  /// No description provided for @quizSectionEQuestion1.
  ///
  /// In en, this message translates to:
  /// **'Have you been avoiding people or staying alone more than before?'**
  String get quizSectionEQuestion1;

  /// No description provided for @quizSectionEQuestion2.
  ///
  /// In en, this message translates to:
  /// **'Are you able to work properly or manage household responsibilities?'**
  String get quizSectionEQuestion2;

  /// No description provided for @quizSectionEQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Do you feel ashamed, useless, or like a burden to others?'**
  String get quizSectionEQuestion3;

  /// No description provided for @quizSectionEQuestion4.
  ///
  /// In en, this message translates to:
  /// **'Have you ever thought about harming yourself or ending your life?'**
  String get quizSectionEQuestion4;

  /// No description provided for @quizSectionEQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Do you feel there is no reason to live? '**
  String get quizSectionEQuestion5;

  /// No description provided for @diabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes\n\n🩺 Diabetes is a long-term condition where sugar stays in your blood instead of going into your cells for energy, due to lack of insulin or poor insulin use. High sugar levels over time can damage the heart, kidneys, eyes, and nerves.\n⚠️ Common symptoms include:\n\n feeling very thirsty,\n frequent urination (especially at night),\n constant tiredness,\n blurry vision,\n sudden weight loss,\n slow-healing wounds,\n numbness or tingling in hands or feet.\n✅ What you can do:\n\n🍽️ Eat smarter\n avoid sweets and soft drinks,\n eat more vegetables,\n fruits,\n and whole grains,\n limit fried food,\n eat meals on time.\n🏃 Stay active\n walk or move at least 30 minutes daily,\n even household work helps,\nLose some weight—just 5–10% weight loss can improve sugar control.\n🧪 Get tested—especially if you\'re 35+, overweight, or have a family history.\n🚭 Avoid smoking,\n alcohol,\n sugary drinks(choose water buttermilkor unsweetened tea.),\n🧘‍♀️ Take care of your mental health—diabetes can be stressful, so talk to someone and try to stay calm, as stress also raises blood sugar.\n📌 See a doctor if you notice symptoms like blurry vision, tiredness, frequent urination, slow-healing wounds, or numbness—even if you feel okay.'**
  String get diabetes;

  /// No description provided for @bloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure\n\n🫀 What is Blood Pressure (BP)?\n• BP is the force of blood pushing against artery walls when the heart pumps.\n• High BP (hypertension) happens when this pressure stays high for too long.\n• It often has no symptoms but can damage heart, kidneys, brain, and eyes over time.\n⚠️ Common Symptoms (Sometimes Felt)\n\n• 🧠 Morning headaches or pain at the back of the head.\n• 🤯 Dizziness or feeling lightheaded.\n• 👀 Blurred or double vision.\n• ❤️ Fast or pounding heartbeat (palpitations).\n• 😴 Extreme tiredness or confusion in severe cases.\n📈 How Is BP Measured?\n\n• Normal: Less than 120/80 mmHg\n• Elevated: 120–129 / less than 80\n• High (Stage 1): 130–139 / 80–89\n• High (Stage 2): 140+ / 90+\n• Hypertensive Crisis: 180+ / 120+ (Seek immediate help)\n✅ What You Can Do (Precautions and Home Care)\n\n🥦 Eat Mindfully\n• Use less salt in cooking; avoid salty snacks like chips, pickles, papads.\n• Eat fruits and vegetables—like bananas, tomatoes, leafy greens.\n• Avoid fried, oily, and junk food.\n• Eat small, regular meals—don’t overeat.\n🏃 Move More\n• Walk daily for at least 30 minutes.\n• Try yoga or deep breathing (like anulom-vilom).\n• Avoid long sitting—stand or stretch hourly.\n⚖️ Maintain Healthy Weight\n• Losing a few kilos can lower BP.\n• Obesity is closely linked to high BP.\n🧂 Control Salt and Water Retention\n• Use rock salt or low-sodium salt if advised.\n• Avoid processed foods—they often hide extra salt.\n📵 Avoid Harmful Habits\n• 🚬 Quit smoking—it raises BP and harms vessels.\n• 🍺 Limit alcohol—it can spike BP.\n• ☕ Cut back on caffeine if sensitive to tea/coffee.\n🧘‍♀️ Manage Stress\n• Chronic stress increases BP—relax with:\n o Deep breathing\n o Meditation or prayer\n o Nature walks, music, or chatting with friends\n🩺 Monitor & Get Checked\n• Check BP regularly if you’re over 30, overweight, or have family history.\n• Keep records—home BP machines help.\n• Don’t stop medicine without consulting a doctor.\n\n🔔 When to See a Doctor\n• If BP is consistently above 140/90 mmHg.\n• If you have chest pain, breathlessness, or sudden vision issues.\n• If you’ve had a stroke or heart problem before.\n'**
  String get bloodPressure;

  /// No description provided for @asthma.
  ///
  /// In en, this message translates to:
  /// **'Asthma\n\n🫁 What is Asthma?\n• A long-term condition that narrows and inflames your airways, making it hard to breathe.\n• It’s triggered by dust, pollution, smoke, cold air, exercise, or emotional stress.\n• It is not contagious and can be managed with proper care.\n⚠️ Common Symptoms\n\n• Trouble breathing, especially during activity or at night.\n• Wheezing — a whistling sound while exhaling.\n• Chest tightness — like something heavy on your chest.\n• Frequent coughing, especially in the morning or at night.\n• Shortness of breath even after light tasks.\n✅ What You Can Do at Home\n\n• Keep your home clean and dust-free — mop instead of sweeping.\n• Avoid strong smells like incense, perfumes, or cleaning sprays.\n• Always carry and use your inhaler if prescribed — don’t skip doses.\n• Wear a mask when cleaning or in polluted areas.\n• Practice breathing exercises like Anulom-Vilom or pursed-lip breathing.\n• Use steam inhalation occasionally to ease tightness.\n📌 When to See a Doctor\n• If you need your inhaler more than usual.\n• If symptoms disturb sleep or make it hard to talk or walk.\n• If lips or face turn blue — get emergency help immediately.\n❓ Common Questions\n\n• “Can I play sports with asthma?” → Yes, with proper treatment and warm-up.\n• “Is asthma lifelong?” → Often, but it can be controlled with care.\n• “Can adults get asthma?” → Yes, adult-onset asthma is common.\n'**
  String get asthma;

  /// No description provided for @anaemia.
  ///
  /// In en, this message translates to:
  /// **'Anaemia\n\n🩸 What is Anaemia?\n• It occurs when your body doesn’t have enough red blood cells or hemoglobin to carry oxygen.\n• Low oxygen makes you feel tired, weak, or dizzy.\n• It’s common in women (especially during pregnancy or heavy periods), children, and the elderly.\n\n⚠️ Common Symptoms\n\n• Constant tiredness even after resting.\n• Dizziness or lightheadedness when standing.\n• Pale skin, lips, or tongue.\n• Breathlessness while walking or climbing stairs.\n• Headaches, poor focus, cold hands and feet.\n\n🧠 Why Does it Happen?\n• Low intake of iron-rich foods like leafy greens, meat, or lentils.\n• Heavy periods or pregnancy-related iron loss.\n• Poor nutrient absorption due to stomach issues.\n• Internal bleeding or long-term illnesses.\n\n✅ What You Can Do\n\n• Eat more iron-rich foods like spinach, beetroot, jaggery, raisins, meat, eggs, fish, and beans.\n• Include Vitamin C foods like lemon or oranges with meals for better iron absorption.\n• Avoid tea or coffee right after meals — they block iron absorption.\n• Use iron cookware — it can add a small amount of iron to food.\n• Take iron tablets if prescribed by a doctor.\n\n📌 When to Seek Medical Help\n\n• If tiredness doesn’t improve with rest or diet.\n• If you\'re pregnant or recently gave birth.\n• If you feel very weak or faint often.\n❓ Common Questions\n\n• “Is anemia dangerous?” → Not usually, but untreated it can cause severe fatigue and other issues.\n• “Can food alone cure it?” → Mild cases can improve with diet; severe cases may need supplements.\n• “How long to recover?” → With proper care, usually within weeks to a few months.\n'**
  String get anaemia;

  /// No description provided for @arthritis.
  ///
  /// In en, this message translates to:
  /// **'Arthritis\n\n🦴 What is Arthritis?\n• Arthritis means swelling and inflammation in joints like knees, fingers, elbows, or back.\n• It causes joint pain and stiffness, making movement difficult.\n• Types include osteoarthritis (age-related), rheumatoid arthritis (autoimmune), and others.\n• Common in older adults but can affect younger people too.\n\n⚠️ Common Symptoms\n• Joint pain — especially after rest or in the morning.\n• Swelling around joints, often warm to touch.\n• Difficulty bending, stretching, or doing daily tasks.\n• Grinding or clicking sounds in joints during movement.\n• Weak grip or trouble holding things.\n\n🧠 Why It Happens?\n• Wear and tear due to aging or overuse of joints.\n• Autoimmune issues where the body attacks its own joints.\n• Obesity increases pressure on knees and hips.\n• Previous injuries or joint infections.\n\n✅ What You Can Do\n• Stay active — walking, yoga, and swimming keep joints flexible.\n• Use warm compresses or heating pads to ease pain.\n• Lose excess weight to reduce joint pressure.\n• Eat anti-inflammatory foods like turmeric milk, omega-3s, fruits, and vegetables.\n• Use proper footwear and helpful tools for daily work.\n• Talk to a doctor about calcium and vitamin D supplements.\n\n📌 When to Visit a Doctor\n• If joint pain and stiffness continue for weeks.\n• If there is swelling, redness, or limited joint movement.\n• If morning stiffness lasts more than 30 minutes daily.\n'**
  String get arthritis;

  /// No description provided for @migrane.
  ///
  /// In en, this message translates to:
  /// **'Migraine\n\n🧠 What is a Migraine?\n• A migraine is a throbbing headache, usually on one side of the head, lasting for hours or even days.\n• It often comes with nausea, sensitivity to light, sound, or smell, and extreme tiredness.\n\n⚠️ Symptoms\n• Pulsating pain on one side of the head.\n• Nausea or sometimes vomiting.\n• Sensitivity to bright light, loud sounds, or strong smells.\n• Visual issues like flashes of light or blurry vision (aura).\n• Feeling exhausted even after the headache ends.\n\n🚫 Triggers to Watch\n• Stress, irregular sleep, or skipping meals.\n• Bright lights, loud noises, or strong smells.\n• Hormonal changes (more common in women).\n• Dehydration or fasting.\n• Trigger foods like chocolate, cheese, and processed meats.\n\n✅ Relief and Prevention\n• Rest in a dark, quiet room during an episode.\n• Apply a cold pack or cloth to your forehead.\n• Keep a diary to track and avoid your triggers.\n• Eat on time and drink enough water.\n• Practice relaxation, deep breathing, or meditation regularly.\n'**
  String get migrane;

  /// No description provided for @thyroid.
  ///
  /// In en, this message translates to:
  /// **'Thyroid Problems (Hypothyroidism & Hyperthyroidism)\n\n🧠 What is Thyroid?\n• The thyroid is a small gland in your neck that controls energy and metabolism.\n• Too little thyroid hormone = hypothyroidism (slow body function).\n• Too much hormone = hyperthyroidism (overactive body function).\n\n⚠️ Hypothyroidism Symptoms (More Common in Women)\n• Constant tiredness or sleepiness.\n• Weight gain even with little eating.\n• Cold hands and feet.\n• Hair fall or dry, rough skin.\n• Irregular or heavy menstrual periods.\n• Feeling low, sad, or depressed.\n\n⚠️ Hyperthyroidism Symptoms\n• Weight loss despite normal eating.\n• Feeling anxious or nervous.\n• Shaking hands or rapid heartbeat.\n• Excess sweating or feeling too hot.\n• Difficulty sleeping or mood changes.\n\n✅ Daily Care\n• Get regular blood tests (TSH, T3, T4) to monitor thyroid levels.\n• Take prescribed medicines daily—usually required for life.\n• Eat a healthy, balanced diet; avoid too much soy or raw cabbage.\n• Manage stress through yoga, meditation, or deep breathing.\n'**
  String get thyroid;

  /// No description provided for @pCOSPCOD.
  ///
  /// In en, this message translates to:
  /// **'Understanding PCOS and PCOD\n\n👩‍⚕️ What are PCOS and PCOD?\n• PCOD and PCOS are hormonal conditions affecting how a woman’s ovaries function.\n• They cause irregular periods, hormone imbalance, and sometimes small cysts in the ovaries.\n• PCOS is usually more severe and linked with metabolism and insulin resistance.\n\n📊 How Common Is It?\n• Around 1 in 5 women in India may have it during reproductive years (15–45).\n• Many women don’t realize they have it until issues like weight gain or fertility problems appear.\n\n⚠️ Common Symptoms\n• Irregular or missed periods — periods may come rarely or be too heavy.\n• Weight gain, especially around the stomach — hard to lose even with diet.\n• Extra hair growth on face, chest, or stomach (hirsutism).\n• Hair thinning or hair fall from the scalp.\n• Oily skin and acne, often around the jaw or cheeks.\n• Mood swings, anxiety, or depression.\n• Difficulty getting pregnant due to ovulation issues.\n\n🧠 Why Does It Happen?\n• The body produces more male hormones (androgens), which disrupt ovulation.\n• PCOS often includes insulin resistance, leading to weight gain or prediabetes.\n\n🩺 How Is It Diagnosed?\n• Based on symptoms, hormone blood tests, and pelvic ultrasound.\n• Doctors also check thyroid and sugar levels to rule out other causes.\n\n🔄 Can It Be Cured?\n• There is no permanent cure, but it can be managed with lifestyle and sometimes medicine.\n• With proper care, most women lead normal and healthy lives.\n\n✅ What Can You Do?\n🌿 Daily Lifestyle Changes:\n• Eat balanced meals — more veggies, fruits, whole grains; reduce sugar and fried food.\n• Exercise regularly — walk, dance, or do yoga for 30 minutes, 4–5 times a week.\n• Manage stress — try deep breathing, meditation, or journaling.\n• Track periods using a calendar or app.\n• Sleep 7–8 hours daily to support hormone health.\n\n💬 You’re not alone — millions of women have this, even if it’s not talked about openly.\n• It’s okay to feel confused or upset, but help is available.\n• Small daily changes can make a big difference — you deserve care and understanding.\n'**
  String get pCOSPCOD;

  /// No description provided for @anxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety (Generalized Anxiety Disorder)\n\n🧠 What Is It?\n• Anxiety is a constant feeling of worry or fear, even when there’s no clear reason.\n• It becomes a disorder when worry happens almost daily and affects your ability to live normally.\n\n⚠️ Symptoms\n• Feeling nervous or tense all the time, even over small issues.\n• Fast heartbeat, sweating, or shaky hands when stressed.\n• Constant “what if” thoughts — fearing bad things without reason.\n• Trouble focusing because the mind feels restless.\n• Feeling tired due to poor sleep or being on high alert always.\n\n🔍 Common Causes\n• Long-term stress at work, school, or home.\n• Past trauma or painful memories.\n• Family history of anxiety or related conditions.\n• Use of caffeine, alcohol, or certain substances.\n\n✅ What You Can Do\n• Practice deep breathing — inhale for 4 seconds, hold for 4, exhale slowly for 4.\n• Do light exercise like walking, yoga, or dancing.\n• Talk to someone — friend, family, or counselor.\n• Limit social media and avoid news or content that triggers anxiety.\n• Avoid excess tea, coffee, or energy drinks — they can worsen symptoms.\n'**
  String get anxiety;

  /// No description provided for @depression.
  ///
  /// In en, this message translates to:
  /// **'Depression\n\n🧠 What Is It?\n• Depression is a serious condition where you feel sad, tired, and hopeless for weeks or months.\n• It’s more than just sadness — it affects how your mind and body function daily.\n\n⚠️ Symptoms\n• Feeling empty inside or unable to enjoy anything.\n• Losing interest in things you once loved — like music, people, or food.\n• Sleeping too much or too little.\n• Eating more or less than usual, with noticeable weight changes.\n• Feeling like a burden or that life has no meaning.\n• Having thoughts of self-harm or not wanting to live — this needs urgent support.\n\n🔍 Causes\n• Loss of someone close, a breakup, or losing a job.\n• Ongoing stress, loneliness, or money problems.\n• Health issues or hormonal changes.\n• Family history of depression.\n\n✅ What You Can Do\n• Get sunlight daily — even sitting by a window can help.\n• Do small tasks like brushing your teeth or making your bed — small wins matter.\n• Avoid alcohol, smoking, and drugs — they may feel helpful but make things worse.\n• Talk to a mental health professional — therapy and medication can help a lot.\n• Most importantly, know this: you\'re not lazy or weak. Depression is real, and you deserve help.\n'**
  String get depression;

  /// No description provided for @insomnia.
  ///
  /// In en, this message translates to:
  /// **'Insomnia (Sleep Trouble)\n\n🟣 What Is It?\n• Insomnia means having trouble falling asleep, staying asleep, or going back to sleep even when you’re tired.\n• It leaves you feeling drained, irritable, and mentally foggy the next day.\n• If it continues for several days or weeks, it may need attention.\n\n😴 Common Symptoms\n• Lying awake in bed for hours without sleeping.\n• Waking up often during the night or too early.\n• Feeling tired despite being in bed all night.\n• Trouble focusing or feeling emotionally low during the day.\n• Fear or worry about bedtime itself.\n\n🔁 What Causes It?\n• Overthinking about stress, money, relationships, or health.\n• Using mobile or screen before bed — blue light keeps your brain alert.\n• Drinking caffeine (tea, coffee, cola) near bedtime.\n• Long naps during the day or irregular sleep routine.\n• Discomfort from pain, acidity, breathing issues, or frequent urination.\n• Big life changes — like exams, loss, job change, or moving.\n• Side effects from certain medicines or health issues.\n\n🧘‍♀️ What You Can Do (Lifestyle Tips)\n• Keep a fixed sleep schedule — same sleep and wake time every day.\n• Make your room sleep-friendly — cool, dark, quiet, with calming scents like lavender.\n• Avoid screens 1 hour before bed — no phone, TV, or laptop.\n• Wind down with breathing exercises or body scan meditation.\n• Avoid long or evening naps.\n• Move your body daily — 20–30 mins of walk or yoga can improve sleep.\n• Don’t force sleep — if awake for 20+ minutes, get up, read, or journal, then try again.\n\n🥗 Foods That Help with Sleep\n✅ Try these:\n• Warm milk or turmeric milk — helps make sleep hormones.\n• Bananas — relax muscles with magnesium and potassium.\n• Almonds, walnuts — rich in melatonin and good fats.\n• Chamomile or tulsi tea — calming, caffeine-free.\n• Oats and moong dal khichdi — easy to digest and calming.\n• Leafy greens and pumpkin seeds — boost magnesium and tryptophan.\n🚫 Avoid before bedtime:\n• Coffee, tea, green tea — even some \'herbals\' have caffeine.\n• Chocolate — contains hidden caffeine, especially dark types.\n• Fried, spicy, or sugary foods — cause bloating, acidity, or energy spikes.\n• Alcohol — may cause drowsiness but disturbs deep sleep later.\n• Large meals — eat dinner 2–3 hours before bed.\n\n🧡 When to Seek Help\n• If sleep troubles last over 2–3 weeks even after trying good habits.\n• If sleep issues are affecting your mood, energy, or daily life — talk to a doctor or therapist.\n'**
  String get insomnia;

  /// No description provided for @eatingDisorders.
  ///
  /// In en, this message translates to:
  /// **'Eating Disorders\n\n🍽 What Are They?\n• Eating disorders are not just about food — they are linked to thoughts and feelings about body image, control, and self-worth.\n• They often come from stress, trauma, or low confidence — not greed or attention-seeking.\n• These are serious but treatable with the right help and support.\n\n🔎 Types of Eating Disorders\n🍽 Anorexia Nervosa: Avoiding food to feel “in control”\n• Intense fear of gaining weight even if underweight.\n• Skipping meals, hiding food, or lying about eating.\n• Overexercising, calorie counting, comparing with celebrities.\n• Feeling weak, dizzy, or missing periods.\n• Wearing loose clothes to hide weight loss.\n😞 Bulimia Nervosa: Eating a lot, then trying to undo it out of guilt.\n• Binge eating sweets or junk food during stress.\n• Vomiting, fasting, or using laxatives to “compensate.”\n• Hiding habits due to shame or guilt.\n• Mood swings, digestive issues, and low self-esteem.\n🥺 Binge Eating Disorder (BED): Emotional overeating without purging.\n• Eating out of sadness, boredom, or loneliness — not hunger.\n• Eating secretly and feeling guilty afterwards.\n• Feeling numb or out of control while eating.\n• Gaining weight and avoiding social events or shopping.\n\n🧠 What Might Cause It?\n• Teasing or criticism about body or weight.\n• Pressure from social media or beauty standards.\n• Past trauma, abuse, heartbreak, or bullying.\n• Using food to feel in control or escape feelings.\n• Unrealistic wedding, movie, or cultural ideals about thinness.\n• Diet culture that glorifies starvation as “healthy.”\n\n🩺 Physical Effects (Often Ignored)\n• Weakness, tiredness, fainting spells.\n• Hair fall, dry skin, brittle nails.\n• Missed periods or fertility issues.\n• Digestive issues like bloating, constipation, acidity.\n• Poor immunity and delayed healing.\n• Heart risks and weak bones over time.\n\n🛑 What It’s Not\n• Not just “being picky” or “trying to lose weight.”\n• Not “a phase” — it needs care and attention.\n• Not only a “Western issue” — it happens in India too.\n• Not about vanity — it’s a sign of emotional pain.\n\n❤️ How to Support Someone (or Yourself)\n• Listen with care and empathy — not judgment.\n• Avoid making any comments about body weight.\n• Don’t force food or scold — this increases shame.\n• Encourage regular meals, sleep, gentle movement, and expressing feelings.\n• Suggest seeing a therapist, support group, or dietitian trained in eating disorders.\n\n🌼 When to Seek Help\n• If eating habits affect your work, studies, or relationships.\n• If you feel ashamed after eating or avoid social events.\n• If you obsess over your body, food, or constantly weigh yourself.\n'**
  String get eatingDisorders;

  /// No description provided for @stressAndBurnout.
  ///
  /// In en, this message translates to:
  /// **'Stress and Burnout\n\n💭 What Is It?\n• Stress is normal in small amounts and can help you perform tasks.\n• But when stress is constant and doesn’t go away, it can turn into burnout — a state of deep mental, emotional, and physical exhaustion.\n• Burnout feels like your mind saying, “I can’t do this anymore.”\n\n🌪️ Common Symptoms\n😵‍💫 Mental:\n• Always thinking about problems or tasks.\n• Trouble focusing or remembering things.\n• Feeling overwhelmed or mentally stuck.\n• Lack of motivation for even small things.\n💔 Emotional:\n• Feeling drained, numb, or emotionally flat.\n• Quick to anger, sadness, or irritation.\n• Feeling helpless, hopeless, or trapped.\n• Losing interest in things you used to enjoy.\n😖 Physical:\n• Frequent headaches, body aches, or tiredness.\n• Too much or too little sleep.\n• Digestion issues, acidity, or low appetite.\n• Falling sick often — low immunity.\n\n💡 Stress vs Burnout\n• Stress = over-engaged; burnout = emotionally shut down.\n• Stress = urgent and tense; burnout = exhausted and numb.\n• With stress you still care; with burnout you feel like nothing matters.\n\n🧠 When You Might Be Burning Out\n• You dread each day — holidays don’t help.\n• You want to quit your job, school, or life duties.\n• You avoid people, even loved ones.\n• You no longer care about what once mattered.\n• You imagine running away or disappearing.\n• You feel like a failure despite trying hard.\n• You scroll endlessly, sleep too much, or isolate to escape.\n\n✅ What Can Help (Gentle Self-Care)\n🕒 Daily Life:\n• Take short breaks — even 10–15 minutes.\n• Follow simple routines for sleep, meals, and movement.\n• Avoid multitasking — do one thing at a time.\n• Say “no” when needed — protect your energy.\n🧘 Mind & Body:\n• Try deep breathing, prayer, or short meditation.\n• Stretch or walk gently — for calm, not fitness.\n• Talk to someone who listens without judging.\n• Limit screen time — especially doomscrolling or comparisons.\n💬 Mindset Shifts:\n• You’re not lazy — you’re exhausted and need care.\n• Rest is necessary, not a reward.\n• You don’t have to fix everything today.\n• Slowing down is still progress.\n🥗 Helpful Foods:\n• Drink water, nimbu pani, or buttermilk — stay hydrated.\n• Eat nuts, seeds, fruits, grains, and a little ghee.\n• Try calming teas like chamomile, tulsi, or ginger.\n• Avoid too much caffeine, sugar, fried food, or skipping meals.\n\n📍 When to Seek Help\n• If you feel constantly tired, sad, angry, or numb.\n• If your work, studies, or home life are affected.\n• If you can’t sleep or eat properly for weeks.\n• If you feel like giving up, quitting, or harming yourself — talk to a professional.\n'**
  String get stressAndBurnout;

  /// No description provided for @optionA.
  ///
  /// In en, this message translates to:
  /// **'Not at all'**
  String get optionA;

  /// No description provided for @optionB.
  ///
  /// In en, this message translates to:
  /// **'Few days'**
  String get optionB;

  /// No description provided for @optionC.
  ///
  /// In en, this message translates to:
  /// **'Half of the days'**
  String get optionC;

  /// No description provided for @optionD.
  ///
  /// In en, this message translates to:
  /// **'Almost every day'**
  String get optionD;

  /// No description provided for @diabetes_disease.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get diabetes_disease;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en', 'hi', 'mr', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
    case 'mr': return AppLocalizationsMr();
    case 'te': return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
