//
//  ViewController.swift
//  Contact list
//
//  Created by Yerzhan Parimbay on 07.10.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addContact(_ sender: Any) {
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        let phoneNumber = phoneTextField.text!
        //Создание переменных для передачи данных из TextField-ов
        
        let newContact = Contact(name: name, surname: surname, phoneNumber: phoneNumber)
        //Переменная новый контакт, который подтягивают нашу структуру контакта и вводит туда данные из TextField-ов
        
        //Формат do-catch используется для безопасной обработки передаваемых данных
        do {
            if let data = UserDefaults.standard.data(forKey: "contactItemArray") {
                //Переменная data, в которую сохраняем через UserDefaults по ключу "contactItemArray"
                
                var array = try JSONDecoder().decode([Contact].self, from: data)
                
                array.append(newContact)
                //Создание нового элемента в массиве array
                
                let encodedata = try JSONEncoder().encode(array)
                UserDefaults.standard.set(encodedata, forKey: "contactItemArray")
                
            } else {
                
                let encodedata = try JSONEncoder().encode([newContact])
                
                UserDefaults.standard.set(encodedata, forKey: "contactItemArray")
            }
                    
        } catch {
            print("unable to encode \(error)")
        }
        
        
        nameTextField.text = ""
        surnameTextField.text = ""
        phoneTextField.text = ""
    }
    
}

