import UIKit

class NumberOneViewController: UICollectionViewController {
    
    var a: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  a = sizeField.text
        
    }
    
    //cколько элементов в одной секции
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    //создаем ячейку и создаем все ее свойства
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = String(indexPath.row)
        cell.backgroundColor = UIColor.green
        
        return cell
        
    }
    
}
