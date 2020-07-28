# GitHub Profiles

### A App to View GitHub Profiles and friends. 

 ![](ScreenShots/allScreens.png)

#### Learning Goals 
- [x] 100% ProgrammaticUI
- [x] CollectionViews with the new DiffableDataSource
- [x] Search Controllers
- [x] Network Calls
- [x] Parsing JSON with Codable
- [x] Pagination of Network calls
- [x] Memory Management - Capture Lists [weak self]
- [x] Image Caching
- [x] Dark Mode
- [x] SafariViewController
- [x] Persistence

## Username Input: 
   <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/screen1.gif?raw=true" width="300"> |

## Followers Page: 
- Display user's github profile using SFSafariViewController

| Search Collection View                     | Current User Details                          | View Friend's Followers                       |
| ------------------------------------------ | --------------------------------------------- | --------------------------------------------- |
| <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/collectionSearch.gif?raw=true" width="300"> | <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/userProfile.gif?raw=true" width="300">| <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/friendsFollowers.gif?raw=true" width="300"> |


## Favorites Page 
- UICollectionViewDiffableDataSource to filter users using search String 
- Bezier Path animation to hightlight/unselect star to favourite user (Core Animation)

| Add Friends to Favourites                  | Edit & Delete                                 | 
| ------------------------------------------ | --------------------------------------------- |  
| <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/addToFavourtie.gif?raw=true" width="300"> | <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/Favorites-edit.gif?raw=true" width="300">|


## Error Handling 

| No input                                   | Invalid inputs & Requests Errors              | Empty States.                                 |
| ------------------------------------------ | --------------------------------------------- | --------------------------------------------- |
| <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/Screen%20Recordings/error.gif?raw=true" width="300"> | <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/error2.jpg?raw=true" width="300">| <img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/emptyState.jpg?raw=true" width="300"> |

## Dark Mode Compatability 
<img src="https://github.com/dhruvshah8/GitHubProfiles/blob/master/ScreenShots/darkMode.png?raw=true" width="500">
