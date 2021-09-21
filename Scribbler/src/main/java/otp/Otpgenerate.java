package otp;
import java.util.*;
public class Otpgenerate {
	public String getotp() 
    { 
       
        int randomPin   =(int) (Math.random()*9000)+1000; 
        String otp  = String.valueOf(randomPin); 
        return otp;
        
    } 

}
