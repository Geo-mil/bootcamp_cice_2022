//
//  Contactos.swift
//  Contactos
//
//  Created by Jorge Millan on 9/3/22.
//

import Foundation
import CoreData

final class Contactos: NSManagedObject, Identifiable {
    
    @NSManaged public var apellido: String
    @NSManaged public var direccin: String
    @NSManaged public var edad: String
    @NSManaged public var email: String
    @NSManaged public var genero: String
    @NSManaged public var iniciales: String
    @NSManaged public var nombre: String
    @NSManaged public var telefono: String
    
}
