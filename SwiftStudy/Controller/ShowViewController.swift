//
//  ShowViewController.swift
//  SwiftStudy
//
//  Created by 河村大介 on 2021/05/11.
//

import UIKit

class ShowViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var memoList: [[Any]] = []
    var indexPathRow: Int? = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = (memoList[indexPathRow!][0] as! String)
        bodyLabel.text = (memoList[indexPathRow!][1] as! String)
    }
    
    @IBAction func editMemo(_ sender: Any) {
        performSegue(withIdentifier: "editMemo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! EditViewController
        editVC.indexPathRow = self.indexPathRow
    }
    
}

