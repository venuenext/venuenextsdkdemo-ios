// Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNOrderUI
import VNOrderData
import VNWalletUI
import VNCore
import VNCoreUI

class DeepLinkTableViewController: UITableViewController {
    enum Section: CaseIterable {
        case push
        case modal
        case initialization
         
         var displayName: String {
             switch self {
             case .push:
                 return "Push"
             case .modal:
                 return "Modal Presentation"
             case .initialization:
                return "Initialization"
             }
         }
         
         var rows: [LinkType] {
             switch self {
             case .push:
                 return [.pushFoodList, .pushMerchList, .pushExperienceList, .pushFoodMenu, .pushMerchMenu, .pushExperienceMenu, .pushExperienceDetail, .pushOrderHistory, .pushWallet]
             case .modal:
                 return [.modalFoodList, .modalMerchList, .modalExperienceList, .modalFoodMenu, .modalMerchMenu, .modalExperienceMenu, .modalExperienceDetail, .modalOrderHistory, .modalFoodReceipt, .modalExperienceReceipt, .modalDisclosure, .modalWallet]
             case .initialization:
                return [.reinitWithExternalID]
            }
         }
     }
     
    enum LinkType: CaseIterable {
        case modalFoodList
        case modalMerchList
        case modalExperienceList
        case modalFoodMenu
        case modalMerchMenu
        case modalExperienceMenu
        case modalExperienceDetail
        case modalOrderHistory
        case modalFoodReceipt
        case modalExperienceReceipt
        case modalDisclosure
        case modalWallet

        case pushFoodList
        case pushMerchList
        case pushExperienceList
        case pushFoodMenu
        case pushMerchMenu
        case pushExperienceMenu
        case pushExperienceDetail
        case pushOrderHistory
        case pushWallet
        
        case reinitWithExternalID
     
         var name: String {
             let modal = "Modal - "
             let push = "Push - "
             switch self {
             case .modalFoodList:
                 return modal + "Food RvCs"
             case .modalMerchList:
                 return modal + "Merch RvCs"
             case .modalExperienceList:
                 return modal + "Experience RvCs"
             case .modalFoodMenu:
                 return modal + "Food Menu"
             case .modalMerchMenu:
                 return modal + "Merch Menu"
             case .modalExperienceMenu:
                 return modal + "Experience Menu"
             case .modalExperienceDetail:
                 return modal + "Experience Details"
             case .modalOrderHistory:
                 return modal + "Order History"
             case .modalFoodReceipt:
                 return modal + "Food Receipt"
             case .modalExperienceReceipt:
                 return modal + "Experience Receipt"
             case .modalDisclosure:
                 return modal + "Disclosure"
             case .modalWallet:
                 return modal + "Wallet"
             case .pushFoodList:
                 return push + "Food RvCs"
             case .pushMerchList:
                 return push + "Merch RvCs"
             case .pushExperienceList:
                 return push + "Experience RvCs"
             case .pushFoodMenu:
                 return push + "Food Menu"
             case .pushMerchMenu:
                 return push + "Merch Menu"
             case .pushExperienceMenu:
                 return push + "Experience Menu"
             case .pushExperienceDetail:
                 return push + "Experience Details"
             case .pushOrderHistory:
                 return push + "Order History"
             case .pushWallet:
                 return push + "Wallet"
             case .reinitWithExternalID:
                return "Reinit w/ External ID"
             }
         }
     }
    
