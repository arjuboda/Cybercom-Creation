$("#flightRegistrationFrm").validate({
    rules:{
        txtFrom:{
            required:true,
            minlength:2
        },
        txtTo:{
            required:true,
            minlength:2
        },
        txtPreferedAirline:{
            required:true,
            minlength:2
        },
        txtPreferedSeat:{
            required:true
        },
        dtPreferedDate:{
            required:true
        },
        tmPreferedTime
        :{
            required:true
        },
        txtfistName:{
            required:true,
            minlength:2
        },
        txtlastName:{
            required:true,
            minlength:2
        },
        numContactNo:{
            required:true,
            minlength:10
        },
        numSecondContactNo:{
            required:true,
            minlength:10
        },
        emlPrimaryEmail: {
            required: true,
            email:true
        },
        emlSecondEmail: {
            required: true,
            email:true
        }  
    },
    messages:{
        txtFrom:{
            required:"please enter place from where you take off",
            minlength:"minmum two character reqiered"
        }
    },

    submitHandler: function(form) {
      form.submit();
    }
   });
