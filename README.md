# Pre-work - *TipCalc*

**TipCalc** is a tip calculator application for iOS.

Submitted by: **Andy Duong**

Time spent: **55** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [ ] UI animations.
* [ ] Remembering the bill amount across app restarts (if <10mins).
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

// List anything else that you can get done to improve the app functionality!

* [X] Adding a slider bar option to accomodate a larger range of tip percentages.
* [X] Splitting the total amount among a party.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/a/57E2u.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

// Describe any challenges encountered while building the app.

My first step in creating this application was following the provided tip calculator walkthrough step-by-step. Although it was simple to find the right buttons on Xcode, and I was able to create the basic tip calculator, I felt uneasy because I didn't quite truly understand the inner-workings of the code and the connections made in the Interface Builder. To address this concern, I compiled a list of iOS Swift tutorials that I found online. I started with the Apple Developer Guide's meal prep app tutorial. The content was confusing, which discouraged me from continuing through the tutorial. I called up one of my close friends, who shared my passion for programming, and we came up with an idea for a Whack-a-mole spinoff. We both knew that we didn't have enough experience to create this application yet, so we've been meeting at least 2 times a week over the winter break to work on iOS programming tutorials together. Having an end goal in mind that we both support and working together has motivated us to persevere through the struggles of iOS programming. The most time-consuming concept of this process was understanding some key concepts in iOS programming, such as the difference between a delegate and an IBAction, transferring data between view controllers, and the timing of different function calls. I found myself looking through many StackOverflow threads in search of an answer that made sense. To implement the settings page, I looked through many similar examples, both written in Objective-C and in Swift, and I tried to adopt the structure of the code to fit my application. However, adopting the stucture without knowing what the code is doing is prone to error. This led me to spend long nights just trying to understand and debug my code, only to find that the solution was in a single line. However, I feel accomplished that I resolved that bug because I gained a better understanding of my code from debugging.

## License

Copyright 2017 Andy Duong

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
