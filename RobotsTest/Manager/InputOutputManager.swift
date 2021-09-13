//
//  InputOutputManager.swift
//  RobotsTest
//
//  Created by Robert Redmond on 13/09/2021.
//

import Foundation

// we could in the future want to get the string or save the string from a service or a database so we are neutral on the type of input output manager so long as it implements this protocol
protocol InputOutputManager{
    
    func stringForParsing() -> String?
    
    func save(string: String) -> Bool
}

// this class manages all the file operations
class FileInputOutputManager: InputOutputManager{
    let inputFileName: String
    let outputFileName: String
    
    init(inputFileName: String, outputFileName: String) {
        self.inputFileName = inputFileName
        self.outputFileName = outputFileName
    }
    
    func stringForParsing() -> String? {
        guard let path = Bundle.main.path(forResource: inputFileName, ofType: "txt") else {
            debugPrint("no file exists at this loocation")
            return nil
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return text
            
        } catch {
            debugPrint("Failed to read text from \(path)")
            return nil
        }
    }
    
    func save(string: String) -> Bool {
        let filename = getDocumentsDirectory().appendingPathComponent(outputFileName)
        do {
            try string.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            return false
        }
        return true

    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

