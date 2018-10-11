package uts.movie.checkout;

import java.io.PrintWriter;
import java.io.Serializable;
import java.io.Writer;
import javax.xml.bind.annotation.*;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "orders")
public class Orders implements Serializable {

    @XmlElement(name = "order")
    private ArrayList<Order> list = new ArrayList<>();

    public Orders() {
    }
    
    public ArrayList<Order> getList() {
        return list;
    }

    //make sure to run this before giving the user their orderID
    public void addOrder(Order order) {
        //can only add an order once it has been checked to make sure that the orderID is unique.
        for(int i=0; i < list.size(); ++i){
            if(order.getOrderID().equals(list.get(i).getOrderID())){
                order.generateNewOrderID();
                i=0;
            }
        }
        list.add(order);
    }

    public void removeOrders(ArrayList<Order> list) {        
        this.list.remove(list);
    }

    public Order getOrder(String ID) {
        for (Order order : list) {
            if (order.getOrderID().equals(ID)) {
                return order;
            }
        }
        return null;
    }

    public void remove(Order order) {
        list.remove(order);
    }

    public boolean exist(Order order) {
        return list.contains(order);
    }
    
     public Orders getOrderbyStatus(String status) {
        Orders orders = new Orders();
        ArrayList<Order> statusList = new ArrayList<>();
        for (Order order: list) {
            if (order.getStatus().trim().equalsIgnoreCase(status)) {
                statusList.add(order);
            }
        }
        orders.list = statusList;
        return orders;
    }

    public void resetOrders(ArrayList<Order> list){
        for(Order order:list)
            if(!order.getStatus().trim().equalsIgnoreCase("completed"))
                order.setStatus("cancelled");
    }
    public ArrayList<Order> findOrder(String search) {
        ArrayList<Order> found = new ArrayList();
        list.stream().filter((order) -> (order.getStatus().trim().equalsIgnoreCase(search)
                || order.getOrderID().trim().equalsIgnoreCase(search))).forEach((order) -> {
            found.add(order);
        });
        return found;
    }
    
    public void print(ArrayList<Order> list, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"orders_table\" align=\"center\">");
        out.print("\n<thead><th>Name</th><th>Email</th><th>Subject</th></thead>");

        list.stream().map((order) -> {
            out.println("<tr > ");
            out.println("<td>" + order.getOrderID() + "</td>");
            return order;
        }).map((order) -> {
            out.println("<td >" + order.getStatus() + "</td>");
            return order;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }
    
    public ArrayList<Order> getUserOrders(String email, String name){
        ArrayList<Order> userList = new ArrayList();
        for(Order order:list)
            if(order.getEmail().equalsIgnoreCase(email) || order.getUserName().equalsIgnoreCase(name))
                userList.add(order);
        return userList;
    }
    
    public void printOrders(ArrayList<Order> list, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"orders_table\" align=\"center\">");
        out.print("\n<thead><th>Order ID</th><th>Status</th><th>Subject</th><th>Tutor</th></thead>");

        list.stream().map((order) -> {
            String href = order.verifyStatus() ? "<a class=\"link\" href=\"vieworder.jsp?orderIDSelect=" + order.getOrderID()+ "\" >" + order.getOrderID() + "</a>" :order.getOrderID() ;
            out.println("<tr > ");
            out.println("<td>" + href+ "</td>");
            return order;
        }).map((order) -> {
            out.println("<td >" + order.getStatus() + "</td>");
            return order;
        }).map((order) -> {
            out.println("<td >" + order.getUserName() + "</td>");
            return order;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }
}   