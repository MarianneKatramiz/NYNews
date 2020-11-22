//
//  EmptyTableViewCell.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    static var identifier = "EmptyTableViewCell"
    static var nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var titleLabel: UILabel? {
        didSet {
            titleLabel?.font = UIFont.systemFont(ofSize: 17)
            titleLabel?.textColor = UIColor.blackColor
            titleLabel?.textAlignment = .center
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle  = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
