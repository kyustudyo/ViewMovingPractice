//
//  ViewController.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import UIKit

class MyTableViewController: UITableViewController {

    let viewModel = MyModelViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        fetchData()
      
      
    }
    func fetchData(){
        let url = url1
        let Resource = Resource<MyData>(url: url) { data in
            let data = try? JSONDecoder().decode(MyData.self, from: data)
            return data
        }
        Webservice().load(resource: Resource) { [weak self] result in
            if let data = result {
                print("d",data.array)
                self?.viewModel.divideData(data: data)
                self?.tableView.reloadData()
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.array.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTabelCell", for: indexPath) as! MainTableCell
        
        cell.confiugure(data: viewModel.array[indexPath.row])
        
        return cell
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            prepareSegueForDetail(segue: segue)
        }
        else if segue.identifier == "navi" {//네비게이션이 있을 때.
            prepareSegueForNavi(segue: segue)
        }
    }
    //네비게이션 없을때 seuge. 디테일. segue를 뷰전체가아닌 셀에다 연결했기때문에,
    //perform segue를 통한 sender 전달이 필요없다.
    private func prepareSegueForDetail(segue: UIStoryboardSegue){
        guard let detailViewController = segue.destination as? DetailViewController,
              let indexPath = self.tableView.indexPathForSelectedRow else{ return}
        let array = self.viewModel.array[indexPath.row]
        detailViewController.array = array
        detailViewController.vm = viewModel
        print(indexPath.row)
    }
    
    //네비게이션이 있을 때 segue
    private func prepareSegueForNavi(segue : UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError()
        }
        guard let vc = nav.viewControllers.first as? naviInstantiVC else {
            print("실패")
            return
        }
        print("it is navi")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "Detail", sender: nil)
    }
    
    //instanti. 스토리보드 상에서 연결안해도됨. 오른쪽 위
    @IBAction func instantiButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "haha") as? instantiateViewController else {return}
        present(vc, animated: true, completion: nil)
    }
    
//    @IBAction func instantiButtonWithNavi(_ sender: Any) {//이러면 스토리보드상에 가려는 뷰컨트롤러 아무리 꾸며도 나타나지않는다. 왜냐하면 기존에 것 두고 새로운 네비게이션뷰 만들어서 했다는 뜻이므로, 코드상으로 뷰를 꾸며야 나타나게 된다. 따라서 스토리보드에서 네비게이션 컨틀롤러 만든다음에 연결해서 사용해야 할것이다.
//        let nav = UINavigationController(rootViewController: naviInstantiVC())
//        nav.modalPresentationStyle = .popover
//        present(nav, animated: true, completion: nil)
//    }//스토리보드에서 연결했기 때문에 호출되지않는다.
    
    


}

