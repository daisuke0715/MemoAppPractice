//
//  EditViewController.swift
//  SwiftStudy
//
//  Created by 河村大介 on 2021/05/11.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    var memoList: [(String, String)] = []
    var indexPathRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let index = (self.navigationController?.viewControllers.count)! - 3
        let homeVC = navigationController!.viewControllers[index] as! ViewController
        self.memoList = homeVC.memoList
        titleTextField.text = self.memoList[indexPathRow].0
        bodyTextField.text = self.memoList[indexPathRow].1
        self.view.addBackground(name: "background")
    }
    
    @IBAction func update(_ sender: Any) {
        let index = (self.navigationController?.viewControllers.count)! - 3
        let homeVC = navigationController!.viewControllers[index] as! ViewController
        
        if let title = titleTextField.text, let body = bodyTextField.text {
            homeVC.memoList[indexPathRow].0 = title
            homeVC.memoList[indexPathRow].1 = body
        }
        
        let alert = UIAlertController(title: "保存", message: "保存が完了されました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("OKボタンが押されました。")
            let index = (self.navigationController?.viewControllers.count)! - 3
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[index])!, animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    

}
