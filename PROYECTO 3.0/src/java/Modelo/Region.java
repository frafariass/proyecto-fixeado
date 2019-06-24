/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author lordp
 */
public class Region {
    
    private int region_id;
    private String region_nombre;
    private String region_ordinal;

    public Region() {
    }

    public Region(int region_id, String region_nombre, String region_ordinal) {
        this.region_id = region_id;
        this.region_nombre = region_nombre;
        this.region_ordinal = region_ordinal;
    }

    public int getRegion_id() {
        return region_id;
    }

    public void setRegion_id(int region_id) {
        this.region_id = region_id;
    }

    public String getRegion_nombre() {
        return region_nombre;
    }

    public void setRegion_nombre(String region_nombre) {
        this.region_nombre = region_nombre;
    }

    public String getRegion_ordinal() {
        return region_ordinal;
    }

    public void setRegion_ordinal(String region_ordinal) {
        this.region_ordinal = region_ordinal;
    }
    
    
    
}
