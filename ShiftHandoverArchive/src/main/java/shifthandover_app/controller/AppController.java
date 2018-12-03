package shifthandover_app.controller;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import shifthandover_app.model.ShiftActivityModel;
import shifthandover_app.model.ShiftIdentifier;
import shifthandover_app.model.User;
import shifthandover_app.repository.ShiftRepository;
import shifthandover_app.repository.UserRepository;

@RestController
public class AppController {

	private List<String> teammates= new ArrayList<String>();
	private String loggedInUser; 
	private String loggedInUserName;
	private String loggedInUserRole;

	@Autowired
	ShiftRepository shiftRespository;

	@Autowired
	UserRepository userRepository;

	@PostConstruct
	public void getLoggedInUser()
	{
		loggedInUser=System.getProperty("user.name");
		System.out.println();
		/*User user= userRepository.getUserByracfID(loggedInUser);
		loggedInUserRole=user.getRole();
		loggedInUserName=user.getUserName();
		System.out.println("Logged-in user >> "+user.toString());*/

	}



	@GetMapping(value="/addEntry")
	public ModelAndView addEntry(HttpSession session)
	{
		System.out.println("Reached get ");
		ModelAndView addEntryView = new ModelAndView();
		addEntryView.setViewName("AddEntry");
		//-------------------
		/*java.sql.Date  fromDate=formatSqlDate("06/11/2018");
		java.sql.Date  toDate=formatSqlDate("07/11/2018");

		List<ShiftActivityModel> activities=shiftRespository.getShiftActivitiesBetweenDates(fromDate, toDate);
		System.out.println(activities.size());
		System.out.println("------- SEARCH");
		Iterator<ShiftActivityModel> activityIt= activities.iterator();
		while(activityIt.hasNext())
		{
			System.out.println(activityIt.next().toString());
		}*/

		//-------------------


		//---------------
		session.setAttribute("user", loggedInUser);
		session.setAttribute("username", "'"+loggedInUserName+"'");
		session.setAttribute("role", loggedInUserRole);
		System.out.println("Running User ---> "+loggedInUser+" ROLE> "+loggedInUserRole);
		return addEntryView;
	}




	@PostMapping(value="/api/searchresults")
	public ModelAndView searchEntries(HttpServletRequest request,HttpSession session)
	{
		java.sql.Date shiftDate=formatSqlDate(request.getParameter("shiftDate"));
		int shift=Integer.parseInt(request.getParameter("shift"));

		ShiftIdentifier identifier= new ShiftIdentifier();
		identifier.setShiftDate(shiftDate);
		identifier.setCurrentShift(shift);

		ShiftActivityModel model= shiftRespository.getShiftActivityByshiftId(identifier);
		System.out.println(model.toString());


		ModelAndView resultsView= new ModelAndView("results");
		return resultsView;
	}



	@ExceptionHandler
	public void handle(Exception e) {
		e.printStackTrace();
	}

	public java.sql.Date formatSqlDate(String dateString)
	{
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate shiftDate=LocalDate.parse(dateString,formatter);
		System.out.println("Local Date --> "+shiftDate);
		java.sql.Date sqlDate=java.sql.Date.valueOf(shiftDate);
		return sqlDate;
	}

	public java.sql.Date formatDate(java.sql.Date inputDate)
	{


		DateTimeFormatter ISOformatter = DateTimeFormatter.ofPattern("YYYY-mm-dd");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		//LocalDate ISOshiftDate=LocalDate.parse(inputDate.toString(), ISOformatter);
		LocalDate ISOshiftDate=inputDate.toLocalDate();
		String[] ISOdate=inputDate.toString().split("-");
		String dateStr=ISOdate[2]+"/"+ISOdate[1]+"/"+ISOdate[0];
		System.out.println(dateStr);
		return formatSqlDate(dateStr);
	}

	public String dateToString(java.sql.Date inputDate)
	{
		LocalDate ISOshiftDate=inputDate.toLocalDate();
		String[] ISOdate=inputDate.toString().split("-");
		String dateStr=ISOdate[2]+"/"+ISOdate[1]+"/"+ISOdate[0];
		return dateStr;
	}

	//
	@PostMapping(value="/api/saveEntry",consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public void insertActivity(HttpServletRequest request)
	{
		System.out.println("MAP POST ");		
		String formData=request.getParameter("shiftDate")+" | "+request.getParameter("currentShift")+" | "+request.getParameter("nextShift")+" | "+request.getParameter("completedTasks")+" | "+request.getParameter("inProgressTasks")+" | "+request.getParameter("issues")+" | "+request.getParameter("handover_By")+" | "+request.getParameter("handover_To");
		System.out.println(formData);	



		java.sql.Date sqlDate=formatSqlDate(request.getParameter("shiftDate"));
		System.out.println("SQL DaTe -- "+sqlDate);


		//Populating data into Model
		ShiftActivityModel model= new ShiftActivityModel();


		ShiftIdentifier shiftID= new ShiftIdentifier();
		shiftID.setShiftDate(sqlDate);
		shiftID.setCurrentShift(Integer.parseInt(request.getParameter("currentShift")));
		model.setShiftId(shiftID);
		model.setNextShift(Integer.parseInt(request.getParameter("nextShift")));
		model.setCompletedTasks(request.getParameter("completedTasks"));
		model.setInProgressTasks(request.getParameter("inProgressTasks"));
		model.setIssues(request.getParameter("issues"));
		model.setChanges(request.getParameter("changes"));
		model.setHandover_By(request.getParameter("handover_By"));
		model.setHandover_To(request.getParameter("handover_To"));
		System.out.println("Model data populated ... "+model.toString());
		shiftRespository.save(model);


	}


	@GetMapping("/getRecords")
	public ModelAndView getRecordsByDate(HttpServletRequest request)
	{
		ModelAndView model= new ModelAndView("results");

		List<ShiftActivityModel> entryList=shiftRespository.getShiftActivitiesForDay(formatSqlDate("01/11/2018"));
		//ShiftActivityModel entry=shiftRespository.getShiftActivityByshiftId(new ShiftIdentifier(formatSqlDate("01/11/2018"),1));
		List<ShiftActivityModel> entryListMod= new ArrayList<ShiftActivityModel>();
		for (ShiftActivityModel entry :entryList)
		{
			entry.setShiftDate(entry.getShiftId().getShiftDate());
			entry.setCurrentShift(entry.getShiftId().getCurrentShift());
			entry.setDateString(dateToString(entry.getShiftDate()));
			entryListMod.add(entry);
		}
		model.addObject("list", entryListMod);

		return model;
	}


	@GetMapping(value="/testForm")
	public ModelAndView testEntry()
	{
		System.out.println("Reached test ");
		ModelAndView addEntryView = new ModelAndView();
		addEntryView.setViewName("testForm");
		return addEntryView;
	}

	@PostMapping(value="/api/test",consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public void test( HttpServletRequest request)
	{
		System.out.println("TEST "+request.getParameter("genderOptions"));

		System.out.println("TEST "+request.getParameter("currentShift"));

	}
}
