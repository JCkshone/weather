import UIKit

class CountryDetailView: BaseViewController, CountryDetailViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    
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
    }
}

extension CountryDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
