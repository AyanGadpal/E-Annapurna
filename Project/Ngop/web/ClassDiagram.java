import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;
import java.util.ArrayList;
import java.util.*;

class NGO_data 
{
    private double totalFund = 0;
    private double totalCookedFood = 0;
    private double totalRawFood = 0;

    public double getTotalFund() { return totalFund; }
    public double getTotalCookedFood()  {return totalCookedFood;}
    public double getTotalRawFund() {return totalRawFood;}

    public void incCookedFood(double am)
    {
        this.totalCookedFood += am;
    }
    public void incRawFood(double am)
    {
        this.totalRawFood += am;
    }
    public void incFund(double am)
    {
        this.totalFund += am;
    }

}



// Super class User (Base class of Volunteer, Consumer and Admin)
class User {
    // Name and Email
    private String name, email;

    // Initialize name and email to NULL
    User() {
        name = null;
        email = null;
    }

    // Methods to get Name and Email of user
    public String getName() {
        /* Get Name from user */
        return name;
    }

    public String getEmail() {
        /* Get Email from user */
        return email;
    }

    // Protected methods to set Name and Email provided by user
    protected void setName(String name) {
        /* Set Name of user */
        this.name = name;
    }

    protected void setEmail(String email) {
        /* Set email of user */
        this.email = email;
    }
}



class Consumer extends User {
    // Attributes of Consumer
    private int c_id, quantity;
    private String type_of_shelter, shelter_name, area;
    private boolean food, status;

    Consumer(int c_id, int quantity, String type_of_shelter, String shelter_name, String area, boolean food, boolean status) {
        
        if(isValid(quantity, status)) {
            this.c_id = c_id;
            this.quantity = quantity;
            this.type_of_shelter = type_of_shelter;
            this.shelter_name = shelter_name;
            this.area = area;
            this.food = food;
            this.status = status;
        }
        else {
            // Error
        }
    }

    // Valid quantity of food 
    private boolean isValid(int quantity, boolean status) {
        if(quantity <= 0 || status == false)
            return false;
        return true;
    }

    // Get ConsumerID
    public int getId() {
        return c_id;
    }

 // Get all the details of consumer
    public boolean getStatus() {
        return status;
    }

    // Check whether food is delivered to consumer or not
    public void setStatus() {
        status=true;
    }

    // Get all the details of consumer
    public String getDetails() {
        return null;
    }

    // Check whether food is delivered to consumer or not
    public boolean getDeliveryStatus() {
        return status;
    }

    // Add consumer to database
    private void addConsumer(int c_id, int quantity, String type_of_shelter, String shelter_name, String area, boolean food, boolean status) {
        // Add to database
        // INSERT INTO consumer (quantity, type_of_shelter, shelter_name, area, food, status) values (quantity, 'type_of_shelter', 'shelter_name', 'area', food, status);
    }
}

class Volunteer extends User {
    // Attributes of Consumer
    private int v_id, duration;
    boolean status;
    private String organization, why_to_join, area;
    private Vector<Boolean> working_days;
    private boolean status;

    Volunteer(int v_id, int status, String organization, String why_to_join, String area, int duration, Vector<Boolean> working_days) {
        if(isValid(status, duration, working_days)) {
            this.v_id = v_id;
            this.status = status;
            this.organization = organization;
            this.why_to_join = why_to_join;
            this.area = area;
            this.duration = duration;
            this.working_days = working_days;
        }
        else {
            // Error
        }
    }

    public boolean compareArea(String area)
    {
        return this.area.equals(area);
    }

    // Validate status and duration of volunteer
    private boolean isValid(int status, int duration, Vector<Boolean> working_days) {
        if((status < -1 && status > 1) || ( duration == 0 || duration >= 8 ) || working_days.size() != 7)
            return false;
        return true;
    }

    // Add volunteer to database
    private void addVolunteer(int v_id, int status, String organization, String why_to_join, String area, int duration, Vector<Boolean> working_days) {
        // Add to DB
        // INSERT into volunteers (status, organization, why_to_join, area, duration, working_days) values(status, 'organization', 'why_to_join', 'area', duration, working_days);
    }

    // Get VolunteerID
    public int getId() {
        return v_id;
    }
    
    // Set Status
    public void setStatus()
    {
       status=true;
    }

    
     // Get Status of volunteer
    public boolean getStatus()
    {
        /* Get status of volunteer*/
        return status;
    }
    
    // Reset Status of Volunteer
    private void resetStatus(String status) {
        /* Reset status of Volunteer */
    }

    // Get all the details of volunteer
    public String getDetails() {
        return null;
    }
}

// Used to handle and log the donations
class Donation {
    
    /*  
        name : name of user who 
        Area : Area of donor, usefull in food 
    */
    private String name, Area, panNumber;
    private Boolean type;
    private int amount;
    private Timestamp generate;
    private String UPI;
    Donation(String name,String area)
    {
        // Registering the time of donation
        Date date = new Date();
        long time = date.getTime();
        this.generate  = new Timestamp(time);
        this.panNumber = "0";
    }

