//
//  UIViewController+Extension.swift
//  PayButton
//
//  Created by Nada Kamel on 28/05/2023.
//  Copyright © 2023 Paysky. All rights reserved.
//

import UIKit

// MARK: - Hide keyboard when tapping around

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController: UIAlertViewDelegate {

    func showAlert(_ title: String,
                   message: String,
                   okTitle: String = "OK",
                   okHandler: (()->Void)? = nil,
                   cancelTitle: String = "",
                   cancelHandler: (()->Void)? = nil,
                   showImage : Bool = true,
                   image: UIImage = #imageLiteral(resourceName: "TransactionDeclined")) {
        let popupVC = AlertDialogViewController(nibName: "AlertDialogViewController", bundle: nil)
        popupVC.titleText = title
        popupVC.messageText = message
        popupVC.okText = okTitle
        popupVC.cancelText = cancelTitle
        popupVC.imageMainParamter = image
        popupVC.showImage = showImage
        popupVC.okHandler = okHandler
        popupVC.cancelHandler = cancelHandler
                
        // Present popup with the hosted view controller
        let popupVCN = PopupViewController(viewController: popupVC)
        popupVCN.modalPresentationStyle = .overCurrentContext
        popupVCN.modalTransitionStyle = .crossDissolve
                
        // Present dialog
        present(popupVCN, animated: true, completion: nil)
    }
    
}

class PopupViewController: UIViewController {

    // View Controller to host
    private var hostedViewController: UIViewController

    // Create a popup container view
    private let popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    // Initializer to pass the view controller to host
    init(viewController: UIViewController) {
        self.hostedViewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Background settings for the dim effect
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // Tap outside to dismiss
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        view.addGestureRecognizer(tapGesture)

        // Prevent touches inside the popup view from dismissing the popup
        popupView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))

        // Add popup view and hosted view controller
        view.addSubview(popupView)
        
        // Add hosted view controller's view into popup view
        addChild(hostedViewController)
        popupView.addSubview(hostedViewController.view)
        hostedViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostedViewController.didMove(toParent: self)
        
        // Popup view constraints
        popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popupView.widthAnchor.constraint(equalToConstant: 600).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 400).isActive = true // Adjust as necessary

        // Hosted view controller's view constraints to fit inside the popup
        hostedViewController.view.topAnchor.constraint(equalTo: popupView.topAnchor).isActive = true
        hostedViewController.view.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
        hostedViewController.view.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        hostedViewController.view.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
    }

    @objc func dismissPopup() {
        self.dismiss(animated: true, completion: nil)
    }
}
