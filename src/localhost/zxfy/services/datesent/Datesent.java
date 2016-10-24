/**
 * Datesent.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.zxfy.services.datesent;

public interface Datesent extends java.rmi.Remote {
    public java.lang.String test(java.lang.String name) throws java.rmi.RemoteException;
    public java.lang.Object[] sendname(java.lang.String id) throws java.rmi.RemoteException;
    public java.lang.Object[] sentdogs() throws java.rmi.RemoteException;
    public java.lang.Object[] sentObject(java.lang.String operateCode) throws java.rmi.RemoteException;
    public java.lang.String stringdogs() throws java.rmi.RemoteException;
    public java.lang.String updateStatus(java.lang.String xzfyInfo2Id, java.lang.String receive_real_date, java.lang.String receive_date, java.lang.String isBuzheng, java.lang.String bzTongzhiriqi, java.lang.String bzBuqiriqi, java.lang.String lian_date, java.lang.String tjzfzh, java.lang.String isstop, java.lang.String isstop_from, java.lang.String breakTo, java.lang.String yanqispdate, java.lang.String finish_date, java.lang.String finish_type) throws java.rmi.RemoteException;
}
