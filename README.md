# Sentiment Analysis

The most way .

### Instructions on how to get started
- Install the Android SDK & Android Studio [Android Studio](https://developer.android.com/studio)
  from the Internet.
- Complete the installation process.
- Get access to the [GitLab](https://gitlab.com/jammbel/tripster)
- Git clone the [Repo](https://gitlab.com/jammbel/tripster) to your local machine using the terminal or directly cloning using the Android Studio
- Acquaint yourself with below to ease your journey

### Getting started

Prerequisites

- Works on google's Android OS and Apple iOS
- Project is done in Dart(Cross Platform)

### Project Architecture

Project is done using the mvvm architectural pattern

### Navigation inside the app
The application relies on the go router for navigation between screens inside the app

### State management 
The application makes use of flutter bloc for the state management 

### What the application is about
User is able to record a speech and get sentiment analysis regarding the speech
The app makes use of deepgram api to convert the audio to text which is then sent to openai api to do a sentiment analysis 
This cover all the modes in the file 

### Challenges faced while building the app
Getting right prompt to do the sentiment analysis and return the data in a specific format that is consumable by the application 