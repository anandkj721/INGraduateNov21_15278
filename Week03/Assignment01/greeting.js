function greetingMessage(msg){
    var output=msg;
//     var msgUnknown="";
    switch(output){

        case "New Year":
            console.log("Happy "+output);
            break;

        case "Merry christmas":
               
                console.log("Happy "+output);
                break;
        case "Birthday":
                
                console.log("Happy "+output);
                break;
        case "Anniversary":
               
                console.log("Happy "+output);
                break;

        default  :
                console.log(" Not Found");
                break;
    }

}

module.exports=greetingMessage;