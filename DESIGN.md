Design document

Written by Nick Jaeger, for CS50

Final Project, Fitness App in Swift
—

Big picture:

For my project, I tasked myself with learning Swift, database configuration, and server setup in order to create an application intended to allow individuals to register enduring user profiles that can are added to a database and able to interact with the other users on the server. This involved a focus on object oriented programming/model view controller design, and database creation.

Authentication:

For my Authentication, I chose to use google Firebase as the remote server. The process of incorporating Firebase into Xcode with Swift required integrating Xcode with Cocoa Pods with Firebase’s SDK, and initializing Firebase in Swift in our Xcode console. This entry level configuration was primarily done within our generic AppDelegate. As an efficient way to authenticate users I decided to use Google’s Sign-In for IOS, which we installed as a separate pod file. For code side implementation we created the AppDelegate_GooglesignIn Swift file which serves as an extension to the AppDelegate file, in the interest of adhering to the Singleton efficiency model. This makes it drastically easier to coordinate models across systems, and allows us to instantiate the instance of our GIDSignInDelegate in a view window. This creates unique and lasting user profiles for individuals who sign in, but to interact with our data on a deeper level we need to add it to database

Database implementation/design:

In order to interact with out data and allow users access to information about other users, we need to push the user data upon sign in to the database so we can retrieve it when we build our list of users. In order to do this we created an FAUser class which stores the variables as follows: userID, name, email, profilePic, isAuthenticated(bool), and connections (we’ll get to this later). Again, in the interest of adhering to the Singleton model, we have a separate file for FAUser. I create a static variable db that allows us to push to the database. As far as the structure of the database, we have users, which are individually identified by their token, and each user has their email, name, pic, id, and connections associated.

Populating members:

Now that we have users in the database, we need to make them visible to other users in the members page. We create a table view, define a cell, and use the wonderful dequeueReusable Cell function to fill them with a number of users defined by the size of the database. In our MembershipUITableViewController we define a queryDatabase function, in which we do exactly that, and fill the table view we defined by iterating through this data to append it to each individual cell, filling the cells with a name and unique identification token. Of course we check and make sure the user id is not the current users id before displaying the user under members, as you cannot connect to yourself.

Following/Unfollowing members:

When the user selects from the member list, we push this to the database under connections, storing it under the currently logged in user in connections where there are identifiers that correspond to the users that the individual follows, which are then displayed on the root page. Connections are incorporated as the class FAMembers, which stores the relevant information about the connections including the profile picture


Navigation/Sign out:

Using a navigation controller we segue between pages, and incorporate Firebase’s signout function to wipe the current user.

Object oriented programming:

In learning swift, it is important to recognize this added dimension. I am not only working with code, but I also have a storyboard where I can instantiate aspects that then need to be given identifiers, or made into variables, or connected with appropriate codes.

Goals:

As far as accomplishing what I set out to do, I am very pleased. I have made leaps as far as learning Xcode, which I now feel reasonably confident using; learning Swift, which I have a strong and new skillset in; learning IOS development, which is really separate from learning Swift; learning database implementation, in particular on a server; and learning server set up and user authentication, among other things. The last component of this project that made it fitness related was an ability to send push notifications to other users when one user was working out. I discovered that this has to be done by basically creating a messaging component of the app, which is really a whole project in itself, so I settled for creating what is essentially a prototype of a social media platform, that, going forward, I will seek to add the push notification functionality to.

Sources:

I have no experience in Swift, so I turned to so many sources that I can barely keep track of everything I used. As such, it would be futile trying to comment out above each individual piece of code that has some inspiration from something online, as almost everything had some inspiration from something online as that is how I learning to code in swift. Here is a list of some sources that I found particularly useful, that I often borrowed code/design/style advice from: Firebase and all of its documentation, http://mrgott.com/misc/7-create-markdown-file-and-push-it-to-github-for-the-data-scientist-s-toolbox-project-at-coursera, Vasil Nunev’s youtube video channel, which I probably used 5 or so videos from, in particular : https://www.youtube.com/watch?v=js3gHOuPb28, Swift almanac’s youtube channel, from which I probably watched half of the videos he has put out, in particular his 7 part series on creating a log in screen. I am also deeply grateful to Elliot Barer, a friend who helped teach me Swift, helped me debug, gave me wonderful information on how to structure an Xcode project in an efficient manner, and generally helped guide me in the right direction as someone completely new to Swift.

fin
