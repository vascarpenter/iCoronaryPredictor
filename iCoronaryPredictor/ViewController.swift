//
//  ViewController.swift
//  iCoronaryPredictor
//
//  Created by Namikare Gikoha on 2018/10/22.
//  Copyright © 2018 gikoha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let risk_thrombus: [Int] = [2,2,2,2,1,1,1,1,0,0,0]
    let risk_bleed: [Int] =    [2,1,2,0,0,2,0,0,2,1,1]
    let titles: [String] = ["腎不全", "心房細動","末梢血管障害","貧血Hb<11","年齢>=75","心不全","糖尿病","CTO",
                            "Plt低下<10万","MIの既往","悪性腫瘍"]
    let severities: [String] = ["低リスク","中等度リスク","高リスク"]
    let percentage_3years_thrombus:[Float] = [2.4, 3.7, 7.6]
    let percentage_3years_bleed:[Float]    = [2.3, 4.1, 8.8]

    var cbarray: [Checkbox] = []
    @IBOutlet var thrombusField: UILabel!
    @IBOutlet var bleedField: UILabel!
    @IBOutlet var cum3ythrombusField: UILabel!
    @IBOutlet var cum3ybleedField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var i = 0
        for title in titles
        {
            let x = 10 + (i % 2) * 140
            let y = 70 + (i / 2) * 30
            let btn: Checkbox = Checkbox(frame: CGRect(x: x, y: y, width: 20, height: 20))
            btn.checkmarkStyle = Checkbox.CheckmarkStyle.tick
            btn.checkmarkSize = 0.7
            self.view.addSubview(btn)
            
            let lbl: UILabel = UILabel(frame: CGRect(x: x + 30, y: y, width: 100, height: 20))
            lbl.text = title
            lbl.font = UIFont.systemFont(ofSize: 12)
            self.view.addSubview(lbl)
            
            cbarray.append(btn)
            i += 1
        }
    }
    @IBAction func calcButton(_ sender: Any)
    {
        var s_thrombus = 0
        var s_bleed = 0
        var i = 0
        for cb in cbarray
        {
            if(cb.isChecked)
            {
                s_thrombus += risk_thrombus[i]
                s_bleed += risk_bleed[i]
            }
            i += 1
        }
        var str: String = String(s_thrombus)+"pt "
        var r_thrombus = 0
        var r_bleed = 0

        switch(s_thrombus)
        {
        case 0...1: r_thrombus = 0
        case 2...3: r_thrombus = 1
        default:   r_thrombus = 2
        }
        str = str + severities[r_thrombus]
        thrombusField.text = str
        
        str = String(s_bleed)+"pt "
        switch(s_bleed)
        {
        case 0:    r_bleed = 0
        case 1...2: r_bleed = 1
        default:   r_bleed = 2
        }
        str = str + severities[r_bleed]
        bleedField.text = str

        cum3ythrombusField.text = String(percentage_3years_thrombus[r_thrombus]) + "%"
        cum3ybleedField.text = String(percentage_3years_bleed[r_bleed]) + "%"
    }

}

