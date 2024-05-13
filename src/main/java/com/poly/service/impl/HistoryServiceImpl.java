package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {

	private HistoryDao dao;

	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	private VideoService videoService = new VideoServiceImpl();

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History exitsHistory = findByUserIdAndVideoId(user.getId(),video.getId());
		if (exitsHistory == null) {
			exitsHistory= new History();
			exitsHistory.setUser(user);
			exitsHistory.setVideo(video);
			exitsHistory.setViewsDate(new Timestamp(System.currentTimeMillis()));
			exitsHistory.setIsLiked(Boolean.FALSE);
			return dao.create(exitsHistory);
		}
		
		return exitsHistory;
	
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		History exitsHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (exitsHistory.getIsLiked() == Boolean.FALSE) {
			exitsHistory.setIsLiked(Boolean.TRUE);
			exitsHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
		} else {
			exitsHistory.setIsLiked(Boolean.FALSE);
			exitsHistory.setLikedDate(null);
		}
		History updateHistory = dao.update(exitsHistory);
		return updateHistory != null ? true : false;
	}

}
