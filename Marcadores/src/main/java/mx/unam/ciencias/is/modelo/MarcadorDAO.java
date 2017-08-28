/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.modelo;
import mx.unam.ciencias.is.mapeobd.Marcador;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author jonathan
 */
public class MarcadorDAO {
    
    /*Sesion para conectarnos a la base de datos*/
    private SessionFactory sessionFactory;
    
    /**
     * Inicialisamos la sesion a la base de datos.
     * @param sessionFactory 
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    
    /**
     * Guarda un marcador a la base de datos 
     * @param marcador el marcador a guardar.
     */
    public void guardar(Marcador marcador) {
        //se inicia la sesion
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //guardamos el marcador
            session.persist(marcador);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        }
        finally {
            //cerramos simpre la sesion
            session.close();
        }
    
    }
    
    /**
     * Regresa la lista de todos los marcadores en la base de datos
     * @return la lista que contiene a todos los marcadores de la base de datos
     */
    public List<Marcador> getMarcadores(){
        //Aqui va tu codigo
    }
    
    /**
     * Regresa el marcador con la longitud  y latitud dada. 
     * @param lattitud
     * @param longitud
     * @return el marcador con la longitud y latitud dada.
     */
    public Marcador getMarcador(double latitud,double longitud) {
        //aqui va tu codigo
    }
    
    /**
     * Regresa el marcador con el id dado
     * @param id del marcador 
     * @return el marcador con ese id
     */
    public Marcador getMarcadorId(int id) {
        //aqui va tu codigo
    }
    
    
    /**
     * Elimina el marcador de la base de datos
     * @param marcador el marcador a eliminar
     */
    public void eliminar(Marcador marcador) {
        //aqui va tu codigo
    }
    
    /**
     * Actualiza el marcardor en la base de datos
     * @param marcador con los nuevos valores 
     */
    public void actualizar(Marcador marcador) {
        //aqui va tu codigo
    }
}