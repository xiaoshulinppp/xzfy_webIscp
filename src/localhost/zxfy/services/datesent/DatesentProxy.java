package localhost.zxfy.services.datesent;

public class DatesentProxy implements localhost.zxfy.services.datesent.Datesent {
  private String _endpoint = null;
  private localhost.zxfy.services.datesent.Datesent datesent = null;
  
  public DatesentProxy() {
    _initDatesentProxy();
  }
  
  public DatesentProxy(String endpoint) {
    _endpoint = endpoint;
    _initDatesentProxy();
  }
  
  private void _initDatesentProxy() {
    try {
      datesent = (new localhost.zxfy.services.datesent.DatesentServiceLocator()).getdatesent();
      if (datesent != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)datesent)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)datesent)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (datesent != null)
      ((javax.xml.rpc.Stub)datesent)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public localhost.zxfy.services.datesent.Datesent getDatesent() {
    if (datesent == null)
      _initDatesentProxy();
    return datesent;
  }
  
  public java.lang.String test(java.lang.String name) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.test(name);
  }
  
  public java.lang.Object[] sendname(java.lang.String id) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.sendname(id);
  }
  
  public java.lang.Object[] sentdogs() throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.sentdogs();
  }
  
  public java.lang.Object[] sentObject(java.lang.String operateCode) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.sentObject(operateCode);
  }
  
  public java.lang.String stringdogs() throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.stringdogs();
  }
  
  public java.lang.String updateStatus(java.lang.String xzfyInfo2Id, java.lang.String receive_real_date, java.lang.String receive_date, java.lang.String isBuzheng, java.lang.String bzTongzhiriqi, java.lang.String bzBuqiriqi, java.lang.String lian_date, java.lang.String tjzfzh, java.lang.String isstop, java.lang.String isstop_from, java.lang.String breakTo, java.lang.String yanqispdate, java.lang.String finish_date, java.lang.String finish_type) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.updateStatus(xzfyInfo2Id, receive_real_date, receive_date, isBuzheng, bzTongzhiriqi, bzBuqiriqi, lian_date, tjzfzh, isstop, isstop_from, breakTo, yanqispdate, finish_date, finish_type);
  }
  
  
}