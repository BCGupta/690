//
//  addViewController.swift
//  TasksApp
//
//  Created by Shubham Gupta on 10/30/18.
//  Copyright © 2018 Shubham Gupta. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var entryText: UITextView!
    @IBAction func exitView(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addEntryButton(_ sender: UIButton)
    {
        
        guard let textEntered = entryText?.text else
        {
            return
        }
        
        if textEntered.isEmpty || entryText?.text == "Type here.."
        {
            
            let alert = UIAlertController(title: "Type in box", message: "Entry is Blank.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it", style: .default) { action in
                
            })
            
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            
            guard let textEntry = entryText?.text else{
                return
            }
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newEntry = Item(context: context)
            newEntry.task = textEntry
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryText?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
