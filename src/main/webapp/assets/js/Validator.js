// Function to validate
function Validator(options) {
    const myFormElement = document.querySelector(options.form);
    const messageSelector = options.message;
    const invalidClass = options.invalid;

    // Get all selector to check many rule in 1 element
    let selectorRules = {};

    // Show message when blur and return message
    function showMessage(inputElement, rule) {


        let inputValue = inputElement.value;


        let parentInputElement = inputElement.parentElement;
        let messageElement = parentInputElement.querySelector(messageSelector);

        let message;
        for (let i = 0; i < selectorRules[rule.selector].length; ++i) {
            message = selectorRules[rule.selector][i].test(inputValue);
            if (message)
                break;
        }

        if (message) {
            parentInputElement.classList.add(invalidClass);
            messageElement.innerText = message;
        } else {
            parentInputElement.classList.remove(invalidClass);
            messageElement.innerText = "";
        }
        return !!message;
    }

    // Clear message when input
    function clearMessage(inputElement) {
        let parentInputElement = inputElement.parentElement;
        let messageElement = parentInputElement.querySelector(messageSelector);

        parentInputElement.classList.remove(invalidClass);
        messageElement.innerText = "";
    }

    if (myFormElement) {
        //Check submit
        myFormElement.onsubmit = (e) => {
            e.preventDefault();
            let validForm = true;
            options.rules.forEach((rule) => {
                let inputElement = myFormElement.querySelector(rule.selector);
                if (showMessage(inputElement, rule))
                    validForm = false;
            });
            if (validForm) {
                HTMLFormElement.prototype.submit.call(myFormElement);
//                myFormElement.submit();
            }
        };

        // Loop each rule to check event
        options.rules.forEach((rule) => {
            // Get all rules into selectorRules
            if (selectorRules[rule.selector]) {
                selectorRules[rule.selector].push(rule);
            } else {
                selectorRules[rule.selector] = [rule];
            }

            let inputElement = myFormElement.querySelector(rule.selector);
            if (inputElement) {
                if (inputElement.type != "file") {
                    // Check on blur
                    inputElement.onblur = () => {
                        showMessage(inputElement, rule);
                    };
                } else {
                    inputElement.onchange = () => {
                        showMessage(inputElement, rule);
                    };
                }

                // Check on input
                inputElement.oninput = () => {
                    clearMessage(inputElement);
                };
            }
        });
    }
}

// Rules function
Validator.isRequire = (selector, invalidMessgae) => {
    return {
        selector: selector,
        test: function (value) {
            return value.trim().length == 0 ? invalidMessgae : undefined;
        }
    };
};

Validator.isLimit = (selector, maxValue, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
            return value.trim().length > maxValue ? invalidMessage : undefined;
        }
    };
};

Validator.isInteger = (selector, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
//            const email =  /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/; //email
//            const regex = /^.{1,7}$/; // 7 character
            const regex = /^[0-9]+$/; // dif negative
//            const regex = /^[0-9]*[02468]$/; // even

            return !regex.test(value.trim()) ? invalidMessage : undefined;
        }
    };
};

Validator.isPositive = (selector, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
            const regex1 = /^[0]+$/;
            const regex2 = /^[0-9]+$/;
            return (regex1.test(value.trim()) || !regex2.test(value.trim())) ? invalidMessage : undefined;
        }
    };
};

Validator.isPositiveFloat = (selector, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
            return /^(\d*\.)?\d+$/.test(value) && parseFloat(value) >= 0 ? undefined : invalidMessage;
        }
    };
};
Validator.isEmail = (selector, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
            return /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(value)? undefined : invalidMessage;
        }
    };
};

Validator.isPassword = (selector, invalidMessgae) => {
    return {
        selector: selector,
        test: function (value) {
            return value.trim().length < 6 ? invalidMessgae : undefined;
        }
    };
};


Validator.isConfirmPassword = (selector,selectorConfirm, invalidMessgae) => {
    return {
        selector: selector,
        test: function (value) {
            return document.querySelector(selectorConfirm).value.trim() !== value.trim() ? invalidMessgae : undefined;
        }
    };
};

Validator.isImage = (selector, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
            if (value) {
                let endFile = value.split(".")[value.split(".").length - 1];
                let isImg = false
                if (endFile == "jpeg" || endFile == "jpg" || endFile == "png" || endFile == "gif" || endFile == "webp") {
                    isImg = true;
                } else {
                    isImg = false;
                }
                return !isImg ? invalidMessage : undefined;
            } else {
                return undefined;
            }
        }
    };
}
Validator.isPhone = (selector, invalidMessage) => {
    return {
        selector: selector,
        test: function (value) {
            return /(84|0[3|5|7|8|9])+([0-9]{8})\b/g.test(value)? undefined : invalidMessage;
        }
    };
};


