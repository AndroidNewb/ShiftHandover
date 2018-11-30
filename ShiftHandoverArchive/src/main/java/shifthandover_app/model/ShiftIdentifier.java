package shifthandover_app.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ShiftIdentifier implements Serializable{

	@Column(name="Date")
	private Date shiftDate;
	@Column(name="Current_Shift")
	private int currentShift;


	public Date getShiftDate() {
		return shiftDate;
	}
	public void setShiftDate(Date shiftDate) {
		this.shiftDate = shiftDate;
	}
	public int getCurrentShift() {
		return currentShift;
	}
	public void setCurrentShift(int currentShift) {
		this.currentShift = currentShift;
	}

	@Override
	public String toString()
	{
		return getShiftDate()+" | "+getCurrentShift();
	}
	
	@Override
	public boolean equals(Object object) {

		if (this==object)
			return true;
		else if (object instanceof ShiftIdentifier)
		{
			ShiftIdentifier shiftID= (ShiftIdentifier) object;
			return (shiftID.getShiftDate().equals(getShiftDate()) && shiftID.getCurrentShift()==getCurrentShift());
		}
		else
			return false;

	}
	
	

}
