package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/video" }, name = "VideoContrllerOfAdmin")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 3968414433292121855L;
	private VideoService videoService = new VideoServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);

		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "view":
				doGetOverView(req, resp);
				break;
			case "delete":
				doGetDelete(req, resp);
				break;
			case "add":
				doGetAdd(req, resp);
				break;
			}
		} else {
			resp.sendRedirect("index");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);

		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "add":
				doGetAdd(req, resp);
				break;
			}
		} else {
			resp.sendRedirect("index");
		}
	}

	protected void doGetOverView(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/video-overview.jsp");
		requestDispatcher.forward(req, resp);
	}

	protected void doGetDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String href = req.getParameter("href");
		Video videoDelete = videoService.delete(href);
		if (videoDelete != null) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);

		}

	}

	protected void doGetAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/video-edit.jsp");
		requestDispatcher.forward(req, resp);
	}

	protected void doPostAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String href = req.getParameter("href");
		String poster = req.getParameter("poster");

		Video video = new Video();
		video.setTitle(title);
		video.setHref(href);
		video.setDescription(description);
		video.setPoster(poster);
		
		Video videoReturn = videoService.create(video);
		if (videoReturn != null) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);

		}
	}
}
