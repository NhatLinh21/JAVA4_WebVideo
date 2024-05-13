<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${videos.id}</title>
<%@include file="/common/head.jsp"%>
<style>
.mb-5 {
	display: flex;
	justify-content: center;
	align-items: center;
}

.tm-btn-big {
	margin-bottom: 0; 
}
</style>

</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid tm-container-content tm-mt-60">

		<div class="row tm-mb-90">
			<div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
				<iframe style="height: 500px; width: 100%; display: block;"
					src="https://www.youtube.com/embed/${video.href}"></iframe>
				<div class="col-xl-12 col-lg-5 col-md-6 col-sm-12">
					<div class="tm-bg-Light tm-video-details">
						<div class="row mb-4">
							<h2 class="col-12 tm-text-primary">${video.title}</h2>
						</div>
						<div class="row">
							<div class="col-md-8 mb-4">
								<p>${video.description}</p>
							</div>
							<div class="col-md-4">
								<c:if test="${not empty sessionScope.currentUser}">
									<div class="text-center mb-5">
										<button id="likeorUnlikeBtn"
											class="btn btn-primary tm-btn-big">
											<c:choose>
												<c:when test="${flagLikedBtn == true }">Unlike</c:when>
												<c:otherwise>Like</c:otherwise>
											</c:choose>
										</button>
										<a href="#" class="btn btn-primary tm-btn-big ml-3">Share</a>
										<a href="https://www.youtube.com/embed/${video.href}"
											class="btn btn-primary tm-btn-big ml-3" download>Tải xuống</a>
									</div>
								</c:if>
								<input type="hidden" id="videoIdHdn" value="${video.href}">
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
				<div class="col-xl-12 col-lg-5 col-md-6 col-sm-12">
					<div class="tm-bg-Light tm-video-details">
						<div class="mb-4">
							<div class="row">
								<div class=" mb-8">
									<h5 class="tm-text-secondary"
										style="white-space: nowrap; overflow: hidden;">Bảo Tàng
										(prod. Maiki) | Low G |</h5>
									<figure class="effect-ming tm-video-item">
										<img
											src="<c:url value='https://img.youtube.com/vi/iKVLAXwVLYE/maxresdefault.jpg'/>"
											alt="Image" class="img-fluid">
										<figcaption
											class="d-flex align-items-center justify-content-center">
											<h2>View</h2>
											<a href="<c:url value='/video?action=watch&id=iKVLAXwVLYE'/>">View
												more</a>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-12 col-lg-5 col-md-6 col-sm-12">
					<div class="tm-bg-Light tm-video-details">
						<div class="mb-4">
							<div class="row">
								<div class=" mb-8">
									<h5 class="tm-text-secondary"
										style="white-space: nowrap; overflow: hidden;">Simp Gái
										808 (Maiki Remix) | Low G |</h5>
									<figure class="effect-ming tm-video-item">
										<img
											src="<c:url value='https://img.youtube.com/vi/YOAeo2w53Jw/maxresdefault.jpg'/>"
											alt="Image" class="img-fluid">
										<figcaption
											class="d-flex align-items-center justify-content-center">
											<h2>View</h2>
											<a href="<c:url value='/video?action=watch&id=YOAeo2w53Jw'/>">View
												more</a>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-12 col-lg-5 col-md-6 col-sm-12">
					<div class="tm-bg-Light tm-video-details">
						<div class="mb-4">
							<div class="row">
								<div class=" mb-8">
									<h5 class="tm-text-secondary"
										style="white-space: nowrap; overflow: hidden;">NHỮNG LỜI
										HỨA BỎ QUÊN / VŨ. x DEAR JANE</h5>
									<figure class="effect-ming tm-video-item">
										<img
											src="<c:url value='https://img.youtube.com/vi/h6RONxjPBf4/maxresdefault.jpg'/>"
											alt="Image" class="img-fluid">
										<figcaption
											class="d-flex align-items-center justify-content-center">
											<h2>View</h2>
											<a href="<c:url value='/video?action=watch&id=h6RONxjPBf4'/>">View
												more</a>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-12 col-lg-5 col-md-6 col-sm-12">
					<div class="tm-bg-Light tm-video-details">
						<div class="mb-4">
							<div class="row">
								<div class=" mb-8">
									<h5 class="tm-text-secondary"
										style="white-space: nowrap; overflow: hidden;">MUỘN PHIỀN
										– PHƯƠNG LY ft. LOW G</h5>
									<figure class="effect-ming tm-video-item">
										<img
											src="<c:url value='https://img.youtube.com/vi/h4WX3B3hj4k/maxresdefault.jpg'/>"
											alt="Image" class="img-fluid">
										<figcaption
											class="d-flex align-items-center justify-content-center">
											<h2>View</h2>
											<a href="<c:url value='/video?action=watch&id=h4WX3B3hj4k'/>">View
												more</a>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>


	</div>
	<!-- container-fluid, tm-container-content -->
	<%@ include file="/common/footer.jsp"%>
	<script>
		$('#likeorUnlikeBtn').click(function() {
			var videoId = $('#videoIdHdn').val();
			$.ajax({
				url : 'video?action=like&id=' + videoId
			}).then(function(data) {
				var text = $('#likeorUnlikeBtn').text();
				if (text.indexOf('Like') != -1) {
					$('#likeorUnlikeBtn').text('Unlike');
				} else {
					$('#likeorUnlikeBtn').text('Like');
				}
			}).fail(function(error) {
				alert('lỗi');
			});
		});
	</script>
</body>
</html>