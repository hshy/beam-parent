package com.hsshy.beam.modular.tool.dto.redwine;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description:
 * @author: hs
 * @create: 2019-08-30 11:18:14
 **/
public class ResultBean {
    /**
     * classifyByColor : 红葡萄酒/Red Wine
     * subRegionCn : 梅多克
     * wineNameCn : 拉图嘉利庄园红葡萄酒（正牌）
     * subRegionEn : Medoc
     * regionEn : Bordeaux
     * color : 深紫红色/Dark Violet
     * wineNameEn : Chateau La Tour Carnet
     * hasdetail : 1
     * wineryCn : 拉图嘉利庄园
     * classifyBySugar : 干型/Dry
     * tasteTemperature : 16-18℃
     * regionCn : 波尔多
     * wineryEn : Chateau La Tour-Carnet
     * grapeCn :
     * grapeEn :
     * countryCn : 法国
     * countryEn : France
     * description : 此酒充满红果和黑果味道，并带有矿物质和花香（紫罗兰，玫瑰），混合些许香草气息，单宁柔软，余香悠长。在口中留下清新的味道，香料和香草味道萦绕口中。
     */

    @JSONField(name = "classifyByColor")
    private String classifyByColor;
    @JSONField(name = "subRegionCn")
    private String subRegionCn;
    @JSONField(name = "wineNameCn")
    private String wineNameCn;
    @JSONField(name = "subRegionEn")
    private String subRegionEn;
    @JSONField(name = "regionEn")
    private String regionEn;
    @JSONField(name = "color")
    private String color;
    @JSONField(name = "wineNameEn")
    private String wineNameEn;
    @JSONField(name = "hasdetail")
    private int hasdetail;
    @JSONField(name = "wineryCn")
    private String wineryCn;
    @JSONField(name = "classifyBySugar")
    private String classifyBySugar;
    @JSONField(name = "tasteTemperature")
    private String tasteTemperature;
    @JSONField(name = "regionCn")
    private String regionCn;
    @JSONField(name = "wineryEn")
    private String wineryEn;
    @JSONField(name = "grapeCn")
    private String grapeCn;
    @JSONField(name = "grapeEn")
    private String grapeEn;
    @JSONField(name = "countryCn")
    private String countryCn;
    @JSONField(name = "countryEn")
    private String countryEn;
    @JSONField(name = "description")
    private String description;

    public String getClassifyByColor() {
        return classifyByColor;
    }

    public void setClassifyByColor(String classifyByColor) {
        this.classifyByColor = classifyByColor;
    }

    public String getSubRegionCn() {
        return subRegionCn;
    }

    public void setSubRegionCn(String subRegionCn) {
        this.subRegionCn = subRegionCn;
    }

    public String getWineNameCn() {
        return wineNameCn;
    }

    public void setWineNameCn(String wineNameCn) {
        this.wineNameCn = wineNameCn;
    }

    public String getSubRegionEn() {
        return subRegionEn;
    }

    public void setSubRegionEn(String subRegionEn) {
        this.subRegionEn = subRegionEn;
    }

    public String getRegionEn() {
        return regionEn;
    }

    public void setRegionEn(String regionEn) {
        this.regionEn = regionEn;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getWineNameEn() {
        return wineNameEn;
    }

    public void setWineNameEn(String wineNameEn) {
        this.wineNameEn = wineNameEn;
    }

    public int getHasdetail() {
        return hasdetail;
    }

    public void setHasdetail(int hasdetail) {
        this.hasdetail = hasdetail;
    }

    public String getWineryCn() {
        return wineryCn;
    }

    public void setWineryCn(String wineryCn) {
        this.wineryCn = wineryCn;
    }

    public String getClassifyBySugar() {
        return classifyBySugar;
    }

    public void setClassifyBySugar(String classifyBySugar) {
        this.classifyBySugar = classifyBySugar;
    }

    public String getTasteTemperature() {
        return tasteTemperature;
    }

    public void setTasteTemperature(String tasteTemperature) {
        this.tasteTemperature = tasteTemperature;
    }

    public String getRegionCn() {
        return regionCn;
    }

    public void setRegionCn(String regionCn) {
        this.regionCn = regionCn;
    }

    public String getWineryEn() {
        return wineryEn;
    }

    public void setWineryEn(String wineryEn) {
        this.wineryEn = wineryEn;
    }

    public String getGrapeCn() {
        return grapeCn;
    }

    public void setGrapeCn(String grapeCn) {
        this.grapeCn = grapeCn;
    }

    public String getGrapeEn() {
        return grapeEn;
    }

    public void setGrapeEn(String grapeEn) {
        this.grapeEn = grapeEn;
    }

    public String getCountryCn() {
        return countryCn;
    }

    public void setCountryCn(String countryCn) {
        this.countryCn = countryCn;
    }

    public String getCountryEn() {
        return countryEn;
    }

    public void setCountryEn(String countryEn) {
        this.countryEn = countryEn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
