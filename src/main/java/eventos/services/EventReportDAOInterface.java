package eventos.services;


import java.sql.SQLException;
import java.util.List;
import eventos.models.EventReport;

public interface EventReportDAOInterface {
    public List<EventReport> getEventReports(int eventId) ;
    public int[] getEventSales(int eventId);
}
