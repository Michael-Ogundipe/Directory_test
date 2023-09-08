## Video Title :  Onboardinging Flow Navigation


## 1. Research: Competitors



**Flutter Videos/Articles**

* https://sahasuthpala.medium.com/flutter-onboarding-screens-with-provider-e073ef2a927c#:~:text=With%20Provider%2C%20developers%20can%20effortlessly,delivering%20an%20engaging%20onboarding%20experience.
* https://medium.com/@anuradha.hewasiribaddana/use-provider-for-navigating-between-screens-in-drawer-items-in-flutter-bc368929b9ac
* https://github.com/manishdayma/flutter_animated_onboarding
*  https://api.flutter.dev/flutter/material/DialogRoute-class.html
* https://www.flutterbeads.com/flutter-dialog/
* https://kevinandre.com/flutternavigationanywhere/
* https://www.appsloveworld.com/flutter/200/131/flutter-navigation-in-a-pop-up-dialog
* 22k - https://youtu.be/SRHkYKBClUI
* 12k -  https://youtu.be/rSmKUmltTSM


## 2. Video Structure



**Main Points / Purpose Of Lesson**


1.  Learning about Onboarding Flow Navigation is important for viewers because onboarding is the initial user experience that sets the tone for their interaction with your app. It's the first impression users have, and a well-designed onboarding flow can greatly enhance user engagement, retention, and satisfaction. By understanding Onboarding Flow Navigation, viewers can grasp how to guide users through the app's features, benefits, and functionality in a clear and engaging manner, ensuring a positive user experience from the start.

2.  **Main Points**

-  The Concept
- Persisting Onboarding Status

3.  Hello and welcome to this video! In this session, you will learn about Onboarding Flow Navigation, including how to manage the presentation of onboarding screens and effectively persist the onboarding status across app sessions.

**The Structured Main Content**

**The Concept**

Onboarding Flow Navigation refers to the process of guiding users through a series of screens or steps when they first use an app. It's designed to introduce users to the app's features, benefits, and functionality, often using a sequence of screens that explain key concepts or encourage users to take certain actions.

**Persisting Onboarding Status**
Persisting the onboarding status involves using a method to store whether a user has completed the onboarding process, so they don't see the onboarding screens again. One common way to achieve this is by using the `shared_preferences` package in Flutter.

Using the `shared_preferences` package to persist the onboarding status is considered a best practice in Flutter development. It offers a simple and reliable way to store small pieces of data like flags, settings, and completion statuses. By implementing this approach, you can ensure a seamless and user-friendly experience for both new and returning users.

Now, let's dive into how to persist the onboarding status using the `shared_preferences` package in Flutter.

1. Add the dependency:
   Add the `shared_preferences` package to your `pubspec.yaml` file using the command `flutter pub add shared_preferences` in your terminal.
   ```yaml
   dependencies: 
       flutter:
         sdk:  flutter 
       shared_preferences:  ^2.2.0  # Add the latest version
   ```
2. Create UserPreferences class
- Variable declaration :
  ```dart
  static late SharedPreferences preferences;  

  static const keyValue = 'value';
  ```
  The first line declares a `static` variable named `preferences` of type `SharedPreferences`. This variable will store the instance of `SharedPreferences` once it's initialized.
  While, the second line declares a `static const` string named `keyValue`. It's used as the key when storing and retrieving the onboarding status.

- Intializing SharedPreferences:
  ```dart
  Future<void> init() async =>  
      preferences = await SharedPreferences.getInstance();
  ```
  The `init()` method asynchronously initializes the `SharedPreferences` instance and assigns it to the `preferences` variable, allowing you to use it for storing and retrieving preferences throughout your app.
  **Note:** You will also need to intialize the `init()` method in `main.dart`.
  ```dart
  Future main() async {  
   WidgetsFlutterBinding.ensureInitialized();  
   await UserPreferences().init();  
    
    runApp(const MyApp());  
  }
  ```
- Storing Onboarding Status
  ```dart
  static Future<void> showOnboarding(bool value) async =>  
      await preferences.setBool(keyValue, value);
  ```
    -   The first line declares a static method named `showOnboarding()` with an async signature. It takes a boolean parameter `value`, which represents the onboarding status that we want to store.

    -   `await preferences.setBool(keyValue, value);`: Inside the method, we're using the `setBool()` method of the `preferences` instance to store the provided `value` under the key specified by `keyValue`. The `await` keyword ensures that the storage operation is completed before proceeding.
- Checking Onboarding Status:
  ```dart
  static isOnboarded() => preferences.getBool(keyValue);
  ```

  The `isOnboarded()` method provides an easy way to check the onboarding status previously stored in the shared preferences. This method abstracts the process of retrieving boolean preferences and helps you determine whether the user has completed the onboarding process.

3. Setting the onboarding status
   In the `onboarding.dart` page, `Future<void> goToHomePage()` method, we added the line of code below, when the user presses the last navigation screen it takes you to the `HomePage()`.
   ```dart
   await UserPreferences.showOnboarding(false);
   ```
   This method call is using the `showOnboarding()` method from the `UserPreferences` class to update the onboarding status to `false`, informing that the `onboarding` screen will no longer be shown.
4. Determining Initial Screen Based on Onboarding Status:
   Finally,  we determine the initial screen based on onboarding status.
   Inside the `BuildContext`, we use the `UserPreferences.isOnboarded()` method to retrieve the user's onboarding status.
   ```dart
   bool showOnboarding = UserPreferences.isOnboarded() ?? true;
   ```
   The `?? true` part ensures that if the status is `null` (which might happen if the user preferences have not been initialized), the default value is set to `true`, indicating that onboarding should be shown.
   ```dart
   home: showOnboarding  
   ? const Onboarding(screenHeight: 50)  
   : const HomePage(),
   ```
   The ternary expression decides which screen to show based on the `showOnboarding` value:

-   If `showOnboarding` is `true`, meaning that onboarding is required or the status is not determined yet, the `Onboarding` widget is displayed. The `screenHeight: 50` parameter seems to be configuring the height of the onboarding screen.
-   If `showOnboarding` is `false`, indicating that the user has completed onboarding, the `HomePage` widget is displayed.

And that's how you Persist Onboarding Status. Thank you! 