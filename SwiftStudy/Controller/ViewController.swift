//
//  ViewController.swift
//  SwiftStudy
//
//  Created by 河村大介 on 2021/05/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // メモ一覧
    var memoList: [[Any]] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print(memoList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


    
    @IBAction func newMemo(_ sender: Any) {
        performSegue(withIdentifier: "newMemo", sender: nil)
    }
    
    // セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
    
    // セルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
        let titleLabel: UILabel = cell.contentView.viewWithTag(1)! as! UILabel
        let bodyLabel: UILabel = cell.contentView.viewWithTag(2)! as! UILabel
        
        if memoList != nil {
            titleLabel.text = (memoList[indexPath.row][0] as! String)
            bodyLabel.text = (memoList[indexPath.row][1] as! String)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "memoDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memoDetail" {
            let showVC = segue.destination as! ShowViewController
            showVC.memoList = self.memoList
            showVC.indexPathRow = (sender as! Int)
        }
    }
    
    
    
    
}

