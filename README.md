# Pre-work - Tippy
Tippy is a tip calculator application for iOS.

Submitted by: alan

Time spent: **X** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ x] Remembering the bill amount across app restarts (if <10mins)
* [ x] Using locale-specific currency and currency thousands separators.
* [ x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ x] Allow change color theme in settings. List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/3FcYuLA' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")
Developing on iOS platform is not bad as many resources and guides exist. xcode is also good about autocorrecting syntax and usage. Outlets allow elements to be referenced in code to change appearance and properties. Actions are for passing messages to the controller as a result of a trigger from the UI element. Viewing the storyboard as Source, shows a DOM-like structure which leads me to think it is implemented in a fashion similar to web pages, where UI elements are ordered in a tree-like structure, with appropriate listeners to pass data to a controller.

**Answer:** [Enter your answer here in a paragraph or two].

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** [Enter your answer here in a paragraph or two].
Strong reference cycles for closures will occur when the closure references either a property or method of the outer instance. This is because closures are reference types and so is able to keep a class instance alive as a normal reference would. This is referred to as a closure "capturing" self. When a closure "Captures" self, it holds a strong reference to its class instance.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
