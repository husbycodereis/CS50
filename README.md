Cinegamely is a movie and game database app that is developed from the idea of finding movies that have video games to play and finding video games that has movies to watch. In short it can be named as a **cross-category** search engine.

However the search would be meaningless without saving the search product. From this thought, the app has additional features of giving a like to a product, adding a product to the custom list that user can create and see the lists in detail in their own category. Please note that the lists can only be created to save products from the **same category** with intention of keeping each category seperated.

What if the user doesn't know what to search? For this reason, **discover** page comes in handy. The page offers top charts for each category as well as searching for random names. The idea is open for exploration therefore the first new additions will be implemented into discover page such as searching by genre, actor, director etc...

The app is currently available on [Google Play Store](https://play.google.com/store/apps/details?id=com.alirizareisoglu.cinegame) and soon to be available on the app store.

---
### Features
##### Explore & Search

* Search in a movie-tv show and game database with the same query
* Switch between results from the same page

![search](/images/cinegamely/search1.png)![search](/images/cinegamely/search2.png)

* Get detailed information by tapping on the search result
* Press **"can you play?"** button and see if your movie or tv show has a relevant game title
* Press **"can you watch?"** button and see if your game has a relevant movie or tv show title

![search](/images/cinegamely/details1.png)![search](/images/cinegamely/details2.png)

##### Find new products in discover section

* Find top movies, tv shows and games in their own category
* Tap on random buttons and get random recommendations

![search](/images/cinegamely/discover.png)
##### Create an account to unlock additional features;
* Give a like to the products and save them into your likes
* Create & edit custom lists for movies & tv shows and games seperately
* See your liked products and created lists under their own category

![search](/images/cinegamely/list1.png)![search](/images/cinegamely/list2.png)

##### Personalize from settings screen
* Choose from available languages
* Switch between light / dark theme
* Change current user password
* Delete current user

![search](/images/cinegamely/settings3.png)![search](/images/cinegamely/settings1.png)![search](/images/cinegamely/settings2.png)

---
#### Promotional Video
{{< youtube x2JRkecIxww>}}

### Technical Information


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


# CS50 final project - CINEGAME


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

Project video link  https://youtu.be/5MsYlnNatGs

# Screenshots
  <p align="center">
<img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/Cinegame-base.png" width="250" height="500">
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/Cinegame-search.png" width="250" height="500">
  <img src="https://github.com/husbycodereis/husbycodereis/blob/master/images/Cinegame-details.png" width="250" height="500">
</p>


# Technical Information


* Framework used in the project => Flutter
* Programming language of the framework => Dart
* Authentication method => Firebase
* Database => Cloud Firestore
* Architecture => Clean Architecture
* State management => MobX & Provider  https://mobx.netlify.app/ & https://pub.dev/packages/provider
* HTTP request package => Dio
* Database for movies => The movie database / https://www.themoviedb.org/
* Database for video games => The internet game database / https://www.igdb.com/
* Localization method => Applocalization

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


