//
//  TableViewCellCustom.swift
//  WebserviceDemo
//
//  Created by ThietTB on 3/2/18.
//  Copyright © 2018 bipbipdinang. All rights reserved.
//

import UIKit

class TableViewCellCustom: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var items: Items? {
        didSet{
            guard let name = items?.full_name, let des = items?.description else { return }
            title.text = name
            descriptions.text = des
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
