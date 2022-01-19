//
//  ViewController.swift
//  MiAppPickerView
//
//  Created by cice on 19/01/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables globales
    let quesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    //MARK: - IBOutlets
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    @IBOutlet weak var imagenQuesoImV: UIImageView!
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
    }

    //MARK: - Metodos privados
    private func configuracionUI(){
        self.title = "Quesos del mundo"
        self.tituloQuesoLBL.text = self.quesosArrayData.first
        self.detalleTextQuesoTXV.text = "El provolone (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData.first ?? "placeholder")
    }

    private func configuracionPickerView(){
        self.pickerQuesoPicV.delegate = self
        self.pickerQuesoPicV.dataSource = self
    }
}

//MARK: - extension -> UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.tituloQuesoLBL.text = self.quesosArrayData[row]
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData[row])
        
        switch row {
        case 0:
            self.detalleTextQuesoTXV.text = "El provolone (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        case 1:
            self.detalleTextQuesoTXV.text = "El Mozarella (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        case 2:
            self.detalleTextQuesoTXV.text = "El Gorgonzola (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        case 3:
            self.detalleTextQuesoTXV.text = "El Stilton (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        case 4:
            self.detalleTextQuesoTXV.text = "El Asiago (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        default:
            self.detalleTextQuesoTXV.text = "El queso (Provolone Val Padana) es un queso italiano originario del Norte del país, donde se sigue produciendo en piezas de 10 a 15 centímetros con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso provolone fue descubierto o creado por la familia Visani en Deruta, en el centro de Italia. En Estados Unidos se comercializa con el nombre de provolone un queso relativamente barato utilizado como aliño para pizzas, que se parece al original italiano sólo en color y textura, pero no en sabor."
        }
    }
    
}

// MARK: -
extension ViewController: UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pikerView: UIPickerView, numberOfRowsInComponent component: Int ) -> Int {
        return self.quesosArrayData.count
    }
}
