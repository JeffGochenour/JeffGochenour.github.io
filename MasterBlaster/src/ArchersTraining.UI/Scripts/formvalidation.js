function validateForm() {
    //Access user input, no id for input
    var name = document.forms["main-contact-form"]["name"].value;
    var email = document.forms["main-contact-form"]["email"].value;
    var message = document.forms["main-contact-form"]["message"].value;

    //Access output spans(for error messages)
    var nameVal = document.getElementById("nameVal");
    var emailVal = document.getElementById("emailVal");
    var messageVal = document.getElementById("messageVal");

    //Declare a regular expression for email addresses
    //from http://regexlib.com/Search.aspx?k=email&c=-1&m=5&ps=20 //RobertCrog
    var emailRegExp = new RegExp(/^[A-Z0-9._-]+@[A-Z0-9.-]+\.[A-Z0-9.-]+$/i);

    //mini lab create a new regex to check for letters only in name
    var nameRegExp = new RegExp(/^[a-zA-Z][a-zA-Z ]+[a-zA-Z]+$/);
    //https://stackoverflow.com/questions/9289451/regular-expression-for-alphabets-with-spaces




    //Test conditions and output errors if needed
    if (name.length == 0 || email.length == 0 || message.length == 0
        || !emailRegExp.test(email) || !nameRegExp.test(name)) {//will return true so need negative validation
        if (name.length == 0) {
            nameVal.textContent = "*Name is required*";
        }
        else {
            nameVal.textContent = "";
        }
        if (email.length == 0) {
            emailVal.textContent = "*Email is required*";
        }
        else {
            emailVal.textContent = "";
        }
        if (message.length == 0) {
            messageVal.textContent = "*Message is required*";
        }
        else {
            messageVal.textContent = "";
        }
        //Error mesage if email is not vaild
        if (!nameRegExp.test(name) && name.length > 0) {
            nameVal.textContent = "*Must be a valid name*"
        }
        if (nameRegExp.test(name) && name.length > 0) {
            nameVal.textContent = "";
        }
        if (!emailRegExp.test(email) && email.length > 0) {
            emailVal.textContent = "*Must be a valid email*";
        }
        if (emailRegExp.test(email) && email.length > 0) {
            emailVal.textContent = "";
        }


        //stops default action from happening, keeps the form from trying to send 
        //information to the action
        event.preventDefault();
    }

}