//
//  NameAgeController.swift
//  NameAge
//
//  Created by Daniel Washington Ignacio on 28/10/21.
//

import Foundation
import Alamofire

class NameAgeController{
    
    var arrayNameAge: [NameAge] = []
    var name: String = ""

    func nameFunc(nameFunc: String){
        name = nameFunc
    }
        
    
func getAge(completion: @escaping (Bool, Error?) -> Void){
    AF.request("https://api.agify.io/?name=\(name)").responseJSON { response in
        if response.response?.statusCode == 200 {
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(NameAge.self, from: data)
                    self.arrayNameAge.append(result)
                    completion(true, nil)
                }catch{
                    completion(false,error)
                }
            }else{
                print("error")
            }
            
        }
        
    }
}

}
