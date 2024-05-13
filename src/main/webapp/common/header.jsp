<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Entertainment</title>
<!-- Add Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Add jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Add Bootstrap JS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Page Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="index">
				ONLINE ENTERTAINMENT
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${not empty sessionScope.currentUser}">
							<li class="nav-item"><a class="nav-link nav-link-1 active"
								aria-current="page" href="#">Welcome:
									${sessionScope.currentUser.username}</a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="favorites">MY FAVORITES</a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="history">HISTORY</a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="logout"> Logout</a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="editprf">Edit Profile</a></li>
						</c:when>
						
						<c:otherwise>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="login"> Login</a></li>
								<li class="nav-item"><a class="nav-link nav-link-2"
								href="register">Register</a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="changepass">Change Password </a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="forgotpass">Forgot Password</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	
</body>
</html>
