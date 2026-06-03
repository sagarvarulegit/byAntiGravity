# CBSE 10th standard Online Learning Portal

Welcome to the **CBSE Class 10 Online Learning Portal** repository. This project is built as a scale-ready, high-performance monorepo designed to deploy across Android, iOS, and Web clients, backed by an AWS-integrated microservice api.

## Directory Structure

```
/cbse-learning-portal
  ├── /db                   # PostgreSQL schemas & Redis key design
  ├── /prototype            # Interactive Web Prototype Dashboard (HTML/CSS/JS)
  │    ├── index.html       # Single Page Application UI
  │    ├── styles.css       # Premium responsive design styles (Light/Dark mode)
  │    └── app.js           # Live client-side logic (streaks, charts, mock checkout)
  └── README.md             # Project documentation
```

## Tech Stack Overview

1. **Client**: Flutter (Dart) for Android, iOS, and Web.
2. **Backend**: NestJS (TypeScript/Node.js) + Express.
3. **Database**: PostgreSQL (Structured data, logs, relations) + Redis (Streaks, active streams cache).
4. **Cloud Infrastructure**: AWS S3, AWS Elemental MediaConvert, AWS Lambda, Amazon CloudFront.
5. **Subscription & Billing**: RevenueCat SDK mapping Apple IAP, Google Play Billing, and Razorpay/Stripe (Web).

## Running the Interactive Web Prototype

1. Navigate to the `prototype/` directory.
2. Open `index.html` in any web browser to view and interact with the CBSE 10th dashboard, simulating video downloads, study streaks, quizzes, interactive graphs, and billing checkout.
