//
//  ChecklistTableViewCell.swift
//  CheckList app
//
//  Created by Jaina Gandhi on 5/6/18.
//  Copyright © 2018 Jaina Gandhi. All rights reserved.
//

import UIKit

protocol ChecklistTableViewCellDelegate {
    func didTapOnCell(cell: ChecklistTableViewCell)
}

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDate: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    var delegate: ChecklistTableViewCellDelegate?
    var util = Util()
    
    var item: Item? {
        
        didSet {
            let name = Functions.separateWords(name: item!.itemName)
            itemName.text = name
            itemDate.text = item?.relativeDate
            
            let imgPath = util.userDirectory.appendingPathComponent("\(item?.itemName ?? "")/1.jpg")
            //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            if let data = try? Data(contentsOf: imgPath) {
                itemImage.image = UIImage(data: data)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.addShadow()
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnCell)))
    }
    
    @objc
    func handleTapOnCell() {
        delegate?.didTapOnCell(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
