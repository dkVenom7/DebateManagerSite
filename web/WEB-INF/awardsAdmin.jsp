<%--
Dhruv K. Saligram
1/11/2020
This program facilitates mock conferences and debate team management
This page displays the awards to admins and allows for extra management functions
--%>

<%--Linking page to servlet and accessing other database languages below:--%>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import = "javax.servlet.http.*,javax.servlet.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%--Linking to other classes below:--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Awards</title>
        <link rel="stylesheet" type="text/css" href="StylingSheet.css"/>
    </head>
    <%--Creating body below:--%>
    <body id="noScrollBackground">
        <%--Creating navbar for user to navigate between pages below:--%>
        <div class="header">
            <nav>
                <ul>
                    <%--Linking the nav bar to other HTML pages below:--%>
                    <li>||</li>
                    <li>
                        <form action="teamMembersAdmin" method="POST">
                            <input id="navBarButton" type="submit" value="TEAM"/>
                        </form>
                    </li>
                    <li>||</li>
                    <li><form action="leadershipAdmin" method="POST">
                            <input id="navBarButton" type="submit" value="LEADERSHIP"/>
                        </form></li>
                    <li>||</li>
                    <li><form action="conferencesAdmin" method="POST">
                            <input id="navBarButton" type="submit" value="CONFERENCES"/>
                        </form></li>
                    <li>||</li>
                    <li><form action="mockRunnerHome" method="POST">
                            <input id="navBarButton" type="submit" value="MOCK RUNNER"/>
                        </form></li>
                    <li>||</li>
                    <li>
                        <%--Creating dropdown for navbar below:--%>
                        <div id="navBarButton" class="dropdown">
                            <button id="navBarButton">MESSAGING</button>
                            <div class="dropdown-content" id="navBarColor">
                                <form action="inboxAdmin" method="POST">
                                    <input id="navBarButton" type="submit" value="   VIEW INBOX   "/>
                                </form>
                                <a href="#popup6" id="navBarButton">SEND MESSAGE</a>
                            </div>
                        </div>
                    </li>
                    <li>||</li>
                    <li><form action="awardsAdmin" method="POST">
                            <input id="navBarButton" type="submit" value="AWARDS"/>
                        </form></li>
                    <li>||</li>
                    <li><form action="logOut" method="POST">
                            <input id="navBarButton" type="submit" value="LOG OUT"/>
                        </form></li>
                    <li>||</li>
                </ul>
            </nav>
        </div>
        <br>
        <br>
        <br>
        <br>
        <%--Adding icon below:--%>
        <img id="awardsImage" src="trophy.png" />
        <%--Creating header below:--%>
        <p id="announcementText">AWARDS</p>
        <%--Creating table to display data from database below:--%>
        <div id="awardAdminTable">
            <table border="3" width="50%" id="tableTest">
                <tr>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Position Paper</th>
                    <th>Honorable</th>
                    <th>Outstanding</th>
                    <th>Best</th>
                </tr>
                <%--Receiving data from servlet below:--%>
                <c:forEach var="row" items="${dbData}">
                    <tr>
                        <td><c:out value="${row.get(0)}"/></td>
                        <td><c:out value="${row.get(1)}"/></td>
                        <td><c:out value="${row.get(2)}"/></td>
                        <td><c:out value="${row.get(3)}"/></td>
                        <td><c:out value="${row.get(4)}"/></td>
                        <td><c:out value="${row.get(5)}"/></td>
                        <td><c:out value="${row.get(6)}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br>
        <br>
        <%--Creating button to insert data into database below:--%>
        <form name="nameEntry" id="addAwardButton" href="#popup1" method="POST">
            <a href="#popup1" id="entryButtonTest">ADD AWARD</a>
        </form>
        <br>
        <br>
        <br>
        <br>
        <%--Creating button to insert data from database below:--%>
        <form name="nameEntry" id="updateAwardButton" href="#popup2" method="POST">
            <a href="#popup2" id="entryButtonTest">UPDATE AWARD</a>
        </form>
        <br>
        <br>
        <br>
        <br>
        <%--Creating popup to receive data to insert into database below:--%>
        <div id="popup1" class="overlay">
            <div class="popup">
                <h2>ADD AWARD:</h2>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <%--Creating area for user to type in data below:--%>
                    <form action="registerAward" method="POST">
                        <hr class="whereLeft"> <p class="whereText"> WHERE </p> <hr class="whereRight">
                        <br>
                        USERNAME: <br> <input type="text" name="fullName"/>
                        <br>
                        <br>
                        <hr class="addLeft"> <p class="addText"> ADD </p> <hr class="addRight">
                        <br>
                        <input type="radio" name="award" value="positionPaper"> Position Paper
                        <br>
                        <input type="radio" name="award" value="honorable"> Honorable Delegate
                        <br>
                        <input type="radio" name="award" value="outstanding"> Outstanding Delegate
                        <br>
                        <input type="radio" name="award" value="best"> Best Delegate
                        <br>
                        <br>
                        <%--Creating button to send data to servlet below:--%>
                        <input class="Sbutton" type="submit" value="ADD"/>
                    </form>
                </div>
            </div>
        </div>
        <%--Creating popup to receive data to insert into database below:--%>
        <div id="popup2" class="overlay">
            <div class="popup">
                <h2>UPDATE AWARD:</h2>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <%--Creating area for user to type in data below:--%>
                    <form action="updateAward" method="POST">
                        <hr class="whereLeft"> <p class="whereText"> WHERE </p> <hr class="whereRight">
                        <br>
                        USERNAME: <br><input type="text" name="fullNameUpdate"/>
                        <br>
                        <br>
                        <hr class="updateLeft"> <p class="updatingText"> UPDATE </p> <hr class="updateRight">
                        <br>
                        <h3>AWARD:</h3>
                        <input type="radio" name="awardUpdate" value="positionPaperUpdate"> Position Paper
                        <br>
                        <input type="radio" name="awardUpdate" value="honorableUpdate"> Honorable Delegate
                        <br>
                        <input type="radio" name="awardUpdate" value="outstandingUpdate"> Outstanding Delegate
                        <br>
                        <input type="radio" name="awardUpdate" value="bestUpdate"> Best Delegate
                        <br>
                        <br>
                        NEW COUNT: <br><input type="text" name="finalAwardUpdate"/>
                        <br>
                        <br>
                        <%--Creating button to send data to servlet below:--%>
                        <input class="Sbutton" type="submit" value="UPDATE"/>
                    </form>
                </div>
            </div>
        </div>
        <%--Creating popup to receive data to insert into database below:--%>
        <div id="popup6" class="overlay">
            <div class="popup">
                <h2>SEND MESSAGE:</h2>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <%--Creating area for user to type in data below:--%>
                    <form action="sendMessage" method="POST">
                        RECIPIENT USERNAME: <br><input type="text" name="userNameSend"/>
                        <br>
                        <br>
                        MESSAGE: <br><textarea rows="5" cols="10" id="messageText" name="message"></textarea>
                        <br>
                        <br>
                        <%--Creating button to send data to servlet below:--%>
                        <input class="Sbutton" type="submit" value="SEND"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
