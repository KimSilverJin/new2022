package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.InquiryVO;

@Mapper
public interface InquiryDAO {

	public List<InquiryVO> InquiryAll(InquiryVO vo);

	public InquiryVO InquiryDetail(InquiryVO vo);

	public void InquiryAdd(InquiryVO vo);

	public void InquiryAdd2(InquiryVO vo);

	public List<InquiryVO> InquiryListAdmin();

	public List<InquiryVO> InquiryListAdmin(InquiryVO vo);
}
