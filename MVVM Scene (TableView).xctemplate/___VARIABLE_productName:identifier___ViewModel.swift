//  ___FILEHEADER___

import Foundation
import Combine

class ___VARIABLE_productName:identifier___ViewModel: ObservableObject {
    
    // MARK: - UI State
    
    @Published private(set) var uiState: ___VARIABLE_productName:identifier___UIState = .loading
    
    // MARK: - UI Items
    
    var uiItems: [___VARIABLE_productName:identifier___UIItem] {
        // Map data to cell type
        items.compactMap { .default($0) }
    }
    
    // MARK: - Properties
    
    private var repository: ___VARIABLE_productName:identifier___Repository!
    
    // MARK: - Data
    
    private var items: [String] = []
    
    // MARK: - Init
    
    init(repository: ___VARIABLE_productName:identifier___Repository) {
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    func start() {
        if items.isEmpty {
            // Notify fetch is in progress
            self.uiState = .loading
        }
        // Fetch data
        repository.fetch { items in
            // Handle new incoming items
            self.handle(newItems: items)
        }
    }
    
    func insert(item: String, at indexPath: IndexPath? = nil) {
        // Insert item at index path
        _insert(item: item, at: indexPath)
    }
    
    func delete(at indexPath: IndexPath) {
        // Delete item at index path
        _delete(at: indexPath)
    }
    
    func openDetail(item: String) {
        // Open item
        uiState = .openDetail(item)
    }
    
    // MARK: - Private Methods
    
    private func handle(newItems: [String]) {
        // Calculate differences between the current and new arrays
        let changeset = newItems.difference(from: self.items)
        
        // Apply changes to the items array
        for change in changeset {
            switch change {
            case .insert(let offset, let item, _):
                // Insert item at index path
                _insert(item: item, at: IndexPath(row: offset, section: 0))
            case .remove(let offset, _, _):
                // Delete item at index path
                _delete(at: IndexPath(row: offset, section: 0))
            }
        }
        // Notify completion
        self.uiState = .completed
    }
    
    private func _insert(item: String, at indexPath: IndexPath?) {
        if let indexPath {
            // Insert item at offset
            items.insert(item, at: indexPath.item)
            // Notify item has been inserted
            uiState = .insert(indexPath)
        } else {
            // Append item to current items
            items.append(item)
            // Prepare index path
            let indexPath = IndexPath(row: items.count - 1, section: 0)
            // Notify item has been inserted
            uiState = .insert(indexPath)
        }
    }
    
    private func _delete(at indexPath: IndexPath) {
        // Remove item at offset
        items.remove(at: indexPath.item)
        // Notify item has been removed
        uiState = .remove(indexPath)
    }
}
