import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "CustomTableViewCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
                
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true // this will make sure its children do not go out of the boundary
      return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.image)
        self.containerView.addSubview(self.label)
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 0.3
        self.contentView.backgroundColor = .white
        self.configureConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            self.contentView.heightAnchor.constraint(equalToConstant: 50.0),
            self.containerView.heightAnchor.constraint(equalToConstant: 50.0),
            self.containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.image.heightAnchor.constraint(equalTo: self.containerView.heightAnchor),
            self.image.widthAnchor.constraint(equalToConstant: 30.0),
            self.image.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.image.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.image.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -20.0),
            self.image.leadingAnchor.constraint(equalTo: self.label.trailingAnchor),
            self.label.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.label.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 20.0),
            self.label.trailingAnchor.constraint(equalTo: self.image.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}

