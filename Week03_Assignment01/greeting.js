function greetingMessage(msg){
    var output=msg;
    switch(output){

        case "New Year":
            console.log("Happy "+output);
            break;

        case "christmas":
               
                console.log("Happy "+output);
                break;
        case "Birthday":
                
                console.log("Happy "+output);
                break;
        case "Christmas":
               
                console.log("Happy "+output);
                break;

        default  :
                console.log("Please enter somthing"+output);
                break;
    }

    

}



module.exports=greetingMessage;