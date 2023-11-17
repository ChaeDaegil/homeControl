const mail_rows = document.querySelectorAll('tbody>tr');
const writeBtn = document.querySelector('.writer_div>button');
const searchBtn = document.querySelector('.search_btn');
const searchText = document.querySelector('.search_text');
const searchSelect = document.querySelector('select');
searchBtn.onclick=()=>{
    location.href = "/view/homeControl_mailbox.jsp?sel="+searchSelect.selectedOptions[0].value+"&search="+searchText.value;
}
writeBtn.onclick = () =>{
    location.href = "/view/write_mail.jsp";
};
mail_rows.forEach(mail=>{
    mail.onclick = (event)=>{
        location.href = "/view/homeControl_mail.jsp?mail_id="+event.currentTarget.querySelector('td').innerText;
    }
});