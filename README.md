# 🌱 Sukoon SETU – “Mann ki baat, aapke saath”

**Sukoon SETU** is a culturally inclusive, multilingual digital mental health platform designed to support underserved communities in India — including rural homemakers, adolescents, elders, and daily wage workers. The app provides accessible, judgment-free mental health guidance using audio, storytelling, chatbot conversations, and simple breathing and yoga techniques.

---

## 💡 Problem Statement

In India, 150M+ people need mental health care, but less than 30% receive treatment. Barriers such as **stigma**, **language**, **digital illiteracy**, and **lack of local relevance** make access even harder for rural populations.

Key challenges include:
- **63.8%** perceived stigma around mental health
- **70%** face a language barrier using existing apps
- **<1 psychiatrist per 100,000 people** in India
- Emotional pain often goes unspoken, especially among homemakers, elders, and workers

---

## 👥 User Personas

### 🧕 Rani – 38, Homemaker
- Feels emotionally neglected, hesitant to speak up
- Needs support in local dialect, without reading

### 👧 Sunita – 16, Student
- Faces academic stress, gender bias, and low self-esteem
- Needs stories/games that normalize feelings

### 👵 Shanti – 66, Elder
- Suffers loneliness, grief, and mobility issues
- Needs simple interaction or home visits

### 👨‍🔧 Suresh – 45, Laborer
- Uses alcohol to cope, faces sleep issues and emotional stress
- Needs anonymous support and practical advice

---

## 🧠 Features

- 🌐 **Multilingual Interface** – Supports Hindi, Bengali, Telugu & more
- 🤖 **Anonymous Chatbot** – Offers stigma-free emotional guidance
- 📊 **Mental Health Quiz** – Helps users self-assess their mood and needs
- 🧘‍♀️ **Yoga & Breathing** – Guided sessions for real-time relief
- 📚 **Audio Stories & Meditations** – Calms users through relatable narratives
- 🧾 **Health Tips** – Simplified info on issues like diabetes, migraines, etc.

---

## 🧱 Tech Stack

| Layer                     | Tool/Platform           | Why It Was Chosen                                     |
|---------------------------|-------------------------|--------------------------------------------------------|
| Frontend                  | Flutter                 | Cross-platform, smooth UI for chat and quizzes        |
| Backend                   | Firebase                | Scalable, real-time data sync and authentication      |
| Chatbot                   | DeepSeek LLM API        | Open-source LLM tailored for mental health use        |
| User Auth & DB            | Firebase Auth + Firestore | Secure login and real-time content delivery       |

---

## 📲 User Journey

1. **Login/Profile Setup** – Users select language and enter basic info
2. **Home Page** – Central hub with stories, chatbot, breathing, and quiz
3. **Quiz** – Guides users to understand their feelings without stigma
4. **Chatbot** – Safe conversation in local dialect
5. **Relaxation Tools** – Audio stories, yoga, meditation, and music
6. **Health Education** – Tips on common mental and physical issues

---

## 📊 Impact & Success Metrics

| Metric                     | What It Measures                                  |
|----------------------------|---------------------------------------------------|
| Mental Health Access Rate | Users from Tier 2/3 cities and rural districts    |
| Language Inclusivity Rate | Regional-language sessions as % of total         |
| Help-Seeking Conversion    | % of users asking for clinical support           |
| Retention Rate             | % of users returning after 30 days               |
| Stigma Reduction Score     | Comfort levels in discussing emotional health    |

---

## 🧱 Barriers & Solutions

| Challenge                            | Solution                                                              |
|--------------------------------------|-----------------------------------------------------------------------|
| Low literacy & language gap          | Audio-first interface and multilingual content                        |
| Fear of judgment                     | Anonymous access, no labels like "therapy"                            |
| App fatigue / Drop-offs              | Offline saving, minimal notifications, story-based engagement         |
| Trust issues                         | Community-based rollout, NGO & ASHA partnerships                      |

---

## 🚀 Launch Strategy

- **Pilot Launch**: 2 districts in Uttar Pradesh & Maharashtra
- **Onboarding Partners**: ASHA workers, Anganwadi centers, school teachers
- **Promotion Channels**: Community radio, poster kits, village meetings
- **App Delivery**: APK links, WhatsApp sharing, offline-first features

---

## 🤝 Partnerships

- **NGOs**: SEWA, Sangath, Mental Health Foundation India
- **CSR Collaborations**: Health/pharma firms to support outreach
- **Academic Teams**: NSS/UBA units from IITs and regional colleges
- **Government**: PHCs and National Mental Health Program (NMHP)

---

## 👩‍💻 Team

A Summer Project by:

**Hansika • Ishika • Kumkum • Shiv**

> “Mann ki baat, aapke saath” – for a mentally healthy Bharat.

## 🚀 How to Run the App Locally

### 📦 Prerequisites
Before you begin, make sure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart (usually bundled with Flutter)
- Android Studio or VS Code with Flutter extensions
- Git (optional but recommended)

---

### 🛠️ Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/hansika457/sukoon-setu.git
   cd sukoon-setu
