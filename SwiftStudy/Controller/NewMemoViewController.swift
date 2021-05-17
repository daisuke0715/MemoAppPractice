//
//  NewMemoViewController.swift
//  SwiftStudy
//
//  Created by 河村大介 on 2021/05/10.
//

import UIKit

class NewMemoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var newBody: UITextView!

    var createdMemo: [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTitle.delegate = self
    }
    
    @IBAction func createMemo(_ sender: Any) {
        // メモの内容を保存する
        if let text = newTitle.text, let body = newBody.text {
            createdMemo.append((text, body))
        }
       
        let alert = UIAlertController(title: "保存", message: "保存が完了されました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("OKボタンが押されました。")
            self.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true, completion: nil)
        
        let homeNC = self.presentingViewController as! UINavigationController
        let homeVC = homeNC.viewControllers[homeNC.viewControllers.count - 1] as! ViewController
        homeVC.memoList.append(contentsOf: createdMemo)
        print(homeVC.memoList)
        homeVC.tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
