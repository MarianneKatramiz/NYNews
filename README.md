# NYNews
This app shows the Most Popular News of New York City

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software

```
Mac
Xcode 12
```

### Libraries

The Libraries that were used to make this app work

```
SwiftLint: used for Swift style and conventions
Alamofire: used to perform api calls
Kingfisher: used for downloading images from URL
RxCocoa: Reactive Programming
RxSwift: Reactive Programming
SwiftMessages: used to show flexible message bar
Toast-Swift: used to show toast notifications
```

### Design Pattern

The design pattern that is used in this project is MVVM-C

```
The Model represents the Objects that contain the Data

The View represents the Objects that show the Data to the User interface

The VM or ViewModel represents the Objects that transfer the Data from/to the Model and View

The C or coordinator that controls the flow of the App
```

## Main features

- Supports Light and Dark theme


### Installing

A step by step series that tell you how to get a development env running

Step 1: Installing Cocoapods

```
Open Terminal:
$ sudo gem install cocoapods
```

Step 2: Clone or Download the Project 

```
Clone using any Git Source IDE
Or
Download the project directly from GitHub
```

Step 3: Install Pods of the Project 

```
Open Terminal:
cd {your project path that contains the Podfile file}
pod install
```

Step 4: Run your project

```
Open the workspace file of the project in Xcode
Run the project
```

## Running the tests

From the Test Navigator in Xcode

### Unit Tests

These tests will run the Apis that the app uses and save the results into the DB

```
testGetNews
testGetNewsSeven
testGetNewsThirty
```

## Author

* **Marianne Katramiz** - *Senior iOS Developer*
