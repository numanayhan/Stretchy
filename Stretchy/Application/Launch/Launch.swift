//
//  Launch.swift
//  Stretchy
//
//  Created by na on 5.01.2023.
//

import UIKit

class Launch: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.pushViewController(Dashboard(), animated: true)
    }

}
