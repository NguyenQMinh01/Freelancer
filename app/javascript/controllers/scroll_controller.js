import { Controller } from '@hotwired/stimulus';

export default class extends Controller{
     connect(){
        console.log("Connected")
        const messages = document.getElementById("message_list"); 
        messages.addEventListener("DOMNodeInserted", this.resetScroll);
        this.resetScroll(messages);
    }

     disconnect(){
        console.log("DisConnected")
     }

     resetScroll(){
        messages.scrollTop = messages.scrollHeight - messages.clientHeight;
     }
}