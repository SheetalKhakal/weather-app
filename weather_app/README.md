
Weather App 🌦️
A simple Flutter app that displays the current weather for a city entered by the user. The app integrates with the OpenWeatherMap API to provide real-time weather details like temperature, weather description, and an appropriate weather icon.
 
Features ✨
Search for Weather:
Input a city name and get the current weather information.

Weather Details:
Temperature in Celsius.
Weather description (e.g., "Clear Sky").
Weather icon.

Error Handling:
Displays an error message if the city is not found.
Alerts the user about connectivity issues if there is no internet connection.

Instructions to Run the App 🚀
Prerequisites
Install Flutter on your machine.
Obtain an API key from OpenWeatherMap.
Steps to Run the App =>
1.Clone the repository:
bash
Copy code
git clone https://github.com/SheetalKhakal/weather-app.git  

2.Navigate to the project directory:
bash
Copy code
cd weather-app  

3.Install dependencies:
bash
Copy code
flutter pub get  

4.Configure the API key:
Open the weather_provider.dart file in the lib/providers directory.
Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key.
dart
Copy code
final String apiKey = 'YOUR_API_KEY';  

5.Run the app:
bash
Copy code
flutter run  