    public init() {
        super.init(nibName: String(describing: DeepLinkTableViewController.self), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = VN.theme.primaryNavigationBarBackground
        navigationController?.navigationBar.tintColor = VN.theme.primaryNavigationBarTint
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : VN.theme.primaryLight]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Debug"
        LinkTableViewCell.register(tableView: tableView)
        configureNavigationBar()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section.allCases[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LinkTableViewCell.classStringName, for: indexPath) as! LinkTableViewCell

        let section = Section.allCases[indexPath.section]
        let linkType = section.rows[indexPath.row]
        cell.textLabel?.text = linkType.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = Section.allCases[indexPath.section]
    
        let linkType = section.rows[indexPath.row]
        
        switch linkType {
        case .modalFoodList:
            navigationController?.present(VNOrderNavigation.rvcNavigationController(productTypes: [.food], dismissDelegate: self), animated: true, completion: nil)
        case .modalMerchList:
            navigationController?.present(VNOrderNavigation.rvcNavigationController(productTypes: [.merchandise], dismissDelegate: self), animated: true, completion: nil)
        case .modalExperienceList:
            navigationController?.present(VNOrderNavigation.rvcNavigationController(productTypes: [.experience], dismissDelegate: self), animated: true, completion: nil)
        case .modalFoodMenu:
            navigationController?.present(VNOrderNavigation.menuNavigationController(menuUUID: "d1192eb8-2369-40a3-8880-d279137f5426", productType: .food, dismissDelegate: self), animated: true, completion: nil)
        case .modalMerchMenu:
            navigationController?.present(VNOrderNavigation.menuNavigationController(menuUUID: "d6b9509f-3479-4b2b-b50c-f643ba422b5f", productType: .merchandise, dismissDelegate: self), animated: true, completion: nil)
        case .modalExperienceMenu:
            navigationController?.present(VNOrderNavigation.menuNavigationController(menuUUID: "e6489e97-4873-46be-b2c5-7262873d6e9e", productType: .experience, dismissDelegate: self), animated: true, completion: nil)
        case .modalExperienceDetail:
            navigationController?.present(VNOrderNavigation.experienceDetailNavigationController(menuUUID: "5a469d76-0689-44f3-82ec-568b7089533f", eventUUID: "53c61080-3f10-4ec8-a881-0968efc225f9", variantUUID: "6a9b0e57-adc2-4f24-9631-844f47b882ef", dismissDelegate: self), animated: true, completion: nil)
        case .modalOrderHistory:
            navigationController?.present(VNOrderNavigation.orderHistoryNavigationController(dismissDelegate: self), animated: true, completion: nil)
        case .modalFoodReceipt:
            let receiptNavigationController = VNOrderNavigation.receiptNavigationController(orderSummaryUUID: "7e9d1376-08f2-4153-b5b8-d8f32ccf5849", productType: .food, dismissDelegate: self)
            navigationController?.present(receiptNavigationController, animated: true, completion: nil)
        case .modalExperienceReceipt:
            // TODO: COME BACK
            break
        case .modalDisclosure:
            definesPresentationContext = true
            DispatchQueue.main.async { [weak self] in
                guard let weakSelf = self else {
                    return
                }
                let vc = DetailDisclosureController(title: "Earn 5.00 back on the next 20 spent!", description: "Spend $20 to get back 5.00 in Virtual Bucks")
                
                let action = VNAlertAction(title: "Testing title", handler: { (action) in
                    print("Did press \(action.title)")
                })
                
                vc.addAction(action: action)
                
                vc.modalPresentationStyle = .overCurrentContext
                weakSelf.present(vc, animated: false, completion: nil)
            }
        case .modalWallet:
            navigationController?.present(VNWalletNavigation.walletNavigationController(dismissDelegate: self), animated: true, completion: nil)
        
        case .pushFoodList:
            navigationController?.pushVNRvCList(for: [.food], animated: true)
        case .pushMerchList:
            navigationController?.pushVNRvCList(for: [.merchandise], animated: true)
        case .pushExperienceList:
            navigationController?.pushVNRvCList(for: [.experience], animated: true)
        case .pushFoodMenu:
            navigationController?.pushVNMenu(for: "d1192eb8-2369-40a3-8880-d279137f5426", productType: .food, animated: true)
        case .pushMerchMenu:
            navigationController?.pushVNMenu(for: "d6b9509f-3479-4b2b-b50c-f643ba422b5f", productType: .merchandise, animated: true)
        case .pushExperienceMenu:
            navigationController?.pushVNMenu(for: "e6489e97-4873-46be-b2c5-7262873d6e9e", productType: .experience, animated: true)
        case .pushExperienceDetail:
            navigationController?.pushVNExperienceDetails(for: "5a469d76-0689-44f3-82ec-568b7089533f", eventUUID: "53c61080-3f10-4ec8-a881-0968efc225f9", variantUUID: "6a9b0e57-adc2-4f24-9631-844f47b882ef", animated: true)
        case .pushOrderHistory:
            navigationController?.pushVNOrderHistory(animated: true)
        case .pushWallet:
            navigationController?.pushVNWalletViewController(animated: true)
        case .reinitWithExternalID:
            
            let alertController = UIAlertController(title: "Enter ExternalID", message: nil, preferredStyle: .alert)
            alertController.addTextField()
            
            let ok = UIAlertAction(title: "reinit", style: .default) { (action) in
                if let externalID = alertController.textFields?.first?.text, !externalID.isEmpty {
                    print("You entered %@", externalID)
                    
                    guard let configURLString = Bundle.main.path(forResource: "vn-sdk-config", ofType: "json"), let configURL = URL(string: configURLString) else {
                        fatalError("Failed to find config file at provided path")
                    }
                    
                    DispatchQueue.main.async {
                        self.view.isUserInteractionEnabled = false
                    }
                    
                    VenueNext.shared.initialize(sdkKey: "SDK_KEY", sdkSecret: "SDK_DELEGATE", externalID: externalID, configURL: configURL) { (success, error) in
                        DispatchQueue.main.async {
                            self.view.isUserInteractionEnabled = true
                            guard success else {
                                print("failed to re-initialized the SDK %@", error?.localizedDescription ?? "")
                                return
                            }
                            print("successfully re-initialized the SDK")
                        }
                    }
                }
            }
            
            let cancel = UIAlertAction(title: "cancel", style: .cancel)
            
            alertController.addAction(ok)
            alertController.addAction(cancel)
            DispatchQueue.main.async {
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = Section.allCases[section]
        return section.displayName.uppercased()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension DeepLinkTableViewController: DismissDelegate {
    func shouldDismiss(viewController: UIViewController) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
