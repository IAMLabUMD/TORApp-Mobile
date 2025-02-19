# MYCam Mobile Application
<a href="https://jonggi.github.io"><img src="https://img.shields.io/badge/contact-Jonggi Hong-blue.svg?style=flat" alt="Contact"/></a>
<a href="LICENSE.md"><img src="https://img.shields.io/badge/license-TBD-red.svg?style=flat" alt="License: TBD"/></a>
<img src="https://img.shields.io/badge/platform-ios-green"/> 
<img src="https://img.shields.io/badge/language-swift 4.0-lightblue"/>

The Swift 4.0 codes of the [MYCam app](https://github.com/IAMLabUMD/MYCam-Mobile). The MYCam mobile application includes user interfaces and communication with the Amorgos server in the IAM Lab.
The user interfaces consists of main screen, training, scanning, and a list of items as shown below. The user interface of the app was designed based on the screen size of iPhone 8.

You can access the codes here. [https://github.com/IAMLabUMD/MYCam-Mobile](https://github.com/IAMLabUMD/MYCam-Mobile)

<p align="center">
  <img src="Docs/overview.jpg" alt="Overview of the MYCam app">

(Click to see a bigger image)
</p>

## Requirements
In order to run the MYCam app, you will need to meet the following requirements:
```
- A Mac with Xcode 13.0 or later
- Git command line tools or a git source control client like Tower. 
- iOS 12.1 or later
- Download and run the MYCam server codes
```
MYCam server codes are [here](https://github.com/IAMLabUMD/MYCam-Server).

## Getting started
To build and run the MYCam app, please follow these steps,
1. Clone the repository. You can use the following command or GUI tools.
```
   git clone https://github.com/IAMLabUMD/MYCam-Mobile.git
```
2. Open the project in Xcode by selecting `MYCam-Mobile.xcworkspace`
3. Set your Apple account as a developer of the app in the Signing & Capabilities tab. Add and select your Apple account for 'Team' and use any name for 'Bundle identifier' (see the example below).

<p align="center">
  <img src="Docs/signing.png" alt="Signing and capabilities">

(Click to see a bigger image)
</p>

4. Connect an iPhone to your computer
5. Run the app

<p align="center">
  <img src="Docs/run.png" alt="Signing and capabilities">

(Click to see a bigger image)
</p>

## Structure of the app
The source codes are organized based on their functionalities (i.e., main screen, teach, scan, list of items, communication with the server, and logging). 

### Main screen
`MainViewController.swift`

<img src="Docs/Screenshots/main.PNG" width="25%" alt="main screen"> <img src="Docs/Screenshots/main_inprogress.PNG" width="25%" alt="main screen when training is in progress">

 


### Teach
`Teach MYCamVCs/ARViewController.swift`

`Teach MYCamVCs/ReviewTraining.swift`

`Teach MYCamVCs/TrainingVC.swift`

<img src="Docs/Screenshots/train_feedback.PNG" width="25%" alt="training interface with feedback"> <img src="Docs/Screenshots/train_review.PNG" width="25%" alt="review with attributes"> <img src="Docs/Screenshots/train_enter_name.PNG" width="25%" alt="enter the name of the object">

### Scan
`MainViewController.swift` (selecting the scan item button on the main screen)

<img src="Docs/Screenshots/scan.PNG" width="25%" alt="result of recognition">

### List of items
`View ItemVCs/ChecklistViewController2.swift`

`View ItemVCs/ItemAttrAndInfoVC.swift`

<img src="Docs/Screenshots/list.PNG" width="25%" alt="list of items"> <img src="Docs/Screenshots/list_info.PNG" width="25%" alt="information of an object"> <img src="Docs/Screenshots/list_info2.PNG" width="25%" alt="information of an object">

### Communication with the server
`Model/HTTPController.swift`: a class with functions to communicate with the Amorgos server (e.g., send an image, receiving the attributes of photos from the server)

### Logging
`Utilities/Log.swift`: logging the users' actions

## Publications
Under review

## Acknowledgement
This work is supported by NSF (#1816380) and NIDILRR (#90REGE0008).

## Contact
Jonggi Hong (Lead researcher) <jhong12@umd.edu>

Hernisa Kacorri (Principal investigator) <hernisa@umd.edu>
