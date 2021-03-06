
# CS50 final project - CINEGAME


<img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/cinegamely_project.png" width ="750">

* Search in a movie database to see if matching movie has a playable video game
* Search in a video game database to see if matching game has a watchable movie
* Discover top movies, tv shows and games
* Tap to get random movies, tv shows or games
* Choose from available languages
* Switch between light / dark theme
* Create an account to unlock additional features below;
* Like titles and save them into your likes screen
* Create & edit custom lists
* Change current user password
* Delete current user

Project video [link](https://youtu.be/5MsYlnNatGs)
<br>
Detailed project [information](https://codereis.com/project/cinegamely/) 

# Screenshots
  <p align="center">
<img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/search1.png" width="250" height="500">
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/search2.png" width="250" height="500">
  <br>
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/details1.png" width="250" height="500">
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/details2.png" width="250" height="500">
   <br>
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/list1.png" width="250" height="500">
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/list2.png" width="250" height="500">
   <br>
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/settings1.png" width="250" height="500">
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/settings2.png" width="250" height="500">
</p>


# Technical Information


* Framework => Flutter
* Language  => Dart
* Design tool ==> Figma
* Authentication => Firebase
* Database => Cloud Firestore
* Architecture => Clean Architecture
* State management =>  [MobX](https://mobx.netlify.app/) & [Provider](https://pub.dev/packages/provider)
* HTTP request => Dio package
* Database for movies => [The movie database](https://www.themoviedb.org/)
* Database for video games => [The internet game database](https://www.igdb.com/)

# Clean Architecture for Flutter applications:

Presentation: The layer with the UI and State management

Domain: Domain is the inner layer which shouldn't be susceptible to the whims of changing data sources or porting our app to Angular Dart. It will contain only the core business logic (use cases) and business objects (entities). It should be totally independent of every other layer.

Use Cases: where the business logic gets executed.

Data: The data layer consists of a Repository implementation (the contract comes from the domain layer) and data sources - one is usually for getting remote (API) data and the other for caching that data. 

Repository; where you decide if you return fresh or cached data, when to cache it and so on.


<p align="center">
<img src="https://github.com/husbycodereis/CineGame/blob/master/assets/images/clean_architecture.png" width="400" height="500">
</p>
Credits:  https://resocoder.com/flutter-clean-architecture-tdd/

# Link for the CS50 course:

https://cs50.harvard.edu/x/2020/

# Boilerplate of the project:

https://github.com/zubairehman/flutter-boilerplate-project.git

# CS50x Certificate:

<p align="center">
<img src="https://github.com/husbycodereis/CS50/blob/master/CS50x-Certificate.png" width="800" height="700">
</p>


