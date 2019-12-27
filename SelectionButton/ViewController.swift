import UIKit
import PureLayout

class ViewController: UIViewController {

    @IBOutlet private var toggle: UISwitch!
    
    private let selectionView = SelectionView(forAutoLayout: ())
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
        
        setupToggle()
        addStack()
    }
}

private extension ViewController {
    func addStack() {
        view.addSubview(selectionView)
        
        selectionView.autoPinEdge(.top, to: .bottom, of: toggle, withOffset: 40)
        selectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        selectionView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        selectionView.autoSetDimension(.height, toSize: 75)
        
        // set multiple selection true by default
        selectionView.configuration = viewModel.selectionConfig(multiple: true)
        
        // event when items in the list changed
        selectionView.itemsDidChange = { models in
            models.forEach { print($0) }
        }
    }
    
    // simple toggle to enable multiple choise option
    func setupToggle() {
        toggle.isOn = true
        toggle.onTintColor = viewModel.selectionColor
        toggle.tintColor = viewModel.selectionColor
    }
    
    @IBAction func toggleChanged(_ sender: UISwitch) {
        // set the viewModel again to the selectionView, it will redraw
        selectionView.configuration = viewModel.selectionConfig(multiple: sender.isOn)
    }
}
