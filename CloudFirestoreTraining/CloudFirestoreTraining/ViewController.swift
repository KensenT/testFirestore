//
//  ViewController.swift
//  CloudFirestoreTraining
//
//  Created by Kensen Tjoa on 09/01/19.
//  Copyright © 2019 Kensen Tjoa. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let db = Firestore.firestore()
        db.collection("users").whereField("fullName", isEqualTo: "Kensen").getDocuments { (snapshot, error) in
            if error != nil {
                print(error)
            } else {
                for document in (snapshot?.documents)! {

                    if let name = document.data()["fullName"] as? String {
                        if let username = document.data()["username"] as? String {
                            print("aaaaa", name, username)
                        }
                    }
                }
            }
        }
//        let name = "Tony"
//        let age = "20"
//        let dict: [String:Any] = ["name": name,
//                                  "age": age]
//        db.collection("users").addDocument(data: dict)
    }


}

