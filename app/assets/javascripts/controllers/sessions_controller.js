$(document).ready(function() {

    $('#login-form').submit(function(e) {
        e.preventDefault();
        formData = $(e.currentTarget).serialize();
        attemptTokenVerification(formData);
    })

    $('#phone_call_token_form').submit(function(e) {
        e.preventDefault();
        formData = $(e.currentTarget).serialize();
        attemptSendTokenViaPhone(formData);
    })

    $('#sms_token_form').submit(function(e) {
        e.preventDefault();
        formData = $(e.currentTarget).serialize();
        attemptSendTokenViaSms(formData);
    })

    var attemptTokenVerification = function(form) {
        $.post( "/session", form, function(data) {
            if (data.success) {
                $('#authy-modal').modal({backdrop:'static'},'show')
                 $('.auth-token').fadeIn()
            } else {
                window.location.href = "/sign_in";
            }
        })
    };

    var attemptSendTokenViaSms = function(form) {
        $.post( "/authy/send_token", form, function(data) {
            if (data.success) {
                $('#sending-sms').show()
                setTimeout(function(){ $('#sending-sms').hide() }, 3000);

            }
        })
    };

    var attemptSendTokenViaPhone = function(form) {
        $.post( "/authy/send_token_phone_call", form, function(data) {
            if (data.success) {
                $('#sending-phone').show()
                setTimeout(function(){ $('#sending-phone').hide() }, 3000);

            }
        })
    };
})

