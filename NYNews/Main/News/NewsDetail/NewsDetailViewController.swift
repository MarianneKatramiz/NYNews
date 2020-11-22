//
//  NewsDetailViewController.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit

class NewsDetailViewController: BaseViewController {
    
    // The View Model that contains the business of the Controller
    var viewModel: NewsDetailViewModel!
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font      = UIFont.systemFont(ofSize: 20)
            titleLabel.textColor = UIColor.blackColor
        }
    }
    @IBOutlet weak var byLineLabel: UILabel! {
        didSet {
            byLineLabel.font      = UIFont.systemFont(ofSize: 15)
            byLineLabel.textColor = UIColor.grayColor
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font      = UIFont.systemFont(ofSize: 12)
            dateLabel.textColor = UIColor.lightGrayColor
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font      = UIFont.systemFont(ofSize: 17)
            descriptionLabel.textColor = UIColor.blackColor
        }
    }
    @IBOutlet weak var sourceLabel: UILabel! {
        didSet {
            sourceLabel.font      = UIFont.systemFont(ofSize: 15)
            sourceLabel.textColor = UIColor.blackColor
        }
    }

    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.setTitle(Constants.Strings.viewMoreButton, for: .normal)
            moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupViews() {
        super.setupViews()
        
        // Nav title
        self.navigationItem.title = Constants.Strings.newsDetailPageTitle

        // Load News Detail
        loadNewsDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func loadNewsDetail() {
        guard let newsDetail = viewModel.newsDetail else {
            return
        }
        
        // Set News detail
        titleLabel.text       = newsDetail.title
        byLineLabel.text      = newsDetail.byline
        dateLabel.text        = newsDetail.published_date
        descriptionLabel.text = newsDetail.description
        sourceLabel.text      = newsDetail.source
        
        // Set Image
        let media = newsDetail.media ?? []
        if media.count != 0 {
            let mediaItem = media[0]
            let mediaMetadata = mediaItem.mediaMetadata ?? []
            if mediaMetadata.count != 0 {
                var link = ""
                for mediaMetadataItem in mediaMetadata
                    where mediaMetadataItem.format == format_media.medium440.rawValue {
                        link = mediaMetadataItem.url ?? ""
                }
                
                if !link.isEmpty {
                    let url = URL(string: link)
                    newsImage.kf.setImage(with: url,
                                          placeholder: UIImage.defaultImage,
                                          options: [
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(0.3)),
                                            .cacheOriginalImage],
                                          progressBlock: nil) { (image, error, _, _) in
                        if error != nil {
                            self.newsImage.image = UIImage.defaultImage
                        } else {
                            let ratio     = (image?.size.width ?? 0) / (image?.size.height ?? 0)
                            let newHeight = self.newsImage.frame.width / ratio
                            self.imageHeight.constant = newHeight
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func viewMore(_ sender: Any) {
        guard let urlString = viewModel.newsDetail.url, let url = URL(string: urlString) else {
            return
        }
        
        // Open the URL in the external browser
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
