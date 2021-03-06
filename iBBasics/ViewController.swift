//
//  ViewController.swift
//  iBBasics
//
//  Created by Alexander Nordman on 11/27/17.
//  Copyright © 2017 Alexander Nordman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard

    var counter = 0
    var increment = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        counter = defaults.integer(forKey:"cookie.counter")
        increment = defaults.integer(forKey:"cookie.increment")
        if(increment == 0)
        {
            increment = 1
        }
    }
    
    override func loadView() {
        super.loadView()
        counter = defaults.integer(forKey:"cookie.counter")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BigBadButton(_ sender: Any) {
        counter += increment
        LabelAF.text = String(counter)
        save()
        
    }
    
    @IBOutlet weak var LabelAF: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Segue")
        if(segue.identifier == "DStorington" || segue.identifier == "Backington"){
            if let nextVC = segue.destination as? ViewController {
                nextVC.increment = increment
                nextVC.counter = counter
            }
        }
    }
    
    @IBOutlet weak var PressTheButton: UILabel!
    
    func save(){
        defaults.set(counter,forKey: "cookie.counter")
        defaults.set(increment,forKey: "cookie.increment")
    }
}

