//
//  TipsCollectionViewCell.swift
//  total bill
//
//  Created by Михаил Переверзин on 29.08.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {

    let tipsLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
    
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = UIColor.purple.cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init (frame: frame)

        setupView()
        setConstarins()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tipsLabel.font = UIFont(name: "Avenir Next", size: frame.width / 3.4)
    }
    
    func setupView () {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        
        addSubview(tipsLabel)
        
    }
    
    func setConstarins() {
        
        NSLayoutConstraint.activate([
            tipsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            tipsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            tipsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
    
}
 
