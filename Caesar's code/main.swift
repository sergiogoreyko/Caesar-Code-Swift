//
//  main.swift
//  Caesar's code
//
//  Created by Сергей Горейко on 03/06/2020.
//  Copyright © 2020 Сергей Горейко. All rights reserved.
//

import Foundation

let alph = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var new_alph = alph


func getIndex(symbol: String) -> Int {
    for j in 0..<alph.count {
        if (alph[j] == symbol) {
            return j
        }
    }
    return 0
}

func encrypt() {
    
    print("Enter key:")
    let key = Int(readLine()!)!

    print("Enter message:")
    var message = Array(String(readLine()!).uppercased())
    print("----------------------------------------------------------------------------------------------------------------------------------")
    
    for i in 0..<message.count {
        if (message[i] == " " || message[i] == "." || message[i] == "," || message[i] == "!" || message[i] == "?") { continue }
        let index = getIndex(symbol: String(message[i]))
        message[i] = Character(alph[(index + key) % alph.count])
    }
    
    for item in 0...25 {
        let index = getIndex(symbol: alph[item])
        new_alph[index] = alph[(index + key) % alph.count]
    }
        
    print(alph)
    print(new_alph)
    print("----------------------------------------------------------------------------------------------------------------------------------")
    print("Resullt:")
    print(String(message))
    print("----------------------")
}

func decrypt() {
    
    print("Enter key:")
    let key = Int(readLine()!)!

    print("Enter message:")
    var message = Array(String(readLine()!).uppercased())
    print("----------------------------------------------------------------------------------------------------------------------------------")

    for i in 0..<message.count {
        if (message[i] == " " || message[i] == "." || message[i] == "," || message[i] == "!" || message[i] == "?") { continue }
        let index = getIndex(symbol: String(message[i]))
        message[i] = Character(alph[(index - key + alph.count) % alph.count])
    }
    
    for item in 0...25 {
        let index = getIndex(symbol: alph[item])
        new_alph[index] = alph[(index + key) % alph.count]
    }
    
    print(new_alph)
    print(alph)
    print("----------------------------------------------------------------------------------------------------------------------------------")
    print("Resullt:")
    print(String(message))
    print("----------------------")
}

func hack() {
    
    print("Enter message for hacking:")
    let message = Array(String(readLine()!).uppercased())
    print("----------------------")
    
    for shift in 1..<alph.count {
        
        var messageCopy = message
        
        for i in 0..<message.count {
            if (message[i] == " " || message[i] == "." || message[i] == "," || message[i] == "!" || message[i] == "?") { continue }
            let index = getIndex(symbol: String(message[i]))
            messageCopy[i] = Character(alph[(index - shift + alph.count) % alph.count])
        }
        
        print("With shift: \(shift)   \(String(messageCopy))")
    }
}





print("Choose the command:\n1. Encrypt\n2. Decrypt\n3. Hack")
print("-----------------------")
let i = Int(readLine()!)!

switch i {
    case 1:
        encrypt()
    case 2:
        decrypt()
    case 3:
        hack()
    default:
        print("You entered the wrong command")
}
