//
//  Log.swift
//  CheckList app
//
//  Created by Ernest Essuah Mensah on 4/19/20.
//  Copyright © 2020 Ernest Essuah Mensah. All rights reserved.
//

import Foundation


public enum Screens: String {
    
    case mainScreen = "Main_Screen",
    teachScreen = "Teach_Screen",
    editNewObjScreen = "Edit_New_Object_Screen",
    savedObjsScreen = "Saved_Objects_Screen",
    objScreen = "Object_Screen",
    editSavedObjScreen = "Edit_Saved_Object_Screen",
    helpScreen = "Help_Screen",
    reviewScreen = "Review_Screen"
}

// All actions that can be perfomed by a user
public enum Actions: String {
    
    case tappedOnBtn = "action= tapped_on_button",
    deletedObj = "action= deleted_object",
    savedNewObj = "action= saved_new_object",
    trainingBegan = "action= training_began",
    trainingEnded = "action= training_ended",
    trainingSuccessful = "training_successful= ",
    recognitionBegan = "action= recognition_started",
    recognitionEnded = "action= recognition_ended",
    recognitionSuccessful = "recognition_successful= ",
    editedSavedObj = "action= edited_saved_object",
    renamedSavedObj = "action= renamed_saved_object",
    recordedAudio = "action= recorded_audio",
    modifiedAudio = "action= modified_recording",
    modificationSuccessful = "modification_successful= ",
    enteredText = "action= entered_text",
    enteredScreen = "entered_screen= ",
    exitedScreen = "exited_screen= ",
    appTerminated = "action= app_terminated",
    appLaunched = "action= app_launched",
    voiceOver = "voice_over_text= ",
    photoTaken = "action=photo_taken",
    getImageDescriptor = "action=get_image_descriptor",
    getSetDescriptor = "action=get_set_descriptor",
    checkTraining = "action=check_training"
}


class Log {
    
    var num = 0
    static var userUUID = ""
//    static var participantID = "" // use userUUID instead of participantID
    static var sessionID = ""
    static var userDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    // Logs the user's activity to the log file
    static func writeToLog(_ text: String) {
        let file = "Log_\(userUUID).txt"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(userUUID).appendingPathComponent(file)
            do {
                // Create Date object
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSSS"
                let millis = Int(date.timeIntervalSince1970*1000)
                let dateString = formatter.string(from: date)
                
                var textData: Data!
                //let sessionID = UserDefaults.standard.value(forKey: "sessionID") as? String
                let header = "user= \(userUUID), participantID= \(userUUID), sessionID= \(sessionID)"
                
                if text == Actions.appTerminated.rawValue {
                    
                    textData = "\(header), \(text), time=\(dateString) \(millis)\n".data(using: String.Encoding.utf8)!
                    textData += "\nEND OF SESSION \(sessionID)\n-----------------------------------------------------\n\n".data(using: String.Encoding.utf8)!
                    
                } else {
                    
                    textData = "\(header), \(text), time=\(dateString) \(millis)\n\n".data(using: String.Encoding.utf8)!
                    
                }
                
                if let fileHandle = try? FileHandle(forWritingTo: fileURL) {
                    defer {
                        fileHandle.closeFile()
                    }

                    fileHandle.seekToEndOfFile()
                    fileHandle.write(textData)
                } else {
                    try textData.write(to: fileURL)
                }
            } catch {
                print("write log error \(error)")
            }
        }
        
    }
    
    static func createUserDir() {
        Log.userDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("\(Log.userUUID)")
        var isDirectory = ObjCBool(true)
        if !FileManager.default.fileExists(atPath: Log.userDirectory.path, isDirectory: &isDirectory) {
            do {
                try FileManager.default.createDirectory(atPath: Log.userDirectory.path, withIntermediateDirectories: true, attributes: nil)
                print("directory is created. \(Log.userDirectory.path)")
            } catch let error as NSError {
                print("Error creating directory: \(error.localizedDescription)")
            }
        } else {
            print("The directory exists. \(Log.userDirectory.path)")
        }
    }
    
    
}


