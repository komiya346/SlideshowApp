//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 越智三四郎 on 2022/06/16.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    var image:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = image

        // Do any additional setup after loading the view.
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
