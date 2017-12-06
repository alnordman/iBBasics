//
//  ViewController.swift
//  iBBasics
//
//  Created by Alexander Nordman on 11/27/17.
//  Copyright © 2017 Alexander Nordman. All rights reserved.
//

import UIKit

class SwiftFile: UIViewController {
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
    
    
    
    @IBAction func plus10(_ sender: Any) {
        if(counter >= 10)
        {
            increment += 10
            counter -= 10
            
        }
    }
    
    @IBAction func plus100(_ sender: Any) {
        if(counter >= 1000)
        {
            increment += 1000
            counter -= 1000
        }
    }
    
    @IBAction func plus1000(_ sender: Any) {
        if(counter >= 100000)
        {
            increment += 100000
            counter -= 100000
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Segue")
        if(segue.identifier == "DStorington" || segue.identifier == "Backington"){
            if let nextVC = segue.destination as? ViewController {
                nextVC.increment = increment
                nextVC.counter = counter
            }
        }
    }
    
    func save(){
        defaults.set(counter,forKey: "cookie.counter")
        defaults.set(increment,forKey: "cookie.increment")
    }
}


