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
                
        let popupVCN = PopupViewController(viewController: popupVC)
        popupVCN.modalPresentationStyle = .overCurrentContext
        popupVCN.modalTransitionStyle = .crossDissolve
                
        present(popupVCN, animated: true, completion: nil)
    }
    
}

class PopupViewController: UIViewController {

    private var hostedViewController: UIViewController

    private let popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()

    init(viewController: UIViewController) {
        self.hostedViewController = viewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        view.addGestureRecognizer(tapGesture)

        popupView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))

        view.addSubview(popupView)

        addChild(hostedViewController)
        popupView.addSubview(hostedViewController.view)
        hostedViewController.view.translatesAutoresizingMaskIntoConstraints = false
        hostedViewController.didMove(toParent: self)

        popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popupView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        popupView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        popupView.heightAnchor.constraint(lessThanOrEqualToConstant: 400).isActive = true

        hostedViewController.view.topAnchor.constraint(equalTo: popupView.topAnchor).isActive = true
        hostedViewController.view.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
        hostedViewController.view.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        hostedViewController.view.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
    }

    @objc func dismissPopup() {
        self.dismiss(animated: true, completion: nil)
    }
}
