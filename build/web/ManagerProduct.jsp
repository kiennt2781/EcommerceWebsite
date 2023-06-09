<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Group 18</title>
         <link rel="icon" type="image/png" href="images/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-3">
                            <h2 style="cursor: pointer"><b>Manage Products</b></h2>
                            
                            
                        </div>
                        <div class="col-sm-3" >
                            <h2><b><a class="fillter" onclick="inventory()" style="text-decoration: none;cursor: pointer;color: #fff">Inventory</a></b></h2>
                        </div>
                        <div class="col-sm-3">
                            <h2><b><a class="fillter" onclick="topseller()" style="text-decoration: none;cursor: pointer;color: #fff">Top seller</a></b></h2>
                        </div>
                        <div class="col-sm-3 action_manage">
                            
                             <div>
                                <a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            </div>
                            <div >
                                <button type="button" class="btn btn-primary"><a class= "btn btn-primary" href="start">Back to home</a></button>
                            </div>
                            <!--<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>-->						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Color</th>
                            <th>Size S</th>
                            <th>Size M</th>
                            <th>Size L</th>
                            <th>Amount</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="product">
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>${o.title}</td>
                                <td>${o.price} $</td>
                                <td><img src="${o.image}"></td>
                                <td>${o.color}</td>
                                <td>${o.size1}</td>
                                <td>${o.size2}</td>
                                <td>${o.size3}</td>
                                <td>${o.amount}</td>
                                <td>
                                    <a href="loadProduct?pid=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="delete?pid=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
<!--                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>-->
<!--            </div>
            <a href="start"><button type="button" class="btn btn-primary">Back to home</button>
            </div><br/>-->
        <!-- Edit Modal HTML -->
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input name="color" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <input name="amount" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Size 1</label>
                                <input name="size1" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Size 2</label>
                                <input name="size2" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Size 3</label>
                                <input name="size3" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <script src="js/manager.js" type="text/javascript"></script>
    <script>
        function inventory(){
            var arr = document.getElementsByClassName('fillter');
            for(var i = 0;i<arr.length ; i++){
                if(arr[i].innerHTML === "Inventory"){
                    arr[i].style.color = "#FFC107";
                }
                else{
                     arr[i].style.color = "#fff";
                }
            }
            $.ajax({
                    url: "/Webbangiay/inventory",
                    type: "get", //send it through get method
                    success: function (data) {
                        //Do Something
                        document.getElementById('product').innerHTML = data;
                        
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
        }
        function topseller(){
            var arr = document.getElementsByClassName('fillter');
            for(var i = 0;i<arr.length ; i++){
                if(arr[i].innerHTML === "Top seller"){
                    arr[i].style.color = "#FFC107";
                }
                else{
                     arr[i].style.color = "#fff";
                }
            }
            $.ajax({
                    url: "/Webbangiay/topseller",
                    type: "get", //send it through get method
                    success: function (data) {
                        //Do Something
                        document.getElementById('product').innerHTML = data;
                        
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
        }
    </script>
</body>
</html>