    Donation(String name,String Area,String panNumber,int amount,Boolean type,String UPI)
    {
        //validating pan number
        if (validaded(panNumber))
        {
            Date date = new Date();
            long time = date.getTime();
            this.generate  = new Timestamp(time);
            
            this.name = name;
            this.Area = Area;
            this.panNumber = panNumber;
            this.amount = amount;
            this.type = type;
            this.UPI = UPI;
        }
        else
        {
            // Error
        }
        
    }
    
    private Boolean validaded(String panNumber){return true;}
    private Boolean PaymentAPI() {
        // Return Hardcoded for now
        return true;
    }
    //Method for donating fund
    public void DonateFund() {
        if (this.panNumber.length() != 10)
        {
            // panNumber = requestPan();
            this.panNumber = "ALWPG5809L";
        }
        if(validaded(this.panNumber))
        {
            // Request from UI, Hardcoded for now
            this.amount = 10;
            this.UPI = UPI;
            if (PaymentAPI())
            {
                // Increment NGO data fund amount
                // global_Ngo_data.incFund(amount);
            }
        }       

     
    }

    //Method for donating food
    public void DonateFood(int amount, Boolean type) {
        this.amount = amount;
        // Increment NGO data fund amount
        // if (type)
        //     // global_Ngo_data.incCookedFood(amount);
        // else 
        //     // global_Ngo_data.incRawFood(amount);

    }

}

class Report {
    protected Boolean type;
    private Timestamp generate;
    protected Date start_date, end_date;

    Report()
    {
        // Registering the time of Report generation
        Date date = new Date();
        long time = date.getTime();
        this.generate  = new Timestamp(time);
    }

    // Setter Methods
    public void setReportType(Boolean type) {
        this.type = type;
    }

    // Setter Method used for defining the start date and end date of the report
    public void setDuration(Date start_date, Date end_date) {
        this.start_date = start_date;
        this.end_date = end_date;
    }
}

class Volunteer_Report extends Report{
    private Vector<Volunteer> Volunteer_list;

    Volunteer_Report(Vector<Volunteer> Volunteer_list)
    {
        this.Volunteer_list = Volunteer_list;
        if (this.Volunteer_list.size() == 1)
            SingleQuries();
        else
            groupQuries();
    }
    //method for fetching data as per report type
    public void SingleQuries() {/*
        Queries for fetching Single data
    */};
    public void groupQuries() {/*
        Queries for fetching Grouped data
    */};
    
}

class Donation_Report extends Report{
    private Vector<Donation> donations ;
    Donation_Report(Vector<Donation> donations)
    {
        this.donations = donations ;
        if(this.donations.size() == 1)
            SingleQuries();
        else 
            groupQuries();
    }
    //method for fetching data as per report type
    public void SingleQuries() {/*
        Queries for fetching Single data
    */};
    public void groupQuries() {/*
        Queries for fetching Grouped data
    */};
}

class Consumer_Report extends Report{
    private Vector<Consumer> consumer_list ;
        Consumer_Report(Vector<Consumer> Consumer_list)
    {
        this.Consumer_list = Consumer_list;
        if (this.Consumer_list.size() == 1)
            SingleQuries();
        else
            groupQuries();
    }

    //method for fetching data as per report type
    public void SingleQuries() {/*
        Queries for fetching Single data
    */};
    public void groupQuries() {/*
        Queries for fetching Grouped data
    */};
}

class Admin extends User {
    private String password;

    /* Set Password */
    private void setPassword(String password) {
        this.password=password;
        // Return Nothing
    }

    /* Checks Password*/
    private boolean checkPassword(String passwd) {
        if(password.equals(passwd))
            return true;
        else
            return false;
    }

    /* Forget Password for ADMIN */
    public String forgetPassword(String passed) {
        
        return null;
    }

    /* Mapping of Volunteer and Consumer */
    public String mapping() {
        return null;
    }

    /* Get the report of Volunteer*/
    public void VolunteerReport() {
        

    }
    /* Get the report of Consumer  */
    public void ConsumerReport() {
        

    }

    public void DonationReport() {
        

    }
}

class Mapping{
   
    Vector<Volunteer> volGrp;
    Consumer consumer;
    Date transactionDate;

    public void getConsumer(Consumer c)
    {
        consumer=c;
        consumer.setStatus();
    }

    // Assume the Volunteer from DB
    public void getVolunteerGroup(Vector<Volunteer> v,String area){
        /*Get volunteers by group*/
        this.volGrp = new Vector<Volunteer>();
        // Iterator<Volunteer> value = v.iterator(); 
        for(int index = 0; index < v.size(); index++) {
            // Policy
            if(v.get(index).compareArea(area))
            {
                // put the volunteers which satisfy the policy 
                // into volunteer group
                v.get(index).setStatus();
                this.volGrp.add(v.get(index));
            }
        }
           
    }
    
}

public class main {
    NGO_data global_Ngo_data;
    public static void main(String[] args) {
/* Get the report of Volunteer / Consumer / Donoe */
    }
}