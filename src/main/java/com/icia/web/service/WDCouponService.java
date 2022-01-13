package com.icia.web.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.web.dao.WDCouponDao;
import com.icia.web.model.WDCoupon;

@Service("WDCouponService")
public class WDCouponService {
	
	private static Logger logger = LoggerFactory.getLogger(WDCouponService.class);
	
	@Autowired
	private WDCouponDao wdCouponDao;
	
	public List<WDCoupon> couponSelectList(String userId) {
		
		List<WDCoupon> wdCoupon = null;
		try {
			wdCoupon = wdCouponDao.couponSelectList(userId);
		}
		catch(Exception e) {
			logger.error("[WDCouponService] couponSelect Exception", e);
		}
		
		return wdCoupon;
	}
	
	
	
	//결제 완료된 내역에서 결제중 쿠폰 정보를 가져오기 시작
	public WDCoupon couponSelectPayOk(HashMap<String, Object> map) 
	{
		WDCoupon wdCoupon = null;
		
		try 
		{
			wdCoupon = wdCouponDao.couponSelectPayOk(map);
		}
		catch(Exception e) 
		{
			logger.error("[WDCouponService] couponSelectPayOk Exception", e);
		}
		
		return wdCoupon;
	}
	
	
	//쿠폰 조회, 사용가능한 상태나 사용한 상태에 따라서 다르게 불러올 수 있는 쿼리(욱채꺼 수정 ㅡ_ㅡ;;)
	public List<WDCoupon> couponList(WDCoupon wdCoupon)
	{
		List<WDCoupon> list = null;
		
		try 
		{
			list = wdCouponDao.couponList(wdCoupon);
		}
		catch(Exception e) 
		{
			logger.error("[WDCouponService] couponList Exception", e);
		}
		
		return list;
	}
}
