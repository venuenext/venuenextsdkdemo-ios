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
        
        var displayName: String {
            switch self {
            case .push:
                return "Push"
            case .modal:
                return "Modal Presentation"
            }
        }
        
        var rows: [LinkType] {
            switch self {
            case .push:
                return [.rvcPush, .rvcPushFood, .rvcPushMerch,.rvcPushExperience, .pushWallet, .orderHistoryPush, .pushExperienceMenu]
            case .modal:
                return [.rvcFoodModal,.rvcMerchModal, .orderHistoryModal, .receiptModal, .presentWallet, .presentExperienceDetails]
            }
        }
    }
    
    enum LinkType: CaseIterable {
        case rvcFoodModal
        case rvcMerchModal
        case rvcPush
        case rvcPushFood
        case rvcPushMerch
        case rvcPushExperience
        case pushExperienceMenu
        case orderHistoryModal
        case orderHistoryPush
        case receiptModal
        case presentWallet
        case presentExperienceDetails
        case pushWallet
        case presentDisclosureView

        var name: String {
            switch self {
            case .rvcFoodModal:
                return "Show Food Revenue Center"
            case .rvcMerchModal:
                return "Show Merch Revenue Center"
            case .rvcPush:
                return "Show Revenue Center"
            case .rvcPushFood:
                return "Show Food Revenue Centers"
            case .rvcPushMerch:
                return "Show Merch Revenue Centers"
            case .rvcPushExperience:
                return "Show Experience Revenue Centers"
            case .orderHistoryModal:
                return "Show Order History"
            case .orderHistoryPush:
                return "Show Order History"
            case .receiptModal:
                return "Show Receipt"
            case .pushExperienceMenu:
                return "Show Experience"
            case .presentWallet:
                return "Show Wallet"
            case .pushWallet:
                return "Push Wallet"
            case .presentDisclosureView:
                return "Show an award disclosure"
            case .presentExperienceDetails:
                return "Present Experience Details"
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
        case .rvcFoodModal:
            let menus = try? Menu.fetchAll(productTypes: [.food], context: VNOrderData.shared.managedObjectContext)
            guard let menu = menus?.first  else { return }
            guard let uuid = menu.identifier else { return }
            navigationController?.present(VNOrderNavigation.standMenuNavigationController(menuUUID: uuid, dismissDelegate: self), animated: true, completion: nil)
        case .rvcMerchModal:
            let menus = try? Menu.fetchAll(productTypes: [.merchandise], context: VNOrderData.shared.managedObjectContext)
            guard let menu = menus?.first  else { return }
            guard let uuid = menu.identifier else { return }
            navigationController?.present(VNOrderNavigation.standMenuNavigationController(menuUUID: uuid, dismissDelegate: self), animated: true, completion: nil)
        case .rvcPush:
            navigationController?.pushVNMenu(for: "d1192eb8-2369-40a3-8880-d279137f5426", productType: .food, animated: true)
        case .rvcPushFood:
            navigationController?.pushVNRvCList(for: [.food], animated: true)
        case .rvcPushMerch:
            navigationController?.pushVNRvCList(for: [.merchandise], animated: true)
        case .rvcPushExperience:
            navigationController?.pushVNRvCList(for: [.experience], animated: true)
        case .orderHistoryModal:
            navigationController?.present(VNOrderNavigation.orderHistoryNavigationController(dismissDelegate: self), animated: true, completion: nil)
        case .orderHistoryPush:
            navigationController?.pushVNOrderHistory(animated: true)
        case .receiptModal:
            let receiptNavigationController = VNOrderNavigation.receiptNavigationController(orderSummaryUUID: "7e9d1376-08f2-4153-b5b8-d8f32ccf5849", productType: .food, dismissDelegate: self)
            navigationController?.present(receiptNavigationController, animated: true, completion: nil)
        case .pushExperienceMenu:
            navigationController?.pushVNMenu(for: "e6489e97-4873-46be-b2c5-7262873d6e9e", productType: .experience, animated: true)
        case .presentWallet:
            navigationController?.present(VNWalletNavigation.walletNavigationController(dismissDelegate: self), animated: true, completion: nil)
        case .pushWallet:
            navigationController?.pushVNWalletViewController(animated: true)
        case .presentDisclosureView:
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
        case .presentExperienceDetails:
            DispatchQueue.main.async { [weak self] in
                self?.navigationController?.present(VNOrderNavigation.experienceDetailNavigationController(menuID: "5a469d76-0689-44f3-82ec-568b7089533f", eventID: "53c61080-3f10-4ec8-a881-0968efc225f9", variantID: "6a9b0e57-adc2-4f24-9631-844f47b882ef", dismissDelegate: self), animated: true, completion: nil)
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
