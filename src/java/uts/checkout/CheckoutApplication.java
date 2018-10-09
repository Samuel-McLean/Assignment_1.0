package uts.checkout;
import java.io.*;
import javax.xml.bind.*;

public class CheckoutApplication implements Serializable {

    private String filePath;
    private Orders orders;

    public CheckoutApplication() {
    }

    public CheckoutApplication(String filePath, Orders orders) {
        super();
        this.filePath = filePath;
        this.orders = orders;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {

        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Orders.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        orders = (Orders) u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

    public void updateXML(Orders orders, String filePath) throws Exception {
        this.orders = orders;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Orders.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(orders, fout);
        fout.close();
    }    
    
    public void saveOrders() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Orders.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(orders, fout);
        fout.close();
    }
    
    public Orders getOrders() {
        return orders;
    }

    public Order getOrder(String title){
        return orders.getOrder(title);
    }
}
