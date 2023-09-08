## Video Title :  Dialogs and Modal Bottom Sheets


## 1. Research: Competitors



**Flutter Videos/Articles**

* https://api.flutter.dev/flutter/material/DialogRoute-class.html
* https://www.flutterbeads.com/flutter-dialog/
* https://kevinandre.com/flutternavigationanywhere/
* https://www.appsloveworld.com/flutter/200/131/flutter-navigation-in-a-pop-up-dialog
* https://api.flutter.dev/flutter/material/Dialog-class.html
* https://blog.logrocket.com/creating-dialogs-flutter/
* https://api.flutter.dev/flutter/material/showModalBottomSheet.html
* https://blog.logrocket.com/flutter-modal-bottom-sheet-tutorial-with-examples/
* https://www.geeksforgeeks.org/flutter-modal-bottom-sheet/
* 74k - https://youtu.be/AjAQglJKcb4
* 52k - https://youtu.be/D6icsXS8NeA
* 3k - https://youtu.be/fA7-vx1P0Gw


## 2. Video Structure


**Main Points / Purpose Of Lesson**


1. Learning about dialogs and modal bottom sheets is crucial for viewers as these UI components facilitate user interactions, decision-making, and context-specific actions, thereby enhancing user experience and responsiveness in a Flutter application. Mastering their implementation enables developers to create user-friendly interfaces that provide clear feedback, streamline workflows, and adhere to design conventions.

2.  **Main Points**

- Dialogs
- Navigating using dialogs
- Modal bottom sheets
- Navigation using Modal Bottom sheets

3. Hello and welcome to today's video! In this session, we will explore the world of dialogs, including different types of dialogs and how to navigate using them. We will also dive into modal bottom sheets and learn how to navigate using this versatile UI component.

**The Structured Main Content**

**Note** To navigate this section, uncomment *Todo: About3.md* and comment the other in `main.dart`.

**Dialogs**  
Dialogs in Flutter are UI components that provide a way to communicate with users, gather input, or display information in a focused and modal context. They are used to interrupt the user's current interaction, prompt for a decision, or show important alerts. Dialogs typically appear as popup windows that overlay the main content and require user interaction before allowing further actions.

There are two main types of dialogs in Flutter:

-   **Alert dialogs** are used to display a message to the user and ask them to take action. They typically have one or two buttons, such as "OK" and "Cancel".
-   **Simple dialogs** are used to display a message to the user without asking them to take action. They typically have one button, such as "Close".

**Navigating using dialogs**

Next, let us look at an example on how to create and navigate an alert dialog:  
**Note:** This is the explanation of the `show_alert_dialog.dart` file in `widget` directory.

1. Create an dialog:  
   To create a dialog in Flutter, you need to use the `showDialog()` method. The `showDialog()` method takes a `builder` function as its argument. The `builder` function is responsible for creating the widget tree for the dialog.
     ```dart  
     showDialog(   
          context: context,   
          builder: (context) {   
          // Dialog content will be built here   
          },   
      );  
    ```  
2. Build the dialog content  
   Inside the `builder` callback, we create and configure the content of the dialog using the `AlertDialog` widget. The `AlertDialog` has several properties:

-   `title`: Sets the title text displayed at the top of the dialog.
-   `content`: Sets the main content text of the dialog.
-   `actions`: A list of action buttons that will be added to the dialog.
       ```dart  
      builder: (context) {   
            return AlertDialog(   
                title: Text('Are you sure?'),   
                content: Text('This action cannot be undone.'),   
                actions: [ // Action buttons will be added here   
                ],   
            );   
        },  
     ```
3. Add the Action Buttons
   Inside the `actions` property of the `AlertDialog`, we will add action buttons that allows users to navigate within our app when interacting with the dialog.
   ```dart
   TextButton(  
     child: const Text('Cancel'),  
     onPressed: () => Navigator.of(context).pop(),  
   ),  
   TextButton(  
     child: const Text('OK'),  
     onPressed: () => Navigator.push(  
       context,  
     MaterialPageRoute(  
         builder: (context) => const HomePage(),  
        ),  
     ),  
   ),
   ```
   In the "OK" button's `onPressed` callback, you can use the `Navigator.push` method to navigate to a new page. In this example, when the "OK" button is pressed, it triggers the navigation  `HomePage`. You can replace `HomePage` with the actual widget you want to navigate to.
   **Note**: Also explain to the users that named Route can also be used here too.

