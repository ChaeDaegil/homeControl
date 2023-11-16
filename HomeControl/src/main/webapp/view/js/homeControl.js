const [insertBtn,updateBtn,deleteBtn] = document.querySelectorAll('.btn_div>button');
const machines = document.querySelectorAll(".machine_list>.machine_con");
let insertCheck = true;
insertBtn.onclick=() =>{
    if(insertCheck){
        window.open("view/popup/insertPopup.jsp","_blank",",menubar=no,popup=yes,resizable=no,width=400,height=400");
        insertCheck = false;
    }
}
machines.forEach(machine=>{
    machine.ondblclick
});