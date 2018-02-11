//
//  Word+CoreDataProperties.swift
//  
//
//  Created by Karol Zmyslowski on 10.02.2018.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var title: String?
    @NSManaged public var from: String?
    @NSManaged public var to: String?
    @NSManaged public var translate: String?

}
