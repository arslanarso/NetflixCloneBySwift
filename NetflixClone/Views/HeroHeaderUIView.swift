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
    
    private let headerText: UILabel = {
        let label = UILabel()
        
        let fullText = """
        Mauro Icardi
        Adına şarkılar yazıldı, okunan şarkılar ona yorumlandı. Tüm Türkiye'ye ezberlettiği şarkıyı şimdi Avrupa'ya dinletme zamanı...
        """
        
        let boldText = "Mauro Icardi"
        let italicText = "Adına şarkılar yazıldı, okunan şarkılar ona yorumlandı. Tüm Türkiye'ye ezberlettiği şarkıyı şimdi Avrupa'ya dinletme zamanı..."
        
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: boldText)
        let rangeForItalic = (fullText as NSString).range(of: italicText)
        
        
        attributedString.addAttributes([.font: UIFont.boldSystemFont(ofSize:40)], range: range)
        attributedString.addAttributes([.font: UIFont.italicSystemFont(ofSize:16)], range: rangeForItalic)
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        addSubview(headerText)
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

        
        let headerTextConstraints = [
            headerText.widthAnchor.constraint(equalToConstant: 300),
            headerText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -295)
        ]
        
        NSLayoutConstraint.activate(headerTextConstraints + playButtonContraints + downloadButtonConstraints)

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
