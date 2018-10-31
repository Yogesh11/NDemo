//
//  ViewController.swift
//  SampleProj
//
//  Created by Yogesh on 10/22/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var tableLayout: UITableView!
    var viewModel : ViewModel  = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeTableViewProps()
        fetchData()
    }

    /// initialize TableView props
    private func initializeTableViewProps(){
        tableLayout.tableFooterView = UIView(frame: .zero)
        tableLayout.delegate        = self
        tableLayout.dataSource      = self
    }

    /// Get Data
    private func fetchData(){
         SVProgressHUD.setDefaultMaskType(.clear)
         SVProgressHUD.show()
         viewModel.fetchData { (json, error) in
            if let err = error {
                self.showOkAlert(message: err.errorMessage, title: err.errortitle)
            }else{
                self.refreshTable()
            }
            SVProgressHUD.dismiss()
         }
    }

    private func refreshTable(){
        tableLayout.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
   internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userModels.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return UITableViewCell()
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

