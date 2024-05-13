package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.dto.VideoLikedInfo;
import com.poly.entity.User;
import com.poly.service.StatsService;
import com.poly.service.impl.StatsServiceImpl;

@WebServlet(urlPatterns = "/admin", name = "HomeControllerOfAdmin")
public class HomeController extends HttpServlet {
	

	
	private static final long serialVersionUID = 4338025172547614527L;
	
	private StatsService statsService = new StatsServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);

		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
			req.setAttribute("videos", videos);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/home.jsp");
			requestDispatcher.forward(req, resp);
		} else {
			resp.sendRedirect("index");
		}

	}

}
