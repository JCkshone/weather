import UIKit

class HomeView: BaseViewController, HomeViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: HomePresenterProtocol?
    typealias cell = HomeItemTableViewCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEvents()
        initTableView()
        setSearchBar()
        presenter?.viewDidLoad()
    }
}

extension HomeView {
    func setSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar"
        searchController.delegate = self
        navigationItem.searchController = searchController
        navigationController?.navigationBar.isTranslucent = true
        searchController.searchBar.delegate = self
        searchController.isActive = false
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Buscar"
        
    }
}

extension HomeView: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if !(searchBar.text?.isEmpty ?? true) {
            presenter?.textForSearch = searchBar.text ?? ""
        }
    }
}

extension HomeView {
    func initTableView() {
        tableView.register(cell.nib, forCellReuseIdentifier: cell.identifier)
        tableView.tableFooterView = UIView()
    }
    
    func setupEvents() {
        presenter?.dataIsLoadComplete = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNumberItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellView = tableView.dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as? cell else { return UITableViewCell() }
        if let dataModel = presenter?.getItem(index: indexPath) {
            cellView.modelView = dataModel
        }
        return cellView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectItem(index: indexPath)
    }
}