Also, let us look at an example on how to create and navigate a simple dialog:  
**Note:** This is the explanation of the `show_simple_dialog.dart` file in `widget` directory.

1. Create Dialog:

   To create a simple dialog in Flutter, you can use the `showDialog()` method. The method takes a `context` parameter and a `builder` function to define the dialog's content. Inside the `builder` function, you create the dialog's layout and structure.
   ```dart 
   showDialog(
     context: context,
     builder: (context) {
       // Dialog content will be built here
     },
   );
   ``` 

2. Build the Dialog Content:

   Within the `builder` callback, you build the content of the dialog using the `SimpleDialog` widget. The `SimpleDialog` widget has a list of `SimpleDialogOption` widgets as its children. Each `SimpleDialogOption` represents an option in the dialog.

   ```dart
   builder: (context) {
     return SimpleDialog(
       title: Text('Select an Option'),
       children: [
         // SimpleDialogOption widgets will be added here
       ],
     );
   },
   ```

3. Add the Dialog Options: Navigating Using Dialogs

   Inside the `children` property of the `SimpleDialog`, you can add `SimpleDialogOption` widgets that represent the options users can choose from in the dialog.

   For example, let's say you want to navigate to a different page when an option is selected. You can achieve this by using the `Navigator` class to push a new route when an option is tapped.

   ```dart
   children: [
     SimpleDialogOption(
       onPressed: () {
         // Navigate to a new page or perform an action.
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => const HomePage()),
         );
       },
       child: const Text('Go to Home Page'),
     ),
     SimpleDialogOption(
       onPressed: () {
         // Close the dialog.
         Navigator.of(context).pop();
       },
       child: const Text('Cancel'),
     ),
   ],
   ``` 

In this example, the first `SimpleDialogOption` allows users to navigate to a new page (e.g., `HomePage`), and the second `SimpleDialogOption` allows users to cancel and close the dialog.

**Modal Bottom Sheet**

Modal Bottom Sheets in Flutter provides a way to display content in a sheet that slides up from the bottom of the screen. They are commonly used to present additional options, actions, or information to users without completely interrupting their current context.

**Navigation using Modal Bottom sheets**
**Note:** This is the explanation of the `show_modal_buttom_sheet.dart` file in `widget` directory.

1. Create Modal Bottom Sheet:

   To create a modal bottom sheet , we will use the `showModalBottomSheet()` method. This method takes a `context` parameter and a `builder` function to define the content of the bottom sheet.

   ```dart
   showModalBottomSheet(
     context: context,
     builder: (context) {
       // Bottom sheet content will be built here
     },
   );
   ``` 

2. Build the Bottom Sheet Content:

   Within the `builder` callback, we will build the content of the modal bottom sheet. You can use any widget you'd like to display within the bottom sheet.

   ```dart
   builder: (context) {
     return Container(
       // Bottom sheet content will be defined here
     );
   },
   ``` 

3. Implement Navigation or Actions:

   Inside the `builder` callback of the modal bottom sheet, you can implement navigation or perform actions based on user interaction.

   For example, if you want to navigate to a different page when an option is selected, you can use the `Navigator` class to push a new route when a button is tapped.

   ```dart
   builder: (context) {
     return Container(
       
       child: Column(
         children: [
          // Other Bottom sheet contents 
          ElevatedButton(  
             onPressed: () => Navigator.push(  
               context,  
                 MaterialPageRoute( 
                   builder: (context) => const HomePage(),  
                 ),  
             ),  
           child: const Text('Go to Home Page'),  
           ),  
           const SizedBox(height: 20),  
           ElevatedButton(  
             onPressed: () => Navigator.of(context).pop(),  
             child: const Text('Close'),  
           ),
         ],
       ),
     );
   }
   ``` 

   In this example, the first `ElevatedButton` allows users to navigate to a new page (e.g., `HomePage`), and the second `ElevatedButton` allows users to close the modal bottom sheet.

Thank you!