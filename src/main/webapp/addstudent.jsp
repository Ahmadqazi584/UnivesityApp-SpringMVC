<%@ page import="dao.*, daoimpl.*, model.*,java.util.List,org.springframework.context.ApplicationContext, org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Welcome to University CRUD</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Amarante');

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { overflow-y: scroll; }
body { 
  background: #eee url('https://i.imgur.com/eeQeRmk.png'); /* https://subtlepatterns.com/weave/ */
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 62.5%;
  line-height: 1;
  color: #585858;
  padding: 22px 10px;
  padding-bottom: 55px;
}

::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 3.6em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}


/** page structure **/
#wrapper {
  display: block;
  width: 850px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}
form {
  width: 95%;
  display: block;
  margin:0px auto 20px;
}
.form-label {
  margin-bottom: .5rem;
  font-size: 16px;
  margin-top: 10px;
}
.departmentlist_container{
  margin-bottom:12px!important;
}
#exampleFormControlInput1::placeholder {
  color: #cccaca!important;
}
.selected_item {
  color: #cccaca!important;
}
.submit_btn{margin:25px 0px!important;text-align:center;}

.back_btn,.submit_btn>input{
  text-decoration: none;
  color: white;
  background: #40A2D8;
  padding:15px 25px;
  border-radius: 5px;
  font-size:12px;
  font-weight: bold;
}
.submit_btn>input:hover{
  background: #4291BD;
  color: white;
}
.backbtn_container{
  text-align:right;
  margin:25px auto!important;
  margin-right:20px!important;
}
</style>

</head>
<body>
 <div id="wrapper">
  <h1>Insert your Student</h1>
  <div class="backbtn_container">
    <a href="students.jsp" class="back_btn">Back</a>
  </div>
  <form action="addstudent" method="post">
    <div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Name</label>
	  <input type="text" class="form-control" name="name" id="exampleFormControlInput1" placeholder="enter your name">
	</div>
	<div class="departmentlist_container">
	  <label for="exampleFormControlInput1" class="form-label">Email</label>
	  <select name="department" class="form-select" aria-label="Default select example">
		  <option selected class="selected_item">select your department</option>
		  <% ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
	      DepartmentDao departmentDao = (DepartmentDao) context.getBean("departmentDao");
	      List<Department> departmentlist = departmentDao.findAll();
	      for(Department d : departmentlist){ %>
	      
	      	 <option value="<%= d.getId() %>"><%= d.getName() %></option>
	      		  
		  <% } %>
	  </select>
	</div>
    <div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Email</label>
	  <input type="email" class="form-control" name="email" id="exampleFormControlInput1" placeholder="enter your email">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Phone</label>
	  <input type="number" class="form-control" name="phone" id="exampleFormControlInput1" placeholder="enter your phone number">
	</div>
	<div class="submit_btn">
	  <input type="submit" value="Add Student" style="border:none;">
	</div>
  </form>
 </div> 
 <script>
 $(function(){
	  $('#keywords').tablesorter(); 
 });
 </script>
</body>
</html>
