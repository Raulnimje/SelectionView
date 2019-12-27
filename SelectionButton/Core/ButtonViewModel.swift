import UIKit

struct ButtonViewModel {
    
    // MARK: - Private methods
    
    var title: String
    var image: UIImage
    
    var selectedColor: UIColor = .darkGray
    var unselectedColor: UIColor = .lightGray
    
    var isSelected: Bool = false
    
    // MARK: - Life Cycle
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
    
    init(title: String, image: UIImage, isSelected: Bool) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}

extension ButtonViewModel: Equatable {
    static func == (lhs: ButtonViewModel, rhs: ButtonViewModel) -> Bool {
        return lhs.title.lowercased() == rhs.title.lowercased()
    }
}
