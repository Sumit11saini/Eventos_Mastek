package eventos.models;

public class EventReport {
    private int eventId;
    private String ticketCategory;
    private double ticketPrice;
    private int totalTickets;
    private int bookingQuantity;

    // Default constructor
    public EventReport() {
    }

    // Parameterized constructor
    public EventReport(int eventId, String ticketCategory, double ticketPrice, int totalTickets, int bookingQuantity) {
        this.eventId = eventId;
        this.ticketCategory = ticketCategory;
        this.ticketPrice = ticketPrice;
        this.totalTickets = totalTickets;
        this.bookingQuantity = bookingQuantity;
    }

    // Getters and setters
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getTicketCategory() {
        return ticketCategory;
    }

    public void setTicketCategory(String ticketCategory) {
        this.ticketCategory = ticketCategory;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getTotalTickets() {
        return totalTickets;
    }

    public void setTotalTickets(int totalTickets) {
        this.totalTickets = totalTickets;
    }

    public int getBookingQuantity() {
        return bookingQuantity;
    }

    public void setBookingQuantity(int bookingQuantity) {
        this.bookingQuantity = bookingQuantity;
    }
}