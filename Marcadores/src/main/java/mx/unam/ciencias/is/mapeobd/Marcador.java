/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.mapeobd;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Clase que modela un marcador apartir de la tabla marcador
 * @author jonathan
 */
@Entity
@Table(name="marcador")
public class Marcador {
    @Id@GeneratedValue(strategy =GenerationType.IDENTITY )
    @Column(name = "idmarcador")
    private int marcador_id;
    
    //Aqui va tu codigo
    
    /**Nos da el id del marcador
     * @return el id del marcador 
    */
    public int getMarcador_id() {
        return marcador_id;
    }
    
    /** Pone el id del marcador.
      @param marcador_id 
    */
    public void setMarcador_id(int marcador_id) {
        this.marcador_id = marcador_id;
    }
    
    
    //Aqui va tu codigo
}
