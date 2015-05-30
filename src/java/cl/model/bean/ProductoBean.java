/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.model.bean;

import cl.services.webservices.ProductoWebS_Service;
import cl.services.webservices.Productos;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author caldep
 */
@ManagedBean
@SessionScoped
public class ProductoBean {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/ProductosWS/ProductoWebS.wsdl")
    private ProductoWebS_Service service;

    private Integer codigo;
    private String nombre;
    private Integer precio;
    private Integer stock;
    private String descripcion;

    /**
     * Creates a new instance of ProductoBean
     */
    public ProductoBean() {
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    private String buscarProducto(int codigo) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        cl.services.webservices.ProductoWebS port = service.getProductoWebSPort();
        return port.buscarProducto(codigo);
    }

    private String insertarProducto(java.lang.Integer codigo, java.lang.String nombre, int precio, int stock, java.lang.String descripcion) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        cl.services.webservices.ProductoWebS port = service.getProductoWebSPort();
        return port.insertarProducto(codigo, nombre, precio, stock, descripcion);
    }

    private java.util.List<cl.services.webservices.Productos> listarProductos() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        cl.services.webservices.ProductoWebS port = service.getProductoWebSPort();
        return port.listarProductos();
    }

    public String guardarProducto() {
        String msg = insertarProducto(codigo, nombre, precio, stock, descripcion);
        FacesMessage msj = new FacesMessage(FacesMessage.SEVERITY_INFO, msg, "...");
        FacesContext.getCurrentInstance().addMessage(null, msj);
        limpiarFormulario();
        return "index";
    }

    public String buscarProducto() {
        String msg = buscarProducto(codigo);
        FacesMessage msj = new FacesMessage(FacesMessage.SEVERITY_INFO, msg, "...");
        FacesContext.getCurrentInstance().addMessage(null, msj);
        limpiarFormulario();
        return "index";
    }

    public List<Productos> getListaProductos() {
        return listarProductos();
    }

    public void limpiarFormulario() {
        this.codigo = 0;
        this.nombre = "";
        this.precio = 0;
        this.stock = 0;
        this.descripcion = "";
    }
}
