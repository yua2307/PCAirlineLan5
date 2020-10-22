/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name = "AirBrand")
public class AirlineBrand implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="airBrandId")
    private int brandId;
    
    @Column(name="nameAirBrand")
    private String brandName;
    
    // relationship with table Aircaft
    @OneToMany(mappedBy = "airlineBrand",fetch = FetchType.LAZY)
    private List<Aircaft> listAircaft;

    public AirlineBrand() {
    }

    public AirlineBrand(int brandId, String brandName, List<Aircaft> listAircaft) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.listAircaft = listAircaft;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public List<Aircaft> getListAircaft() {
        return listAircaft;
    }

    public void setListAircaft(List<Aircaft> listAircaft) {
        this.listAircaft = listAircaft;
    }
    
    
    
}
