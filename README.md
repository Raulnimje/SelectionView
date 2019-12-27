# SelectionView

## Screenshots

| Single | Multiple | Both |
| ------ | ------ | ------ |
| ![launch](https://github.com/cristhianleonli/SelectionView/blob/master/screenshots/screen_1.png) | ![launch](https://github.com/cristhianleonli/SelectionView/blob/master/screenshots/screen_2.png) | <img src="https://github.com/cristhianleonli/AlbumJet/blob/master/screenshots/quick_video.gif" width="250"> |

## What's in the box
- Core/SelectionView.swift
- Core/SelectionViewModel.swift
- Core/SelectionItem.swift
- Core/SelectionItemModel.swift
- Core/SelectionViewConfiguration.swift
- Core/Layout+Util.swift

## Usage

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet private var selectionViewSingle: SelectionView!
    @IBOutlet private var selectionViewMultiple: SelectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSelection()
    }
}

private extension ViewController {
    func setupSelection() {
        // configure the options
        let options = [
            SelectionItemModel(title: "Reports", image: Images.board),
            SelectionItemModel(title: "Files", image: Images.file),
            SelectionItemModel(title: "Gestures", image: Images.hand),
            SelectionItemModel(title: "Sports", image: Images.shoe),
            SelectionItemModel(title: "Weather", image: Images.temp)
        ]

        selectionView.configuration = SelectionViewConfiguration(
            options: options,
            selectedColor: UIColor(red: 53/255, green: 59/255, blue: 81/255, alpha: 1),
            unselectedColor: .white,
            multipleSelection: true
        )
        
        // event when items in the list changed
        selectionViewSingle.itemsDidChange = { models in
            models.forEach { print($0) }
        }
    }
}
```