//
//  PostViewController.swift
//  DemoDatabase
//
//  Created by Theeruth Borisuth on 7/2/19.
//  Copyright © 2019 Theeruth Borisuth. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {
    var ref:DatabaseReference?
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var descText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPost(_ sender: Any) {
        //add file to database
        if let newPost = ref?.child("Posts").childByAutoId(){
            let id = newPost.key
            ref?.child("Posts").child(id!).child("title").setValue(titleText.text!)
            ref?.child("Posts").child(id!).child("desc").setValue(descText.text!)
        } else {
            print("error")
        }
//        ref?.child("Posts").child("first").child("second").child("third").setValue("Hello")
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
