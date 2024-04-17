<%@ page import="dao.*, daoimpl.*, model.*,java.util.List,org.springframework.context.ApplicationContext, org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Welcome to University CRUD</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
  width: 95%;
}


#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('https://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('https://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #555;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: left;
}
.fa-pen-to-square{
  color: #40A2D8;
  margin-right:5px;
}
.fa-trash{
  color: red;
}
.insert_stubtn{
  text-decoration: none;
  color: white;
  background: #40A2D8;
  padding:15px 25px;
  border-radius: 5px;
  font-size:12px;
  font-weight: bold;
}
.addstubtn_container{
  text-align:right;
  margin:25px auto!important;
  margin-right:20px!important;
}
.back_btn{
  text-decoration: none;
  color: white;
  background: #DF3535;
  padding: 15px 25px;
  border-radius: 5px;
  font-size: 12px;
  font-weight: bold;
}

</style>

</head>
<body>
 <div id="wrapper">
  <h1>Department Operations</h1>
  <div class="addstubtn_container backbtn_container">
    <a href="adddepartment.jsp" class="insert_stubtn">Add Department</a>
    <a href="index.jsp" class="back_btn">Back</a>
  </div>
  
  <table id="keywords" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th><span>Id</span></th>
        <th><span>Department Name</span></th>
        <th><span>Department Code</span></th>
        <th><span>Actions</span></th>
      </tr>
    </thead>
    <tbody>
      
      <%
      ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
      DepartmentDao departmentDao = (DepartmentDao) context.getBean("departmentDao");
      List<Department> departmentlist = departmentDao.findAll();
      for(Department d : departmentlist){ %>
      
      <tr>
        <td><%= d.getId() %></td>
        <td><%= d.getName() %></td>
        <td><%= d.getCode() %></td>
        <td>
        <a href="updatedepartment.jsp?update_id=<%= d.getId() %>"><i class="fa-solid fa-pen-to-square"></i></a>
        <a href="deletedepartment?delete_id=<%= d.getId() %>"><i class="fa-solid fa-trash"></i></a>
        </td>
      </tr>
      
      <% } %>
      
    </tbody>
  </table>
 </div> 
 <script>
 $(function(){
	  $('#keywords').tablesorter(); 
 });
 </script>
</body>
</html>
