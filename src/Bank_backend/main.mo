import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Time "mo:base/Time";
actor Dbank{

stable var currentValue: Float=300;//orthogonal persistance
//currentValue:=300; 
let id=23656786746758; //its value will not change

stable var startTime=Time.now();
startTime:=Time.now();
 //Debug.print(debug_show(startTime));
// Debug.print("Hello");
// Debug.print(debug_show(id));

public func topUp(amount:Float){ //Nat is natural no. data type

currentValue+=amount;
Debug.print(debug_show(currentValue));
};
public func withdraw(amount:Float){ //Nat is natural no. data type
let temp:Float=currentValue-amount;
if(temp>=0){
currentValue-=amount;
Debug.print(debug_show(currentValue));

}
else{
Debug.print("Amount entered exceeds amount present");

}
};

public query func checkBalance():async Float{ // This query function just return the value 


return currentValue;                        //thats why dis not take much time 
                                            // but the update functions actually implement blockchain 
                                             //method to update thats why that function takes more t

};

public func compound(){

let currentTime=Time.now();
let timeElapsedNS=currentTime-startTime;
let timeElapsedS=timeElapsedNS/1000000000;
currentValue:=currentValue*(1.01 ** Float.fromInt(timeElapsedS));
startTime:=currentTime;
}

}
