import { Bank_backend } from "../../declarations/Bank_backend";

window.addEventListener("load",async function(){

const currentAmount=await Bank_backend.checkBalance();

document.getElementById("value").innerText=Math.round(currentAmount*100)/100;

});

document.querySelector("form").addEventListener("submit",async function(event){
event.preventDefault();
//console.log("Submitted");
const button =event.target.querySelector("#submit-btn");
const inputAmount=parseFloat(document.getElementById("input-amount").value);
const outputAmount=parseFloat(document.getElementById("withdrawal-amount").value);

button.setAttribute("disabled",true);
if(document.getElementById("input-amount").value.length!=0){
await Bank_backend.topUp(inputAmount);
}

if(document.getElementById("withdrawal-amount").value.length!=0){

  await Bank_backend.withdraw(outputAmount);
}
await Bank_backend.compound();
const currentAmount=await Bank_backend.checkBalance();

document.getElementById("value").innerText=Math.round(currentAmount*100)/100;
document.getElementById("input-amount").value="";
document.getElementById("withdrawal-amount").value="";
button.removeAttribute("disabled");

});