import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    
    var favoriteModal = FavoriteModal(imageAssets: "Beer-fail", descriptionText: "Nao foi possivel favoritar", titleLabelText: "Algo deu errado!")
    
    lazy var viewContainer: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        favoriteModal.closeImage.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        view.addSubview(viewContainer)
        setup()
    }
    
    override func updateViewConstraints() {
           // distance to top introduced in iOS 13 for modal controllers
           // they're now "cards"
        let TOP_CARD_DISTANCE: CGFloat = 10.0
           
           // calculate height of everything inside that stackview
           var height: CGFloat = 300.0
           for v in self.viewContainer.subviews {
               height = height + v.frame.size.height
           }
           
           // change size of Viewcontroller's view to that height
           self.view.frame.size.height = height
           // reposition the view (if not it will be near the top)
           self.view.frame.origin.y = UIScreen.main.bounds.height - height - TOP_CARD_DISTANCE
           // apply corner radius only to top corners
           self.view.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
           super.updateViewConstraints()
       }
    
    func setup() {
        viewContainer.addSubview(favoriteModal)
        
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            favoriteModal.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -250.0),
            favoriteModal.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),
            favoriteModal.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            favoriteModal.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
        ])
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
