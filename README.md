# ♻️ Smart Recycling Bin – IoT & Mobile Application

A smart, environmentally-driven solution that automates the process of identifying and sorting recyclable waste. Users earn points for their recycling activity, which are managed and displayed through a dedicated mobile application. The system bridges hardware automation with mobile UX to promote sustainability in a gamified and user-friendly way.

## 🧠 Project Concept

Traditionally, recycling required user effort and awareness, often resulting in low participation. This smart bin changes that by automating waste sorting and offering users a points-based reward system, making recycling efficient and engaging.

Users can:
- Drop recyclable items into the smart bin
- Earn points automatically
- Track their points and recycling activity through the mobile app

## 📱 Mobile Application Features

- **Sign Up / Login:** Secure user authentication system to track individual progress
- **Dashboard:** Displays total earned points and basic user metrics
- **Recycling Log:** History of recycled items and transactions
- **Gamification:** Points system to encourage continuous engagement
- **User Profile:** View and manage personal details

## 🤖 Hardware Integration

- **Raspberry Pi 4** used as the control unit for the physical bin
- **Sensors** (e.g., IR, weight, material-specific sensors) to detect and classify recyclable materials
- **Automated Sorting Mechanism** directs items to proper compartments

## 🔧 Backend & Communication

- **Database:** MySQL via phpMyAdmin to store user data, item types, and point totals
- **Backend:** Built using **PHP**
- **APIs:** Secure and lightweight **RESTful APIs** using **JSON** for data communication between:
  - Raspberry Pi
  - Backend
  - Mobile application

## 🛠️ Tech Stack

- **Mobile App:** Flutter (Dart)
- **IoT Device:** Raspberry Pi 4
- **Backend:** PHP, MySQL (phpMyAdmin)
- **APIs:** RESTful APIs using JSON
- **Version Control:** Git & GitHub




