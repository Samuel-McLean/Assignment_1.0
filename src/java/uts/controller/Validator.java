package uts.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {
    private String emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}";
    private String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";
    private String passwordPattern = "[a-zA-Z]{8,}[0-9]+";
    private String orderIDPattern = "[0-9]{3}";
    private HashMap<String, String> errors = new HashMap();

    public Validator() {
    }

    public void add(String key, String err) {
        errors.put(key, err);
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean checkEmpty(String email, String name, String password) {
        return password == null || name == null || null == email || name.isEmpty() || email.isEmpty() || password.isEmpty();
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }
    
    public boolean validateOrderID(String orderID){
        return validate(orderIDPattern, orderID);
    }

    public boolean testOption(String type) {
        return type != null;
    }

    public HashMap errors() {
        return errors;
    }

    public void clearLogs() {
        errors.clear();
    }

    public String error(String key) {

        for (Map.Entry<String, String> e : errors.entrySet()) {
            if (e.getKey().equals(key)) {
                return e.getValue();
            }
        }
        return null;
    }

    public boolean test_edit(String name, String password, String email) {
        return name != null && password != null && email != null;
    }
    
    public boolean validateUser(String name, String email, String password){
        return validate(namePattern, name) && validate(emailPattern, email) && validate(passwordPattern, password);
    }
   
}
