//
//  ChooseActivityViewController.swift
//  WorkyTracky
//
//  Created by Intan Yoshana on 09/04/20.
//  Copyright © 2020 AppleAcademy. All rights reserved.
//

import UIKit

class ChooseActivityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.barStyle = .black
        navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.1098963395, green: 0.1775904596, blue: 0.3365493119, alpha: 1)
        navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController!.navigationBar.isTranslucent = true
     
//        let segmentBarItem = UIBarButtonItem(customView: segmentedControl)
//        navigationItem.rightBarButtonItem = segmentBarItem
//        // Do any additional setup after loading the view.
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
