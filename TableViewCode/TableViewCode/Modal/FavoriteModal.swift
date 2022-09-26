import Foundation
import UIKit

class FavoriteModal: UIView {
    
    var imageAssets: String
    var descriptionText: String
    var titleLabelText: String
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = titleLabelText
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: imageAssets)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        let attributedString = NSMutableAttributedString(string: descriptionText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, attributedString.length))
        descriptionLabel.attributedText = attributedString
        descriptionLabel.text = descriptionText
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .center
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    lazy var closeImage: UIImageView = {
        let closeImage = UIImageView()
        closeImage.image = UIImage(systemName: "xmark")
        closeImage.contentMode = .scaleAspectFit
        closeImage.translatesAutoresizingMaskIntoConstraints = false
        return closeImage
    }()
    
    init(imageAssets: String = "Beer-ok", descriptionText: String = "Sua avaliação foi adicionada com sucesso!", titleLabelText: String = "Um brinde!") {
        self.imageAssets = imageAssets
        self.descriptionText = descriptionText
        self.titleLabelText = titleLabelText
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setup()
    }
    
    func setup() {
        
        self.addSubview(titleLabel)
        self.addSubview(image)
        self.addSubview(descriptionLabel)
        self.addSubview(closeImage)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeImage.topAnchor.constraint(equalTo: self.topAnchor),
            closeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            image.widthAnchor.constraint(equalToConstant: 80.0),
            image.heightAnchor.constraint(equalToConstant: 80.0),
            image.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 50.0),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            descriptionLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: 100.0),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
