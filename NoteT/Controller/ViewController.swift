//
//  ViewController.swift
//  NoteT
//
//  Created by Karol Zmyslowski on 09.02.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import CoreData
import TextFieldEffects

class ViewController: UIViewController, NSFetchedResultsControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var testlabel: UILabel!
    @IBOutlet weak var paramsTF: MadokaTextField!
    @IBOutlet weak var leftLng: UILabel!
    @IBOutlet weak var rightLng: UILabel!
    
    var source:String!
    var targer:String!
    var testLb:String!
     var controller : NSFetchedResultsController<Word>!
    override func viewDidLoad() {
        super.viewDidLoad()
        attemptFetch()
        chechSourceTarger()
        paramsTF.delegate = self

    }


    @IBAction func test(_ sender: Any) {
        chechSourceTarger()
        let params = ROGoogleTranslateParams(source: source,
                                             target: targer,
                                             text:   paramsTF.text!)
        
        let translator = ROGoogleTranslate()
        translator.apiKey = "AIzaSyB_h42KeD9-XlyaTEFrSwCLKzKoLZJ1Uo8"
        
        translator.translate(params: params) { (result) in
            print("Translation: \(result)")
            DispatchQueue.main.async {
            self.testlabel.text = "\(result)"
            self.testLb = self.testlabel.text
            }
        }
    }
        @IBAction func addBtn(_ sender: Any) {
       
        let title = paramsTF.text
        
        if title == testLb {
        //ALERT
        
            let alert = UIAlertController(title: "Błąd", message: "Tłumaczony test jest taki sam jak odpowiedz, chcesz dodać słowo", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "Nie", style: .cancel, handler: nil)
            let action2 = UIAlertAction(title: "Tak", style: .destructive, handler: { (action) in
                let word = Word(context: context)
                
                word.title = title
                word.from = self.source
                word.toTranslate = self.targer
                word.translate = self.testLb
                
                ad.saveContext()
            })
            alert.addAction(action1)
            alert.addAction(action2)
            present(alert, animated: true, completion: nil)
            
            
            
            
            
            
            
        } else {
            let word = Word(context: context)
            
            word.title = title
            word.from = source
            word.toTranslate = targer
            word.translate = testLb
            
            ad.saveContext()
        }
    }
    
    func attemptFetch(){
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        let titleSort = NSSortDescriptor(key: "title", ascending: true)
            fetchRequest.sortDescriptors = [titleSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        self.controller = controller
        
        do {
            try self.controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
        
    }
    
    func chechSourceTarger() {
        if leftLng.text == "English" && rightLng.text == "Polish"{
            source = "en"
            targer = "pl"
        } else {
            source = "pl"
            targer = "en"
        }
        
    }
    @IBAction func changeSourceAndTarget(_ sender: Any) {
        let tmp = leftLng.text
        leftLng.text = rightLng.text
        rightLng.text = tmp
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    


