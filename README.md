Documentation

Written by Nick Jaeger, for CS50

Final Project, Fitness App in Swift
—-

Opening the app:

Do not use the .xcodeproj file, use the .xcworkspace.

Compiling:

Compiling in Xcode is fairly straightforward. In the upper left-hand corner, you’ll see a play button, which opens the app in a simulator. This app is compatible with a wide array of different iPhones, and to select a different generation of iPhone, you simply click on where it shows the default simulator, which is typically “iPhone 8 Plus” in the newest version of Xcode. Selecting this will allow you to change the model of iPhone that your simulator uses to run the program.

Creating an account:

Much of the heavy lifting of this project was creating an online database on a remote server to handle authentication and data storage for remote users. When you first open the app, you will be on the Welcome screen, which is configured with a google sign in. On selecting google Sign in, you will be directed to google’s tokenized authenticator that has been incorporated into the apps interface. Please use any gmail account to log in. Upon doing so, you will have a permanent account in the database, and will be able to log in and out easily.

Root (homepage):

Upon signing in, you will find yourself on a page titled root. This should appear blank upon signing in for the first time. Do not fear, you have yet to access the social aspect of this application. The root is where you will see your “friend list,” once you have selected your friends. It will show your connections by name, and their unique identifier, which will allow you to distinguish people with similar names. It will also allow you to access more information about them via click, which leads to their individual user profile. Now to access the use database and select friends to add to your friend list, click the plus in the top right hand corner.

Members (add friends):

This is a list of all the users that are in the database, which happens automatically upon log in. The information that is saved upon sign up is the users unique (both to the person, and to this specific app) token authenticator, the users profile picture, the users name, and the users email address. To add someone to your friend list, simply click. If you want to remove them from your friend list, simply click again. An individual user’s friend list is saved even upon logging out and back in, which brings us to our next topic.

Sign out:

Its simple. Just press the sign out button in the top left hand corner of the root page, and you are redirected to the Welcome page, where you can sign back in at your leisure. But before you log out, I encourage you to click on the users that you have saved to your friend list to see their profile, as well as remove users from your friend list, as things happen. Sign back in and see your friend list intact
# FinalCsProjectNickJaegerDec7
