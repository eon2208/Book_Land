# Book_Land
Book_Land is the 3-Tier web application with access to over 9000+ books wth all online-store functions.


## Tech stack:

### Backend:
+ Spring Web MVC
+ Spring Security
+ Hibernate
+ Spring Security
+ MySQL Database
+ Java mail Sender


### Frontend: 
+ JSP
+ Bootstrap


## Detailed app description

The app offers two roles of the users: normal user and admin. As app was initially created as online store, creating account is possible for new user and account which have "ADMIN" priviledges. Every user need to log in to grant access to place an order:

<p align="center">
  <img src="https://github.com/eon2208/Book_Land/blob/master/images/1-login.jpg">
</p>

Registration form with Hibernate custom Validatior: 

<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/2-register.jpg">
</p>

### User role app functionality
Logged user is able to add book to the cart, edit user details and list orders history

<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/4-mainPage.jpg">
</p>

<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/5-BookInfo.jpg">
</p>

<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/6-cart.jpg">
</p>

<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/7-order%20Detail.jpg">
</p>

After placing an order logged user is allowed to list orders made from this account and list details about placed order
<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/8-orderStatus.jpg">
</p>
<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/9-orderInfo.jpg">
</p>

### Admin role app functionality
Admin app functionality is more extended than user. First of all, admin has rights to perform the CRUD operations on users list (of course CRUD operations of his own profile is not allowed- he has to use edit profile as normal user instead:
<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/10-admin%20CRUD.jpg">
</p>


Admin can all user orders, edit status, list all deatils. As orders and users are stored in DB using 1:N relationship, deleting particular user indicates that all of his orders become automatically deleted.
<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/11-admin%20orderStatus%20Change.jpg">
</p>

DataBase: 
<p align="center">
<img src="https://github.com/eon2208/Book_Land/blob/master/images/database.PNG">
</p>
