//
//  AnswerCell.swift
//  Quiz
//
//  Created by Marcylene Barreto on 07/11/21.
//

import UIKit

class AnswerCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelName: UILabel!
    
    
//    override func layoutSublayers(of layer: CALayer) {
//        super.layoutSublayers(of: self.layer)
//        gradientLayer.frame = viewBackground.bounds
//    }
    
//    func configureCell(content: UITableView) {
//            let colorSet = [UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0),
//                            UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)]
//            let location = [0.2, 1.0]
//            viewBackground.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
//        }
    
    func setup(model: AnswerModel) {
        
        labelName.text = model.name
        
        viewBackground.layer.cornerRadius = 30
        viewBackground.layer.borderWidth = 1
        
        setStyle(model.style)
    }
    
    func setStyle(_ style: AnswerModel.Style) {
        switch style {
        case .blank:
            viewBackground.backgroundColor = .white
            viewBackground.layer.borderColor = UIColor.gray.cgColor
            
        case .selected:

            let color = UIColor(red: 120/255, green: 137/255, blue: 148/255, alpha: 1)
            let borderColor = UIColor(red: 191/255, green: 200/255, blue: 250/255, alpha: 1)
            viewBackground.backgroundColor = color
            viewBackground.layer.borderColor = borderColor.cgColor
            
        case .correct:
            let color = UIColor(red: 82/255, green: 202/255, blue: 158/255, alpha: 1)
            let borderColor = UIColor(red: 178/255, green: 227/255, blue: 172/255, alpha: 1)
            viewBackground.backgroundColor = color
            viewBackground.layer.borderColor = borderColor.cgColor
            
        case .incorrect:
            let color = UIColor(red: 211/255, green: 70/255, blue: 69/255, alpha: 1)
            let borderColor = UIColor(red: 242/255, green: 176/255, blue: 174/255, alpha: 1)
            viewBackground.backgroundColor = color
            viewBackground.layer.borderColor = borderColor.cgColor
        }
    }
}


// extensao de gradiente
//extension UIView {
//    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
//                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
//        layer.frame = gradientFrame ?? self.bounds
//        layer.frame.origin = .zero
//
//        let layerColorSet = colorSet.map { $0.cgColor }
//        let layerLocations = locations.map { $0 as NSNumber }
//
//        layer.colors = layerColorSet
//        layer.locations = layerLocations
//
//        if let startEndPoints = startEndPoints {
//            layer.startPoint = startEndPoints.0
//            layer.endPoint = startEndPoints.1
//        }
//
//        self.layer.insertSublayer(layer, above: self.layer)
//    }
//}
