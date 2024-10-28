/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelAdmin;

/**
 *
 * @author HP
 */
public class ReservationHasService {
    private int reservationid ;
    private int serviceid;
    private int quantity;
    private float sales;

    public ReservationHasService() {
    }

    public ReservationHasService(int reservationid, int serviceid, int quantity, float sales) {
        this.reservationid = reservationid;
        this.serviceid = serviceid;
        this.quantity = quantity;
        this.sales = sales;
    }

    public int getReservationid() {
        return reservationid;
    }

    public void setReservationid(int reservationid) {
        this.reservationid = reservationid;
    }

    public int getServiceid() {
        return serviceid;
    }

    public void setServiceid(int serviceid) {
        this.serviceid = serviceid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getSales() {
        return sales;
    }

    public void setSales(float sales) {
        this.sales = sales;
    }

 
}
