//
//  NewsListTableViewCell.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    static var identifier = "NewsTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 17)
            titleLabel.textColor = UIColor.blackColor
        }
    }
    @IBOutlet weak var byLineLabel: UILabel! {
        didSet {
            byLineLabel.font = UIFont.systemFont(ofSize: 15)
            byLineLabel.textColor = UIColor.grayColor
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.systemFont(ofSize: 12)
            dateLabel.textColor = UIColor.lightGrayColor
        }
    }
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = img.frame.height / 2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadNews(_ newsDetail: NewsDetailModel) {

        titleLabel.text  = newsDetail.title
        byLineLabel.text = newsDetail.byline
        dateLabel.text   = newsDetail.published_date
        
        let media = newsDetail.media ?? []
        if media.count != 0 {
            let mediaItem = media[0]
            let mediaMetadata = mediaItem.mediaMetadata ?? []
            if mediaMetadata.count != 0 {
                var link = ""
                for mediaMetadataItem in mediaMetadata
                 where mediaMetadataItem.format == format_media.standard_Thumbnail.rawValue {
                    link = mediaMetadataItem.url ?? ""
                }
                
                if !link.isEmpty {
                    let url = URL(string: link)
                    img.kf.setImage(with: url, placeholder: UIImage.defaultImage)
                }
            }
        }
    }
}
