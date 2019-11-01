// Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNOrderUI
import VNOrderData
import VNWalletUI

class DeepLinkTableViewController: UITableViewController {
    lazy var orderHistoryCoordinator: OrderHistoryCoordinator = {
        let orderHistoryCoordinator = OrderHistoryCoordinator(navigationController: navigationController!)
        orderHistoryCoordinator.start()
        return orderHistoryCoordinator
    }()
    
    lazy var orderCoordinator: OrderCoordinator = {
        let orderCoordinator = OrderCoordinator(navigationController: navigationController)
        orderCoordinator.start()
        return orderCoordinator
    }()
    
    lazy var orderFoodCoordinator: OrderCoordinator = {
        let orderCoordinator = OrderCoordinator(navigationController: navigationController)
        orderCoordinator.productTypes = [.food]
        orderCoordinator.start()
        return orderCoordinator
    }()
    
    lazy var orderMerchCoordinator: OrderCoordinator = {
        let orderCoordinator = OrderCoordinator(navigationController: navigationController)
        orderCoordinator.productTypes = [.merchandise]
        orderCoordinator.start()
        return orderCoordinator
    }()
    
    lazy var orderExperienceCoordinator: OrderCoordinator = {
        let orderCoordinator = OrderCoordinator(navigationController: navigationController)
        orderCoordinator.productTypes = [.experience]
        orderCoordinator.start()
        return orderCoordinator
    }()
    
    lazy var walletCoordinator: WalletCoordinator = {
        let walletCoordinator = WalletCoordinator(navigationController: navigationController)
        walletCoordinator.start()
        return walletCoordinator
    }()
    
    var receiptCoordinator: ReceiptCoordinator?
    
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
                return [.rvcFoodModal,.rvcMerchModal, .orderHistoryModal, .receiptModal, .presentWallet]
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
            orderCoordinator.presentMenu(for: uuid, from: self)
        case .rvcMerchModal:
            let menus = try? Menu.fetchAll(productTypes: [.merchandise], context: VNOrderData.shared.managedObjectContext)
            guard let menu = menus?.first  else { return }
            guard let uuid = menu.identifier else { return }
            orderCoordinator.presentMenu(for: uuid, from: self)
        case .rvcPush:
            let menus = try? Menu.fetchAll(context: VNOrderData.shared.managedObjectContext)
            guard let menu = menus?.first  else { return }
            guard let uuid = menu.identifier else { return }
            orderCoordinator.pushMenu(for: uuid)
        case .rvcPushFood:
            orderFoodCoordinator.pushRvCList()
        case .rvcPushMerch:
            orderMerchCoordinator.pushRvCList()
        case .rvcPushExperience:
            orderExperienceCoordinator.pushRvCList()
        case .orderHistoryModal:
            orderHistoryCoordinator.present(from: navigationController!)
        case .orderHistoryPush:
            orderHistoryCoordinator.pushViewController()
        case .receiptModal:
            receiptCoordinator = ReceiptCoordinator(orderUUID: "7e9d1376-08f2-4153-b5b8-d8f32ccf5849", for: .food, presenter: navigationController!) { [weak self] success in
                guard success else {
                    let alert = UIAlertController(title: "Sorry", message: "Unable to find order", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alert.addAction(ok)
                    
                    self?.present(alert, animated: true, completion: nil)
                    return
                }
                
                self?.receiptCoordinator?.start()
            }
        case .pushExperienceMenu:
            print("")
            orderCoordinator.showExperiencesMenu(for: "aeafcecd-628c-4e89-acae-8ce4caaa57d8")
        case .presentWallet:
            walletCoordinator.present(from: self)
        case .pushWallet:
            navigationController?.pushViewController(walletCoordinator.rootViewController, animated: true)
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
