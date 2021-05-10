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
    
    var memoList: [[Any]] = []
    var indexPathRow: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let index = (self.navigationController?.viewControllers.count)! - 3
        let homeVC = navigationController!.viewControllers[index] as! ViewController
        self.memoList = homeVC.memoList
        titleTextField.text = (self.memoList[indexPathRow!][0] as! String)
        bodyTextField.text = (self.memoList[indexPathRow!][1] as! String)
    }
    
    
    @IBAction func update(_ sender: Any) {
        let index = (self.navigationController?.viewControllers.count)! - 3
        let homeVC = navigationController!.viewControllers[index] as! ViewController
        var updateMemo = homeVC.memoList[indexPathRow!]
        
        updateMemo[0] = titleTextField.text as Any
        updateMemo[1] = bodyTextField.text as Any
        
        let alert = UIAlertController(title: "保存", message: "保存が完了されました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("OKボタンが押されました。")
            let index = (self.navigationController?.viewControllers.count)! - 3
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[index])!, animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    

}
