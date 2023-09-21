//
//  names.swift
//  JannatifarTinaFinal
//
//  Created by Tina Jannatifar on 12/4/22.
//

import Foundation
import IOSurface
//this class handles the info that must appear on the table view controller, including the name of the beaches

class names : NSObject
//add questions remove questions
{
    
    var currentIndex:Int?
    static let shared = names()
    override init()
    {
        currentIndex = 0
    }
    //array containing the names of 20 beaches
    var namesArray = [
        nameStruct(name:"Point Dume Beach"),
        nameStruct(name:"Malibu Beach"),
        nameStruct(name:"Topanga Beach"),
        nameStruct(name:"Santa Monica State Beach"),
        nameStruct(name:"Marina Beach"),
        nameStruct(name:"Big Rock Beach"),
        nameStruct(name:"Sunset Beach"),
        nameStruct(name:"Paradise Cove Beach"),
        nameStruct(name:"Veice Beach"),
        nameStruct(name:"Las Tunas Beach"),
        nameStruct(name:"Will Rogers State Beach"),
        nameStruct(name:"Rocky Beach"),
        nameStruct(name:"Ratner Beach"),
        nameStruct(name:"Malibu Lagoon State Beach"),
        nameStruct(name:"Dan Blocker Beach"),
        nameStruct(name:"Mothers Beach Beach"),
        nameStruct(name:"Corral State Beach"),
        nameStruct(name:"Pirate's Cove Beach Beach"),
        nameStruct(name:"El Matador Beach"),
        nameStruct(name:"El Segundo Beach"),
    ]
    //this function returns the names array in the specied index
    func namesArrayFucntion(at index: Int) -> nameStruct?
    {
        if(index>=0 && index<=namesArray.count){
            return namesArray[index]
        }
        return nameStruct(name: "h")
    }
    //this function returns the number of elements in the array
    func numberOfBeaches()->Int{
        return namesArray.count
    }
    //this function is to get the current index
    func beachAtIndex(at index: Int)->nameStruct{
        return namesArray[index]
    }
    
    
}
