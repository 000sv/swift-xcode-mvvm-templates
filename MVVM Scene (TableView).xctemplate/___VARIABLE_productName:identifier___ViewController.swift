//  ___FILEHEADER___

import UIKit
import Combine

/// In the MVVM pattern, the view controller is responsible for managing the view of the application.
/// The view controller is a crucial component due to its lifecycle, which enables it to respond
/// appropriately to changes in the application state. It updates the UI based on events provided by
/// the view model.
class ___VARIABLE_productName:identifier___ViewController: UIViewController {
    
    // MARK: - Outlets
    
    /// The table view displaying items.
    @IBOutlet weak var tableView: UITableView!
    /// The activity indicator view indicating loading state.
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    /// The view model represents the 'ViewModel' layer, encapsulating the application's business logic
    /// and data manipulation. It communicates with the repository to fetch and update data, and emits
    /// state changes to the view controller using Combine publishers.
    lazy var viewModel: ___VARIABLE_productName:identifier___ViewModel = {
        // Init the repository
        let repository = ___VARIABLE_productName:identifier___Repository()
        // Init view model
        return ___VARIABLE_productName:identifier___ViewModel(repository: repository)
    }()
    
    /// The adapter serves as the intermediary between the view and the view model. It translates  the
    /// data provided by the view model into a format suitable for display in the view, and handles user
    /// interactions by forwarding them to the view model.
    lazy var adapter: ___VARIABLE_productName:identifier___Adapter = {
        // Init adapter
        return ___VARIABLE_productName:identifier___Adapter(viewModel: viewModel)
    }()
    
    // MARK: - Cancellables
    
    /// A set to hold Combine cancellables.
    private var bag = Set<AnyCancellable>()
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Start
        viewModel.start()
    }
    
    deinit {
        // Cancel subscriptions to Combine publishers
        bag.forEach { $0.cancel() }
    }
    
    // MARK: - Actions
    
    /// Action to add a new item.
    ///
    /// - Parameter sender: The button triggering the action.
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create new item
        let newItem = "XYZ"
        // Insert new item
        viewModel.insert(item: newItem)
    }
    
    // MARK: - Action Methods
    
    /* Add action methods here... */

    // MARK: - Public Methods
    
    /* Add public methods here... */
    
    // MARK: - Private Methods
    
    /// This method configures the view model, adapter, and any other necessary components
    /// to establish the communication and interaction between the view, view model, and data.
    ///
    /// The view model represents the data and state of the view, while the adapter acts as
    /// an intermediary between the view and the view model. By configuring these components,
    /// the view controller achieves separation of concerns and facilitates the flow of data and
    /// events within the MVVM architecture.
    private func configure() {
        // Observe UI State
        viewModel.$uiState
            .sink { [weak self] uiState in
                /// Be careful about potential retain cycles, especially when capturing 'self' in
                /// closures. If a subscriber captures self strongly, and the publisher and subscriber
                /// form a strong reference cycle, it might lead to memory leaks. To avoid this, you
                /// can use the unowned or weak keywords to capture self weakly.
                self?.updateUI(by: uiState)
            }
            .store(in: &bag)
        
        // Register table view cell nibs
        tableView.registerNib(___VARIABLE_productName:identifier___ItemTableViewCell.self)
        // Set up table view data source and delegate
        tableView.dataSource = adapter
        tableView.delegate = adapter
    }
    
    private func updateUI(by uiState: ___VARIABLE_productName:identifier___UIState) {
        switch uiState {
        case .loading:
            // Show activity indicator view
            activityIndicatorView.startAnimating()
        case .insert(let indexPath):
            // Insert item at indexPath
            tableView.insertRows(at: [indexPath], with: .automatic)
        case .remove(let indexPath):
            // Remove item at indexPath
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .openDetail(let item):
            // Open detail for item
            print("Open detail for item: \(item)")
        case .completed:
            // Hide activity indicator view
            activityIndicatorView.stopAnimating()
        case .error(let message):
            print(message)
            // Hide activity indicator view
            activityIndicatorView.stopAnimating()
        }
    }
}
