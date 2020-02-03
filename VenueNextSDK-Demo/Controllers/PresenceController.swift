//
//  PresenceController.swift
//  Florida Gators
//
//  Created by Nathan Fulkerson on 7/17/19.
//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import PresenceSDK
import VNCore
import VNCoreUI

@objc public class PresenceController: UIViewController, PresenceControllable {
    public var isForWalletLogIn: Bool {
        get {
            return _isForWalletLogin
        }
        
        set {
            _isForWalletLogin = newValue
        }
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    @objc public var loginCompletion: ((PresenceMember?, Error?) -> Void)?
    
    private var _isForWalletLogin: Bool = false
    
    lazy var emptyStateView: UIView = {
        let emptyStateView = SpinnerView(frame: CGRect.zero)
        return emptyStateView
    }()
    
    lazy var presenceSDKView: PresenceSDKView = {
        let presenceView = PresenceSDKView(frame: CGRect.zero)
        presenceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presenceView)
        
        presenceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        presenceView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        presenceView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        presenceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        return presenceView
    }()
    
    lazy var logoutButton = UIBarButtonItem(title: "Logout".uppercased(), style: .plain, target: self, action: #selector(logout))
    lazy var closeButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didPressDone))
    
    let presence = PresenceSDK.getPresenceSDK()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        navigationController?.navigationBar.barTintColor = VN.theme.primaryNavigationBarBackground
        navigationController?.navigationBar.tintColor = VN.theme.primaryNavigationBarTint
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : VN.theme.primaryNavigationBarTint]
        presence.start(presenceSDKView: presenceSDKView, loginDelegate: self)
    }
    
    convenience init(isForWalletLogin: Bool = false) {
        self.init(nibName: nil, bundle: nil)
        self.isForWalletLogIn = isForWalletLogin
    }
    
    @objc func logout() {
        presence.logOut()
    }
    @objc func didPressDone() {
        dismiss(animated: true, completion: nil)
    }
    
    func showEmptyState() {
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emptyStateView)
        
        emptyStateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        emptyStateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        emptyStateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        emptyStateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        view.bringSubviewToFront(emptyStateView)
    }
    
    func hideEmptyState() {
        emptyStateView.removeFromSuperview()
    }
    
    deinit {
        print("deinit \(self)")
    }
}

extension PresenceController: PresenceLoginDelegate {
    //Mandatory methods that the confirming class has to implement. ----------
    
    ///Method is invoked if the user granted app access/logged in.
    ///- parameter backendName: Name of the backend this callback event is associated with.
    ///- parameter accessToken: access token returned from the specified backend.
    public func onLoginSuccessful(backendName: PresenceLogin.BackendName, accessToken: String) {
        
        if _isForWalletLogin {
            DispatchQueue.main.async { [weak self] in
                self?.showEmptyState()
                self?.presenceSDKView.removeFromSuperview()
            }
        }
        
        presence.getMemberInfo(backendName: backendName) { [weak self] (member, error) in
            
            guard member != nil else {
                self?.loginCompletion?(nil, error)
                return
            }
            
            self?.loginCompletion?(member, nil)
        }
    }
    
    /// Notify when successfully logged-out from both backends
    public func onLogoutAllSuccessful() {
        navigationItem.rightBarButtonItem = nil
        UserDefaults.standard.removeObject(forKey: "tm_email")
        VenueNext.shared.logoutTicketingAccount()
    }
}
