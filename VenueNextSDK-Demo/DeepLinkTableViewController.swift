// Copyright © 2019 VenueNext. All rights reserved.

import UIKit
import VNOrderUI
import VNOrderData

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
    
    var receiptCoordinator: ReceiptCoordinator?

    enum LinkType: CaseIterable {
        case rvcModal
        case rvcPush
        case orderHistoryModal
        case orderHistoryPush
        case receiptModal
        
        var name: String {
            switch self {
            case .rvcModal:
                return "Show Revenue Center - Modally"
            case .rvcPush:
                return "Show Revenue Center - Push"
            case .orderHistoryModal:
                return "Show Order History - Modally"
            case .orderHistoryPush:
                return "Show Order History - Push"
            case .receiptModal:
                return "Show Receipt - Modally"
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
        navigationController?.navigationBar.barTintColor = .primaryDark
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LinkTableViewCell.register(tableView: tableView)
        configureNavigationBar()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LinkType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LinkTableViewCell.classStringName, for: indexPath) as! LinkTableViewCell

        cell.textLabel?.text = LinkType.allCases[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let linkType = LinkType.allCases[indexPath.row]
        
        switch linkType {
        case .rvcModal:
            
            do {
                let fetchRequest = Stand.fetchRequest() as NSFetchRequest<Stand>
                let context = VNOrderData.shared.managedObjectContext
                let stand = try context.fetch(fetchRequest).first!
                
                guard let menu = try Menu.fetchAll(for: stand.identifier!, in: context).first,
                    let identifier = menu.identifier else {
                        return
                }
                orderCoordinator.presentMenu(for: identifier, from: self)
            } catch {
                print(error.localizedDescription)
            }
            
        case .rvcPush:
            
            do {
                let fetchRequest = Stand.fetchRequest() as NSFetchRequest<Stand>
                let context = VNOrderData.shared.managedObjectContext
                let stand = try context.fetch(fetchRequest).first!
                
                guard let menu = try Menu.fetchAll(for: stand.identifier!, in: context).first,
                    let identifier = menu.identifier else {
                        return
                }
                orderCoordinator.pushMenu(for: identifier )
            } catch {
                print(error.localizedDescription)
            }
            
        case .orderHistoryModal:
            orderHistoryCoordinator.present(from: navigationController!)
        case .orderHistoryPush:
            orderHistoryCoordinator.pushViewController()
        case .receiptModal:
            
            guard let orderSummary = try! OrderSummary.fetchAll(in: VNOrderData.shared.managedObjectContext).first else {
                return
            }
            
            receiptCoordinator = ReceiptCoordinator(orderUUID: orderSummary.identifier! , presenter: navigationController!) { [weak self] success in
                guard success else {
                    let alert = UIAlertController(title: "Sorry", message: "Unable to find order", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alert.addAction(ok)
                    
                    self?.present(alert, animated: true, completion: nil)
                    return
                }
                
                self?.receiptCoordinator?.start()
            }
        }
        
    }
}
