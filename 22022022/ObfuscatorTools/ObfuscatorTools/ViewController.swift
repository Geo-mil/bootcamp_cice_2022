//
//  ViewController.swift
//  ObfuscatorTools
//
//  Created by Jorge Millan on 23/2/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Obfuscator().bytesByObfuscatingString(string: "a4b45e12e4b87a652657786085463ab7"))
        // Do any additional setup after loading the view.
    }


}

