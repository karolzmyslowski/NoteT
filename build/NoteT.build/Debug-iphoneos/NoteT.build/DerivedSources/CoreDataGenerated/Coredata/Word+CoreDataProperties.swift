//
//  Word+CoreDataProperties.swift
//  
//
//  Created by Karol Zmyslowski on 11.02.2018.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var from: String?
    @NSManaged public var title: String?
    @NSManaged public var toTranslate: String?
    @NSManaged public var translate: String?

}
