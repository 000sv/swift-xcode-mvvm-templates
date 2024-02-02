//  ___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName:identifier___ItemTableViewCellDelegate: AnyObject {
    
}

class ___VARIABLE_productName:identifier___ItemTableViewCell: UITableViewCell {
    
    // MARK: - TableViewCell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup views
        setupViews()
    }
    
    // MARK: - Action Methods
    
    /* Add action methods here... */

    // MARK: - Public Methods
    
    func configure(for item: String, and delegate: ___VARIABLE_productName:identifier___ItemTableViewCellDelegate? = nil) -> UITableViewCell {
        // Get default content configuration
        var content = defaultContentConfiguration()
        content.text = item
        contentConfiguration = content
        // Return self instance
        return self
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        
    }
}
