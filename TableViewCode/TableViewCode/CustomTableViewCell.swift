import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "CustomTableViewCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "teste"
        
        label.translatesAutoresizingMaskIntoConstraints = false
                
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let customView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.customView)
        self.customView.addSubview(self.label)
        self.customView.backgroundColor = .white
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
            self.customView.topAnchor.constraint(equalTo: self.topAnchor),
            self.customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.customView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.customView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.label.topAnchor.constraint(equalTo: customView.topAnchor),
            self.label.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 100.0),
            self.label.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -50.0),
            self.label.bottomAnchor.constraint(equalTo: customView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}

