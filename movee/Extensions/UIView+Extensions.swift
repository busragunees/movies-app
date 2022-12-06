//
//  UIViewExtensions.swift
//  movee
//
//  Created by Gunes, Busra on 25.11.2022.
//

import Foundation
import UIKit

public typealias SimpleClosure = () -> Void
private var tappableKey: UInt8 = 0
private var actionKey: UInt8 = 1

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            layer.shadowOffset
        }set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable
    var shadowColor: UIColor {
        get {
            UIColor.init(cgColor: layer.shadowColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    func visiblity(gone: Bool, dimension: CGFloat = 0.0, attribute: NSLayoutConstraint.Attribute = .height) {
        if  let constraint = (self.constraints.filter { $0.firstAttribute == attribute }.first) {
            constraint.constant = gone ? 0.0 : dimension
            self.layoutIfNeeded()
            self.isHidden = gone
        }
    }
    func showAnimation(_ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85) // animasyon
        } completion: { _ in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear) { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                           } completion: { _ in
                               self.isUserInteractionEnabled = true
                               completionBlock()
                           }
        }
    }
}
