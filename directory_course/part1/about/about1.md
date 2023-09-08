## Video Title : MaterialPageRoute and CupertinoPageRoute



## 1. Research: Competitors



**Flutter Videos/Articles**

* https://osamaasif.medium.com/material-page-route-and-named-route-in-flutter-4873dcd45751
* https://medium.com/@lazizbekfayziyev/responsive-routing-in-flutter-materialpageroute-vs-cupertinopageroute-in-one-app-aef693a2311c
* https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html
* https://medium.flutterdevs.com/cupertinopageroute-in-flutter-73ec9db72c06
* https://flutteragency.com/cupertinopageroute-and-named-routes-in-flutter/
* 4.3k - https://www.youtube.com/watch?v=zk968BHy3s8
*

## 2. Video Structure



**Main Points / Purpose Of Lesson**


1. Learning about `MaterialPageRoute` and `CupertinoPageRoute` in Flutter is crucial for developers aiming to create seamless navigation experiences on Android and iOS platforms respectively, ensuring apps adhere to Material Design and Cupertino design principles for a consistent and user-friendly interface.

2.  **Main Points**

- MaterialPageRoute?
- CupertinoPageRoute?
- How MaterialPageRoute handles page transition
- How CupertinoPageRoute handles page transition
- Customizing Routing transition

3. Hello and welcome to today's video! In this session, we will explore two essential navigation concepts in Flutter: `MaterialPageRoute` and `CupertinoPageRoute`. We'll delve into how these concepts handle page transitions and demonstrate ways to customize routing transitions, empowering you to create engaging user experiences irn your Flutter applications. Let's jump right in!


**The Structured Main Content**

**MaterialPageRoute?**  
`MaterialPageRoute` is a class in the Flutter framework that facilitates navigation and page transitions within an app, particularly following the design guidelines of Google's Material Design. When you use `MaterialPageRoute` in your Flutter application, it creates a transition effect that is consistent with the visual and interactive patterns of Android apps.

In simpler terms, `MaterialPageRoute` helps you move from one screen (or "page") to another in a way that feels natural and follows the Material Design principles. This includes animations, transitions, and behaviors that users are accustomed to in Android apps, such as sliding in from the right when navigating forward or sliding out to the left when navigating back.

The MaterialPageRoute class inherits from the Route class. It is a modal route, which means that it overlays the current route and prevents the user from interacting with it. MaterialPageRoute is the most commonly used type of modal route in Flutter.

To create a MaterialPageRoute, you need to pass the builder function to the constructor. The builder function is responsible for creating the widget tree for the new route. The builder function takes a context object as its only argument. The context object provides access to the current state of the app.

Here is an example of how to create a MaterialPageRoute:

```  
MaterialPageRoute(  
 builder: (context) => MyPage(),)  
```  
In this example, the builder function creates a widget tree for a page named `MyPage`. The `MyPage` page can be any Flutter widget.

MaterialPageRoute also has a number of properties that you can use to customize the navigation behavior. For example, you can use the `fullscreenDialog` property to make the new route a full-screen dialog.

Here is a list of the most important properties of MaterialPageRoute:

-   `builder`: The builder function that creates the widget tree for the new route.
-   `fullscreenDialog`: A boolean value that specifies whether the new route should be a full-screen dialog.
-   `maintainState`: A boolean value that specifies whether the state of the previous route should be preserved when the new route is pushed.
-   `transitionDuration`: The duration of the transition animation.
-   `reverseTransitionDuration`: The duration of the reverse transition animation.

The `builder` property is the most important property of MaterialPageRoute. It is the only property that is required. The other properties are optional.

The `fullscreenDialog` property specifies whether the new route should be a full-screen dialog. If this property is set to `true`, the new route will fill the entire screen and will not have a title bar.

The `maintainState` property specifies whether the state of the previous route should be preserved when the new route is pushed. If this property is set to `true`, the state of the previous route will be saved and restored when the new route is popped.

The `transitionDuration` property specifies the duration of the transition animation. The transition animation is the animation that is used to show the new route and hide the previous route.

The `reverseTransitionDuration` property specifies the duration of the reverse transition animation. The reverse transition animation is the animation that is used to hide the new route and show the previous route.

**CupertinoPageRoute?**  
`CupertinoPageRoute` is a class within the Flutter framework that facilitates navigation and page transitions in a way that aligns with the design principles of Apple's iOS platform.

The CupertinoPageRoute class in the Flutter Cupertino library is used to create a modal route with an iOS-style transition. The page slides in from the right and exits backward. The page also shifts to the left in parallax when another page enters to cover it. The page slides in from the bottom and exits in reverse with no parallax effect for fullscreen dialogs.

To create a CupertinoPageRoute, you need to pass the builder function to the constructor. The builder function is responsible for creating the widget tree for the new route.

Here is an example of how to create a CupertinoPageRoute:

```  
CupertinoPageRoute(  
 builder: (context) => MyPage(),)  
  
```  

In this example, the builder function creates a widget tree for a page named `MyPage`.

CupertinoPageRoute also has a number of properties that you can use to customize the navigation behavior. For example, you can use the `fullscreenDialog` property to make the new route a full-screen dialog.

Here is a list of the most important properties of CupertinoPageRoute:

