//
//  WeekTimeTableViewCell.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 7/07/21.
//

import UIKit

class WeekTimeTableViewCell: UITableViewCell {
    
    typealias cell = TimeCollectionViewCell

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [WeatherTime] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension WeekTimeTableViewCell {
    
    func initCollectionView() {
        collectionView.register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension WeekTimeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellView = collectionView.dequeueReusableCell(withReuseIdentifier: cell.identifier,
                                                                for: indexPath) as? cell else {
            return UICollectionViewCell()
        }
        cellView.timeTemp.text = "\(Int(data[indexPath.row].maxTemp))°"
        cellView.timeImg.image = UIImage(named: data[indexPath.row].weatherTime)
        cellView.dayLabel.text = data[indexPath.row].weatherStateName
        return cellView
    }
}
