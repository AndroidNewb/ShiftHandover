package shifthandover_app.model;

import java.sql.Date;


import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "shiftactivity")
public class ShiftActivityModel {


	/*@Id
	@Column(name="Date")
	private Date shiftDate;
	@Column(name="Current_Shift")
	private int currentShift;*/

	@EmbeddedId
	private ShiftIdentifier shiftId;


	@Column(name="Next_Shift")
	private int nextShift;
	@Column(name="Completed_Tasks")
	private String completedTasks;
	@Column(name="In_Progress")
	private String inProgressTasks;
	@Column(name="Issues_Encountered")
	private String issues;
	@Column(name="Changes")
	private String changes;
	@Column(name="Handover_By")
	private String handover_By;
	@Column(name="Handover_To")
	private String handover_To;

	@Transient
	private Date shiftDate;
	@Transient
	private String dateString;
	@Transient
	private int currentShift;
	
	public Date getShiftDate() {
		return shiftDate;
	}

	public String getDateString() {
		return dateString;
	}


	public void setDateString(String dateString) {
		this.dateString = dateString;
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


	public ShiftActivityModel()
	{

	}


	public ShiftIdentifier getShiftId() {
		return shiftId;
	}


	public void setShiftId(ShiftIdentifier shiftId) {
		this.shiftId = shiftId;
		this.shiftDate=shiftId.getShiftDate();
		this.currentShift=shiftId.getCurrentShift();
	}


	public int getNextShift() {
		return nextShift;
	}
	public void setNextShift(int nextShift) {

		this.nextShift = nextShift;
	}
	public String getCompletedTasks() {
		return completedTasks;
	}
	public void setCompletedTasks(String completedTasks) {
		this.completedTasks = completedTasks;
	}
	public String getInProgressTasks() {
		return inProgressTasks;
	}
	public void setInProgressTasks(String inProgressTasks) {
		this.inProgressTasks = inProgressTasks;
	}
	public String getIssues() {
		return issues;
	}
	public void setIssues(String issues) {
		/*if(issues==null || issues.isEmpty())
			this.issues = "Nil";
		else*/
			this.issues=issues;
	}
	public String getChanges() {
		return changes;
	}
	public void setChanges(String changes) {
		/*if(issues==null || issues.isEmpty())
			this.changes="Nil";
		else*/
			this.changes = changes;
	}
	public String getHandover_By() {
		return handover_By;
	}
	public void setHandover_By(String handover_By) {
		this.handover_By = handover_By;
	}
	public String getHandover_To() {
		return handover_To;
	}
	public void setHandover_To(String handover_To) {
		this.handover_To = handover_To;
	}

	
	
	@Override
	public String toString()
	{
		return shiftId.toString()+" | "+this.nextShift+" | "+this.completedTasks+" | "+this.inProgressTasks+" | "+this.issues+" | "+this.changes+" | "+this.handover_By+" | "+this.handover_To;
	}


}
