package com.menu_cocina.persistencia.test;
import com.menu_cocina.persistencia.entity.HibernateUtil;
import com.menu_cocina.persistencia.entity.Camarero;
import com.menu_cocina.persistencia.entity.Cliente;
import com.menu_cocina.persistencia.entity.Detallefactura;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Harold
 */
public class TestFactura {

    public static void main(String[] args) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.clear();
            Transaction transaction = session.beginTransaction();

            Camarero camarero = new Camarero();
            camarero.setNombre("Andres");
            camarero.setApellido1("Gomez");
            camarero.setApellido2("Forero");
            
            Cliente cliente = new Cliente();
            cliente.setNombre("Andres");
            cliente.setApellido1("Gomez");
            cliente.setApellido2("Forero");
            
            
            try {
                session.save(camarero);
                session.save(cliente);
                transaction.commit();
                System.exit(0);
            } catch (Exception objError) {
                System.out.println("No pudo insertar el registro debido a: " + objError.getMessage());
                transaction.rollback();
                System.exit(0);
            }
            session.close();
        } catch (Exception objError) {
            System.out.println("No pudo conectar a la base de datos por: " + objError.getMessage());
            System.exit(0);
        }
        System.exit(0);
    }
}
