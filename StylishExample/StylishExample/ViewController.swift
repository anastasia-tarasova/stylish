//
//  ViewController.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 30/10/2017.
//  Copyright © 2017 DSR. All rights reserved.
//

import UIKit
import SwiftStylish

class ViewController: UIViewController
{
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet weak var labelWithSystemFont: UILabel!
    
    @IBOutlet weak var labelWithCustomFont: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         self.labelWithCustomFont.applyStyleClass(byName: ".fontWithDescriptor", filename: "FontStyles")
         self.labelWithSystemFont.applyStyleClass(byName: ".systemFontWithDescriptor", filename: "FontStyles")
        
        self.topButton.applyStyleClass(byName: ".coloredStaticImageButton", filename: "ImageStyles")
        
        let image = UIImage(named: "confirm")
        self.bottomButton.setImage(image, for: .normal)
        self.bottomButton.setImage(image, for: .selected)
        self.bottomButton.setImage(image, for: .highlighted)
        self.bottomButton.applyStyleClass(byName: ".coloredDynamicImageButton", filename: "ImageStyles")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

