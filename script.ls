const form = document.getElementById('form');
const username = document.getElementById('username');
const phone = document.getElementById('phone')
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');

form.addEventListener('submit', e => {
    e.preventDefault();

    validateInputs();
});

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success')
}

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

const isValidEmail = email => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

const validateInputs = () => {
    const usernameValue = username.value.trim();
    const phoneValue = phone.value.trim();
    const emailValue = email.value.trim();
    const passwordValue = password.value.trim();
    const password2Value = password2.value.trim();

    if(usernameValue === '') {
        setError(username, 'Username is required');
    } 
    else if(usernameValue.length<5){
        setError(username,'Username should not be less than 5 characters')
    }
    else {
        setSuccess(username);
    }
    if (phoneValue === '') {
        setError(phone, 'Phone number is required');
    } else if (phoneValue.length <10 ||  phoneValue.length > 10) {
        setError(phone, 'Phone number must be a 10-digit number');
    } else if (phoneValue === '123456789') {
        setError(phone, 'Phone number cannot be 123456789');
    }
    else if (!/^\d+$/.test(phoneValue)) {
        setError(phone, 'Phone number must contain only digits');
    } else {
        setSuccess(phone);
    }
    if(emailValue === '') {
        setError(email, 'Email is required');
    } else if (!isValidEmail(emailValue)) {
        setError(email, 'Provide a valid email address');
    } else {
        setSuccess(email);
    }

    if(passwordValue === '') {
        setError(password, 'Password is required');
    }else if (
        !/[a-z]/.test(passwordValue) ||         // Check for lowercase letters
        !/[A-Z]/.test(passwordValue) ||         // Check for uppercase letters
        !/[0-9]/.test(passwordValue) ||         // Check for numbers
        !/[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/.test(passwordValue)  // Check for special characters
    ) {
        setError(password, 'Password must be strong');
    }
     else if (passwordValue.length < 8 ) {
        setError(password, 'Password must be at least 8 character.')
    } else if(passwordValue == 'password'){
        setError(password,'Password is not Strong')
    }
    else if(passwordValue == usernameValue){
        setError(password,'password and username should not be same')
    }
    else {
        setSuccess(password);
    }

    if(password2Value === '') {
        setError(password2, 'Please confirm your password');
    } else if (password2Value !== passwordValue) {
        setError(password2, "Passwords doesn't match");
    } else {
        setSuccess(password2);
    }

};
