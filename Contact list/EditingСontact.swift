//
//  EditingСontact.swift
//  Contact list
//
//  Created by Yerzhan Parimbay on 07.10.2026.
//

import Foundation

import UIKit

class EditingСontact: UIViewController {
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editSurname: UITextField!
    @IBOutlet weak var editPhoneNumber: UITextField!
    
    var selectedIndex = 0                        //Переменная, в которую мы должны будем передать индекс элемента из массива arrayContacts
    var correctedContacts: [Contact] = []        //Это можно сказать второй массив, который мы приравняли к arrayContacts в TableViewController
    var onSave: TableViewController?             //onSave мне нужен, чтобы была связь с этого экрана к экрану TableViewController
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        editName.text = correctedContacts[selectedIndex].name
        editSurname.text = correctedContacts[selectedIndex].surname
        editPhoneNumber.text = correctedContacts[selectedIndex].phoneNumber   // Здесь мы просто передали данные с массива в ячейка TextField
        
    }

    @IBAction func editingContact(_ sender: Any) {
        correctedContacts[selectedIndex].name = editName.text ?? ""
        correctedContacts[selectedIndex].surname = editSurname.text ?? ""
        correctedContacts[selectedIndex].phoneNumber = editPhoneNumber.text ?? ""
        
        onSave?.arrayContacts = correctedContacts    //Подкорректированные данные мы обратно передали в массив arrayContacts и сохранили контакт через фукнцию saveContact()
        onSave?.saveContact()
        onSave?.tableView.reloadData()   //Сразу обновили экран TableViewController, чтобы потом между экранами не прыгать для обновления
    }
    
}
