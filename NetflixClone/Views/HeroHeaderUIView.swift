//
//  HeroHeaderUIView.swift
//  NetflixClone
//
//  Created by Arslan Tek on 16.01.2024.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Geliştirici İletişim", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
                        
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Oynat", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    private let heroImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "icardi2")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let padding : CGFloat = 13
        
        let playButtonContraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            playButton.widthAnchor.constraint(equalTo: playButton.titleLabel!.widthAnchor, constant: 2 * padding)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            downloadButton.widthAnchor.constraint(equalTo: downloadButton.titleLabel!.widthAnchor, constant: 2 * padding)
            
        ]
        
        NSLayoutConstraint.activate(playButtonContraints + downloadButtonConstraints)

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
