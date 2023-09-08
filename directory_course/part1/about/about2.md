## Video Title :  AppBar and Drawer Navigation


## 1. Research: Competitors



**Flutter Videos/Articles**

* https://blog.logrocket.com/how-to-add-navigation-drawer-flutter/
* https://docs.flutter.dev/cookbook/design/drawer
* https://www.fluttercampus.com/guide/2/how-to-add-navigation-drawer-below-app-bar-and-set-menu-icon/
* https://blog.logrocket.com/flutter-appbar-tutorial/
* https://www.geeksforgeeks.org/flutter-appbar-widget/
* https://api.flutter.dev/flutter/material/AppBar-class.html
* 48k - https://youtu.be/TlbbIQykHK0



## 2. Video Structure



**Main Points / Purpose Of Lesson**


1. Learning about AppBar and Drawer Navigation is crucial for creating user-friendly mobile and web apps, enabling efficient access to different sections and features while maintaining design consistency. Mastering these navigation elements enhances user experience, responsiveness, and overall app usability.

2.  **Main Points**

- AppBar Navigation
- Drawer Navigation
- Implementing Drawer

3. Hello and welcome to today's video! In this session, we'll delve into two crucial navigation concepts: AppBar Navigation and Drawer Navigation. We'll not only explore how to seamlessly integrate navigation controls into app bars and drawers but also guide you through the process of implementing a functional drawer for your mobile applications. Let's get started!


**The Structured Main Content**

**AppBar Navigation**  
AppBar Navigation refers to the practice of incorporating navigation elements and controls within the app bar of a mobile or web application. The app bar is a commonly placed UI component at the top of the screen that typically contains the app's title, action icons, and navigation controls. By integrating navigation options directly into the app bar, users can easily access different sections or features of the app without the need to navigate through multiple screens. This approach enhances user convenience, streamlines the navigation process, and contributes to a more intuitive and efficient user experience.

To implement AppBar navigation, you need to add an `actions` property which adds a list of widgets to the app bar:
```dart  
appBar: AppBar(    
  backgroundColor: Colors.deepPurple,    
  foregroundColor: Colors.white,    
  title: const Text('HomePage'),    
  actions: [],  
 ),  
```  
***Actions:***  
Actions are interactive elements, often represented as icons or buttons, placed within the app bar. They provide users with direct access to specific functionalities or features of the app. Actions are typically used for tasks that users frequently perform, such as searching, adding items, sharing content, or accessing user profiles.

For example,  
The provided code snippet below uses an `IconButton` in the app bar with a "favorite" icon. When the icon is tapped, it triggers a navigation action to a `FavoritePage` using `Navigator.push()`.
```dart  
IconButton(    
  onPressed: () => Navigator.push(    
    context,    
  MaterialPageRoute(builder: (context) => const FavoritePage()),    
  ),    
icon: const Icon(Icons.favorite), ),  
```  
Alternative, by using `Navigator.pushReplacement`, you ensure that the previous screen is replaced by the `Settings` screen when the "settings" icon is tapped. This can be helpful in scenarios where you want to provide a one-way navigation flow or prevent the user from returning to the previous screen.
```dart  
IconButton(    
  onPressed: () => Navigator.pushReplacement(    
    context,    
  MaterialPageRoute(builder: (context) => const Settings()),    
  ),    
icon: const Icon(Icons.settings), )  
```  

**Drawer Navigation**  
A navigation drawer is a UI panel that slides in from the side of the screen, typically triggered by a menu icon or swipe gesture. It contains a list of navigation options, links, or icons that users can select to navigate to different screens or perform actions. Drawer Navigation is a user-friendly and efficient way to organize and provide access to different app sections or actions.

Here's an overview of how Drawer Navigation works:

1.  **Drawer Trigger:** Users can open the navigation drawer by tapping a menu icon in the app bar or swiping from the left edge of the screen.

2.  **Drawer Content:** The navigation drawer displays a list of items, links, or icons that represent different sections or features of the app. Each item typically corresponds to a specific route or action.

3.  **Handling Selection:** When a user selects an item from the navigation drawer, the app responds by navigating to the corresponding screen or performing the associated action. This navigation is often handled using the `Navigator` class, similar to other navigation methods.

4.  **Accessibility:** Drawer Navigation enhances user accessibility by providing a convenient and consistent way for users to access different parts of the app without cluttering the main content area.

5.  **Customization:** Developers can customize the appearance of the navigation drawer to match the app's design, including colors, icons, and typography.

**Implementing Drawer**  
To create a navigation drawer, we will make use of the `Drawer` property inside the `Scaffold` in `HomePage`.
```dart  
drawer: const DrawerPage(),  
```  
Inside the `DrawerPage`, we use a `Container` to wrap the content and then a `ListView` to create a scrollable list of items within the drawer.

Next, we start adding the content of the drawer with a user account header using the `UserAccountsDrawerHeader` widget. It displays the user's email, name, and a profile picture.
```dart 
InkWell(  
  onTap: () => Navigator.pushNamed(context, '/userPage'),  
  child: const UserAccountsDrawerHeader(  
    accountEmail: Text('heyflutter@gmail.com'),  
  accountName: Text('Hey Flutter Team'),  
  currentAccountPicture: CircleAvatar(  
      backgroundImage: NetworkImage(  
          'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),  
		 ),  
	),  
),
```
To include some interaction to the app, we wrap the `UserAccountsDrawerHeader` widget around with `InkWell`. And lastly if you tap on the header it navigates you to the `UserPage()`.

Also, for the `ListTile` widgets.
Each `ListTile` represents an item in a navigation drawer, along with the differences in the `onTap` behaviors:
1.  **Home ListTile:**

    -   This `ListTile` includes an icon of a home (`Icons.home`) on the left side and the title "Home."
    -   When the `ListTile` is tapped (`onTap`), it uses `Navigator.push` with a `MaterialPageRoute` to navigate to the `HomePage`.
2.  **Favorites ListTile:**

    -   This `ListTile` includes an icon of a heart (`Icons.favorite`) on the left side and the title "Favorites."
    -   When the `ListTile` is tapped (`onTap`), it uses `Navigator.push` with a `CupertinoPageRoute` to navigate to the `HomePage`. The difference here is that it uses a Cupertino-style route transition.
3.  **Notifications ListTile:**

    -   This `ListTile` includes an icon of an active notification (`Icons.notifications_active_sharp`) on the left side and the title "Notifications."
    -   When the `ListTile` is tapped (`onTap`), it uses `Navigator.pushNamed` to navigate to a named route `/notificationPage`. This approach is useful when you have predefined routes in your app.