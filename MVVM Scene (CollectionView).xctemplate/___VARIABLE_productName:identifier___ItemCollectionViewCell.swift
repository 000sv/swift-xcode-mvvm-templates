//  ___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName:identifier___ItemCollectionViewCellDelegate: AnyObject {
    
}

class ___VARIABLE_productName:identifier___ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: - CollectionViewCell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup views
        setupViews()
    }
    
    // MARK: - Action Methods
    
    /* Add action methods here... */

    // MARK: - Public Methods
    
    func configure(for item: String, and delegate: ___VARIABLE_productName:identifier___ItemCollectionViewCellDelegate? = nil) -> UICollectionViewCell {
        // Set label text
        label.text = item
        // Return self instance
        return self
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        
    }
}