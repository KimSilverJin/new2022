package com.sample.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.InquiryDAO;
import com.sample.vo.InquiryVO;

@Service
public class InquiryService {

	private InquiryDAO inquiryDAO;

	public InquiryService(InquiryDAO inquiryDAO) {
		super();
		this.inquiryDAO = inquiryDAO;
	}

	public List<InquiryVO> inquiryAll(InquiryVO inquiryVO) {
		return inquiryDAO.InquiryAll(inquiryVO);
	}

	public InquiryVO inquiryDetail(InquiryVO inquiryVO) {
		return inquiryDAO.InquiryDetail(inquiryVO);
	}

	public void InquiryAdd(InquiryVO inquiryVO) {
		inquiryDAO.InquiryAdd(inquiryVO);
	}

	public void InquiryAdd2(InquiryVO inquiryVO) {
		inquiryDAO.InquiryAdd2(inquiryVO);
	}

	public List<InquiryVO> inquiryListAdmin() {
		return inquiryDAO.InquiryListAdmin();
	}

	public List<InquiryVO> inquiryListAdmin(InquiryVO inquiryVO) {
		return inquiryDAO.InquiryListAdmin(inquiryVO);
	}
}
