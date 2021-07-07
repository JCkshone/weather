import UIKit

class CountryDetailView: BaseViewController, CountryDetailViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    typealias cell = WeekTimeTableViewCell
    
    var presenter: CountryDetailPresenterProtocol?
    
    var headerView: HeaderWeather = {
        let view = HeaderWeather(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250))
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
}

extension CountryDetailView {
    func initTableView() {
        headerView.modelView = presenter?.model
        tableView.tableHeaderView = headerView
        tableView.register(cell.nib, forCellReuseIdentifier: cell.identifier)
        tableView.tableFooterView = UIView()
    }
}

extension CountryDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellView = tableView.dequeueReusableCell(withIdentifier: cell.identifier,
                                                           for: indexPath) as? cell else {
            return UITableViewCell()
        }
        cellView.data = presenter?.model?.weekTime ?? []
        cellView.initCollectionView()
        return cellView
    }
}
