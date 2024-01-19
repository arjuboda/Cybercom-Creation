
  function successmsg(){
    var name=document.getElementById('name');
    var email=document.getElementById('email');
    if(!name.value=="" && !email.value==""){
        alert("Form submitted successfully");
        window.open("index.html");

    }
    else{
        alert("Please fill all the fieldes")
    }
  }

  function desplayResume(){
    var pdfFile = 'Resume.pdf';
    window.location.href = pdfFile;
  }