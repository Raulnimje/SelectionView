# SelectionView

## What's in the box
- Core/SelectionView.swift
- Core/SelectionViewModel.swift
- Core/SelectionItem.swift
- Core/SelectionItemModel.swift
- Core/SelectionViewConfiguration.swift

## Usage

```swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSelectionView()
    }

    func addSelectionView() {
        let selectionView = SelectionView(forAutoLayout: ())
        view.addSubview(selectionView)

        // TODO: Set the `SelectionView` constraints

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
    }
}
```