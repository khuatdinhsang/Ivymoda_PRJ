/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const btn_check_login = document.querySelector(".remember_password");
const icon_check_login = document.querySelector(".remember_password i");
btn_check_login.addEventListener("click", () => {
  icon_check_login.classList.toggle("active");
});
