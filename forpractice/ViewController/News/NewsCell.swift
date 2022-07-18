//
//  NewsCell.swift
//  forpractice
//
//  Created by Hankyu Lee on 2022/07/18.
//

import UIKit

class NewsCell: UITableViewCell {
    
    //MARK: - Properties
     var news: Article? {
        didSet {
            configure()
        }
    }
//    var news:news? {//올바른 정보가 출력되도록 해보자.
//        didSet{ configure() }//cell의 라벨에 정보채우기.
//        //didset 뭔가 받으면 실행됨.
//    }
    
//    private let profileImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.backgroundColor = .systemPurple
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
//        return iv
//    }()
    
    private let newsName : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "name"
        return label
    }()
    private let newsUrl : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "url"
        return label
    }()
//    private let fullnameLabel : UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .lightGray
//        label.text = "Peter Parker"
//        return label
//    }()
    //MARK: - Lifecycle

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = .systemPink//uiview class 를 상속받기때문에 view.backg... 안해도된다.
        
//        self.contentView.addSubview(profileImageView)
//        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
//        profileImageView.setDimensions(height: 56, width: 56)
//        profileImageView.layer.cornerRadius = 56 / 2 //원
        
        let stack = UIStackView(arrangedSubviews: [newsName
                                                   ,newsUrl
                                                  ])
        stack.axis = .vertical
        stack.spacing = 8
        self.contentView.addSubview(stack)
        stack.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20)
//        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)//profile이미지 기준으로 중앙에 둔다.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let news = news else { return }
        newsName.text = news.title
        newsUrl.text = news.url
//        guard let user = user else { return }
//        fullnameLabel.text = user.fullname
//        usernameLabel.text = user.username
//        guard let url = URL(string: user.profileImageUrl) else {return}
//        profileImageView.sd_setImage(with: url)
        
    }
}
