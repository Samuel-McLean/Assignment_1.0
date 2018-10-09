/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.ws.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;
import uts.checkout.OrderApplication;
import uts.checkout.Orders;


@Path("/orderApp")
public class OrderService {

    @Context
    private ServletContext application;

    private OrderApplication getOrderApp() throws JAXBException, IOException, Exception {
       
        synchronized (application) {
            OrderApplication orderApp = (OrderApplication) application.getAttribute("orderApp");
            if (orderApp == null) {
                orderApp = new OrderApplication();
                orderApp.setFilePath(application.getRealPath("WEB-INF/orders.xml"));
                application.setAttribute("orderApp", orderApp);
            }
            return orderApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTSOrder";
    }
    
    @Path("orders")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Orders getOrders() throws JAXBException, IOException, Exception{
        return getOrderApp().getOrders();
    }

    @Path("orders/{status}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Orders getOrdertbyStatus(@PathParam("status") String status) throws JAXBException, IOException, Exception{
        return getOrderApp().getOrders().getOrderbyStatus(status);
    }
}

