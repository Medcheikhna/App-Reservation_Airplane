<%--
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 1/15/2024
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="assets/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <link rel="stylesheet" href="assets/style.css" />
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container mt-4 d-flex justify-content-center main">
    <div class="card">
        <div class="d-flex justify-content-between px-3 pt-4">
            <span class="pay">Pay amount</span>
            <div class="amount">
                <div class="inner">
<%--                    <span class="dollar">Rs.</span> <span class="total"><%=totalTicketPrice%></span>--%>
                </div>
            </div>
        </div>
        <form action="PaymentServlet" method="post">
            <div class="px-3 pt-3">
                <label for="cardNumber" class="d-flex justify-content-between">
                    <span class="labeltxt">CARD NUMBER</span> <img
                        src="images/master.png" width="25" class="image">
                </label> <input type="number" name="cardNumber"  id="cardNumber" required="required"
                     class="form-control inputtxt" placeholder="8881 2545 2545 2245">
            </div>


        <div class="px-3 pt-3">
                        <label for="owner" class="d-flex justify-content-between">
                            <span class="labeltxt"> Owner </span> <img
                                src="images/master.png" width="25" class="image">
                        </label> <input type="text" name="owner" id="owner" required="required"
                                        class="form-control inputtxt" placeholder="your name">
                    </div>


            <div class="d-flex justify-content-between px-3 pt-4">
                <div>
                    <label for="accountNumber" class="exptxt">AcountNumber</label> <input
                        type="number" name="accountNumber" id="accountNumber" required="required"
                        class="form-control expiry" placeholder="0213453565545667">
                </div>

                <div class="d-flex justify-content-between px-3 pt-4">
                                <div>
                                    <label for="expirationDate" class="exptxt">Expiry</label> <input
                                        type="data" name="expirationDate"  id="expirationDate" required="required"
                                        class="form-control expiry" placeholder="MM / YY">
                                </div>




                <div>
                                    <label for="amount" class="exptxt">Amount</label> <input
                                        type="number" name="amount"  id="amount" required="required"
                                        class="form-control expiry" placeholder="your amount">
                                </div>

                <div>
                    <label for="cvv" class="cvvtxt">CVV /CVC</label> <input
                        type="number" name="cvv" min="100" max="999" id="cvv"
                        required="required" class="form-control cvv" placeholder="123">
                </div>
            </div>
            <div
                    class="d-flex align-items-center justify-content-between px-3 py-4">
                <div>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Make
                        Payment</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
