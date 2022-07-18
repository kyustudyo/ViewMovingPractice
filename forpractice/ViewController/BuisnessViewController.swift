//
//  ViewController.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import UIKit

class BuisnessViewController: UITableViewController {

    let viewModel = TransportViewModel()
    private let cellId = "MainTabelCell"
    @IBOutlet weak var editedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    @IBAction func goEditView(_ sender: Any) {
        let delegateController = DelegateController()
        delegateController.delegate = self
        delegateController.modalPresentationStyle = .overFullScreen
        present(delegateController, animated: true)
    }
    @IBAction func goNews(_ sender: UIButton) {
        let vc = NewsViewController()
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
    func configureUI() {
        editedLabel.text = "바뀌기 전"
    }
    
    func fetchData(){
        
        let url = Constants.URLs.transportURL
        let dataResource = Resource<DataResponse>(url: url) { data in
            let data = try? JSONDecoder().decode(DataResponse.self, from: data)
            return data
        }
        
        Webservice().load(resource: dataResource) { [weak self] result in
            if let data = result, let this = self {
                this.viewModel.divideData(data: data)
                this.tableView.reloadData()
            }
            
        }
        
//        let articleUrl = Constants.URLs.articleURL
//        let articleResource = Resource<ArticleList>(url: articleUrl) { data in
//            let data = try? JSONDecoder().decode(ArticleList.self, from: data)
//            return data
//        }
//        
//        Webservice().load(resource: articleResource) { [weak self] result in
//            if let data = result, let this = self {
//                
//            }
//        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MainTableCell
        cell.confiugure(data: viewModel.array[indexPath.row])
        return cell
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {// push
            prepareSegueForDetail(segue: segue)
        } else if segue.identifier == "Navi" { //네비게이션이 있을 때. 좌측 위. present.
            prepareSegueForNavi(segue: segue)
        }
    }
    
    // 네비게이션 없을때 seuge를 통한 디테일로 이동.
    // segue를 뷰전체가아닌 셀에다 연결했기때문에,
    // perform segue를 통한 sender 전달이 필요없다.
    private func prepareSegueForDetail(segue: UIStoryboardSegue){
        guard let detailViewController = segue.destination as? DetailViewController,
              let indexPath = self.tableView.indexPathForSelectedRow else{ return}
        let array = self.viewModel.array[indexPath.row]
        detailViewController.array = array
        detailViewController.vm = viewModel
        print(indexPath.row)
    }
    
    // 좌측 위 버튼
    // 네비게이션이 있을 때 segue
    // 디테일한 뷰로 이동
    // present로 구현되어 있다
    private func prepareSegueForNavi(segue : UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError()
        }
        guard let _ = nav.viewControllers.first as? NaviTopLeftViewController else {
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 스토리보드상에서 연결해놨기때문에 내용 없다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // instanti. 스토리보드 상에서 연결안할때
    // 오른쪽위
    @IBAction func instantiButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "noConnection") as? NaviTopRightViewController else {return}
        present(vc, animated: true, completion: nil)
    }
    
//    @IBAction func instantiButtonWithNavi(_ sender: Any) {//이러면 스토리보드상에 가려는 뷰컨트롤러 아무리 꾸며도 나타나지않는다. 왜냐하면 기존에 것 두고 새로운 네비게이션뷰 만들어서 했다는 뜻이므로, 코드상으로 뷰를 꾸며야 나타나게 된다.
//        let nav = UINavigationController(rootViewController: naviInstantiVC())
//        nav.modalPresentationStyle = .popover
//        present(nav, animated: true, completion: nil)
//    }
    //스토리보드에서 연결했기 때문에 호출되지않는다.
}

extension BuisnessViewController: EditDelegate {
    
    func edit(text: String) {
        editedLabel.text = text
        dismiss(animated: true)
    }
    
    func exit() {
        dismiss(animated: true)
    }
}
