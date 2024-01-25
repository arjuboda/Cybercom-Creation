function calculateBmi(){
    let weight = document.getElementById('numWeight').value;
    let height = document.getElementById('numHeight').value;
    let bmiValueFeild= document.getElementById('bmiResult');
    let bmiStatusFeild = document.getElementById('bmiStatus');
    
    if(weight < 1 || weight > 150){
        alert('Please fill a valid value for Weight ');
    } 
    else if(height<1 || height>272){
        alert('Please fill a valid value for Height');
        // height=' ';
    } 
    else {
        document.getElementsByClassName('resultContainer')[0].style.visibility = 'visible';
        
        let newHeight=height*height;
        let bmiValue=(weight/newHeight).toFixed(2);
        bmiValueFeild.innerHTML='<span> Your BMI Count : '+bmiValue+'</span><br>';
        if(bmiValue<18.5){
            bmiStatusFeild.innerText="Under Weight";
        }
        else if(bmiValue>=18.5 && bmiValue<=24.9)
        {
            bmiStatusFeild.innerText="Normal";
        }
        else if(bmiValue>=25 && bmiValue<=29.9)
        {
            bmiStatusFeild.innerText="Over weight";
        }
        else if(bmiValue>=30 && bmiValue<=24.9)
        {
            bmiStatusFeild.innerText="Obese";
        }
        else{
            bmiStatusFeild.innerText="Extremely Obese";

        }
    }
}