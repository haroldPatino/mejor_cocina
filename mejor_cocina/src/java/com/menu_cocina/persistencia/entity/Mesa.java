package com.menu_cocina.persistencia.entity;
// Generated 10/04/2019 12:07:59 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Mesa generated by hbm2java
 */
public class Mesa  implements java.io.Serializable {


     private Integer idMesa;
     private int numMaxComensales;
     private String ubicacion;
     private Set facturas = new HashSet(0);

    public Mesa() {
    }

	
    public Mesa(int numMaxComensales, String ubicacion) {
        this.numMaxComensales = numMaxComensales;
        this.ubicacion = ubicacion;
    }
    public Mesa(int numMaxComensales, String ubicacion, Set facturas) {
       this.numMaxComensales = numMaxComensales;
       this.ubicacion = ubicacion;
       this.facturas = facturas;
    }
   
    public Integer getIdMesa() {
        return this.idMesa;
    }
    
    public void setIdMesa(Integer idMesa) {
        this.idMesa = idMesa;
    }
    public int getNumMaxComensales() {
        return this.numMaxComensales;
    }
    
    public void setNumMaxComensales(int numMaxComensales) {
        this.numMaxComensales = numMaxComensales;
    }
    public String getUbicacion() {
        return this.ubicacion;
    }
    
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
    public Set getFacturas() {
        return this.facturas;
    }
    
    public void setFacturas(Set facturas) {
        this.facturas = facturas;
    }




}

