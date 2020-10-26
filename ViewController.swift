//
//  ViewController.swift
//  TexviewDisplay
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 Ngoc. All rights reserved.
//

import UIKit

struct DataModel {
    var reasonID: Int
    var dateTime: String
    var comentUser: String
    var comentContent: String
    
    
    func toString() -> String {
        var finalStr = ""
        finalStr = "- " + "\(reasonID) : " + dateTime + ": " + comentUser + ": " + comentContent + ";" + "\n"
        return finalStr
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    
    var resultStr = ""
    let listContent = [
        DataModel(reasonID: 192, dateTime: "24/6/2020 5:00", comentUser: "Tms_Hadong", comentContent: "test1"),
        DataModel(reasonID: 193, dateTime: "25/7/2020 6:00", comentUser: "Tms_Hoalac", comentContent: "test2"),
        DataModel(reasonID: 194, dateTime: "26/8/2020 7:00", comentUser: "Tms_Donganh", comentContent: "test3"),
        DataModel(reasonID: 195, dateTime: "27/9/2020 8:00", comentUser: "Tms_HoanKiem", comentContent: "test4"),
        DataModel(reasonID: 196, dateTime: "28/10/2020 9:00", comentUser: "Tms_Longbien", comentContent: "test5"),
        DataModel(reasonID: 197, dateTime: "29/11/2020 10:00", comentUser: "Tms_cauGiay", comentContent: "test6"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.borderColor = UIColor.red.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5
        setupData()
    }
    
    func setupData() {
        listContent.forEach { (content) in
            resultStr += content.toString()
        }
        textView.text = resultStr
//        CGRect frame = self.textView.frame;
//        frame.size.height = self.textView.contentSize.height;
//        self.textView.frame = frame;
//        var frame = textView.frame
//        frame.size.height =
        heightConstant.constant = self.textView.contentSize.height
    }


    @IBAction func onAddAction(_ sender: Any) {
        let id = Int.random(in: 100...200)
        let dateCus = "24/6/2020 12:00"
        let content = UUID().uuidString.prefix(6)
        let content2 = UUID().uuidString.prefix(6)
        let newItem = DataModel(reasonID: id, dateTime: dateCus, comentUser: String(content), comentContent: String(content2))
        resultStr += newItem.toString()
        textView.text = resultStr
        heightConstant.constant = self.textView.contentSize.height
    }
}