-   `builder`: The builder function that creates the widget tree for the new route.
-   `fullscreenDialog`: A boolean value that specifies whether the new route should be a full-screen dialog.
-   `maintainState`: A boolean value that specifies whether the state of the previous route should be preserved when the new route is pushed.
-   `transitionDuration`: The duration of the transition animation.
-   `reverseTransitionDuration`: The duration of the reverse transition animation.

The `builder` property is the most important property of CupertinoPageRoute. It is the only property that is required. The other properties are optional.

The `fullscreenDialog` property specifies whether the new route should be a full-screen dialog. If this property is set to `true`, the new route will fill the entire screen and will not have a title bar.

The `maintainState` property specifies whether the state of the previous route should be preserved when the new route is pushed. If this property is set to `true`, the state of the previous route will be saved and restored when the new route is popped.

The `transitionDuration` property specifies the duration of the transition animation. The transition animation is the animation that is used to show the new route and hide the previous route.

The `reverseTransitionDuration` property specifies the duration of the reverse transition animation. The reverse transition animation is the animation that is used to hide the new route and show the previous route.

**How MaterialPageRoute handles page transition**  
MaterialPageRoute handles page transition by using a combination of `Navigator` and `PageRouteBuilder`.

The default page transition for MaterialPageRoute is a fade animation. The old route fades out as the new route fades in.

Here is an example that uses the `ElevatedButton` widget to navigate to a `DetailsPage` using `MaterialPageRoute` in `home_page.dart`:

```dart  
ElevatedButton(  
  onPressed: () {  
    Navigator.push(  
      context,  
	  MaterialPageRoute(builder: (context) => const DetailsPage()),  
	 );  
  },  
  child: const Text('Go to Details Page'),  
) 
```  

**How CupertinoPageRoute handles page transition**

Using `CupertinoPageRoute` is an effective way to ensure a seamless iOS-like navigation experience in your Flutter app, especially when targeting an audience accustomed to iOS app interactions.

Here's how `CupertinoPageRoute` handles page transitions:

1.  **iOS-Style Transition:** `CupertinoPageRoute` employs transition animations that closely resemble the native iOS navigation transitions. This includes sliding the new page in from the right to the left when pushing, and sliding it out from the left to the right when popping.

2.  **Gesture Back Navigation:** A common behavior in iOS apps is the ability to navigate back by swiping from the left edge of the screen. `CupertinoPageRoute` enables this gesture-based navigation, allowing users to intuitively navigate back to the previous page by swiping.

3.  **Customizable Transitions:** Just like `MaterialPageRoute`, `CupertinoPageRoute` offers customization options for transition animations. Developers can adjust the transition duration, set up custom page routes, and even specify transition curves to fine-tune the animation.

Here is an example that uses the `ElevatedButton` widget to navigate to a `FavoritePage` using `CupertinoPageRoute` in `home_page.dart`:

```dart
ElevatedButton(  
  onPressed: () => Navigator.push(  
    context,  
  CupertinoPageRoute(builder: (context) => const FavoritePage()),  
  ),  
  child: const Text('Go to Favorite Page'),  
),
```


**Customizing Routing transition**

In terms of how things look and work on screens, iOS devices have their own special ways like buttons, icons, AppBars, and moving from one page to another. These special things make Apple devices more appealing to the people who use them. So, it's important to think about how your Flutter app follows the rules of Cupertino design to make it work well and look good.

To achieve this, firstly we will create a `RouteGenerator` class. Inside the `RouteGenerator` class, we will create a method called `navigateToRoute` that returns a specific route based on the platform (Android or iOS).
```dart
navigateToRoute(Widget page) {  
  if (Platform.isAndroid) {  
    return MaterialPageRoute(builder: (context) => page);  
  }  
  
  if (Platform.isIOS) {  
    return CupertinoPageRoute(builder: (context) => page);  
  }  
}
```
This function, `navigateToRoute`, takes a `Widget` called `page` as a parameter and returns a `PageRoute` based on the platform.

-   If the current platform is Android (`Platform.isAndroid`), it returns a `MaterialPageRoute` with the provided `page` in its builder.

-   If the current platform is iOS (`Platform.isIOS`), it returns a `CupertinoPageRoute` with the provided `page` in its builder.

Next, we implement the `RouteGenerator()`
```dart
class RouteGenerator {  
  Route? routeGenerate(RouteSettings route) {  
  
  
    switch (route.name) {  
      case "/":  
        return navigateToRoute(const HomePage());  
  
 case "/settings":  
        return navigateToRoute(const Settings());  
  }  
  
    return null;  
  }
  navigateToRoute(){
  // Implementation exaplained above
  }
}
```
The function uses a `switch` statement to determine which route to generate based on the `route.name`.

-   If the `route.name` is "/", it returns the result of the `navigateToRoute` function with `HomePage` as the argument. This means that when the route name is "/", it navigates to the `HomePage` using the platform-specific route.

-   If the `route.name` is "/settings", it returns the result of the `navigateToRoute` function with `Settings` as the argument. This handles navigation to the settings page using the platform-specific route.

-   If the `route.name` does not match any of the predefined cases, it returns `null`.

And finally,  we demonstrate how to use the `Navigator.pushNamed` method in `HomePage()` to navigate to the `SettingsPage()` using the route's name.
```dart
ElevatedButton(  
  onPressed: () => Navigator.pushNamed(context, '/settings'),  
  child: const Text('Go to Settings Page'),  
),
```
**Note**: To effectively show the viewers the code above, display the navigation to the settings page on an iOS and Android device. 