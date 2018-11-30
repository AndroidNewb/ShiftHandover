package shifthandover_app.repository;




import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import shifthandover_app.model.ShiftActivityModel;
import shifthandover_app.model.ShiftIdentifier;


public interface ShiftRepository extends JpaRepository<ShiftActivityModel, ShiftIdentifier>{
	
	
	public ShiftActivityModel getShiftActivityByshiftId(ShiftIdentifier shiftID);
	
	@Query(value="SELECT * FROM shifthandover.shiftactivity where Date between ?1 AND ?2",nativeQuery=true)
	public List<ShiftActivityModel> getShiftActivitiesBetweenDates(Date fromDate, Date tillDate);
	
	/*@Query(value="SELECT In_Progress FROM shifthandover.shiftactivity",nativeQuery=true)
	public List<Date,String> getAllPendingTasks()*/;
	
	@Query(value="SELECT * FROM shifthandover.shiftactivity where Date = ?1",nativeQuery=true)
	public List<ShiftActivityModel> getShiftActivitiesForDay(Date Date);
	
}
