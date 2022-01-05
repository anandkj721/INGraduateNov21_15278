const ps=require('prompt-sync');
const prompt=ps();
const greetingMessage=require('./greeting');

function main(){

    // var a=["new year", "Merry Chrismas", "Birthday", "Anniversary"];
    //greetingMessage("New Year");
   // greetingMessage("Merry christmas");
    //greetingMessage("Birthday");

    // var a="New Year";
    // var b="Merry christmas";
    // var c="Birthday";
    // var d="Anniversary";
     //greetingMessage(d)

    let x = prompt("enetr choice :");

    //console.log(msg);

    greetingMessage(x);
}
main();
