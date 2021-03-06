package com.icia.web.model;

import java.io.Serializable;

public class WDStudio implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String sCode;
	private String sName;
	private long sPrice;
	private String sLocation;
	private String sNumber;
	private String sImgname;
	private String sContent;
	
	private String searchType;      	//검색타입(1:이름, 2:제묵, 3:내용)
	private String searchValue;      	//검색값
	private long startRow;         		//시작 rownum
	private long endRow;         		//끝rownum
	private long sDiscount;
	
	private int sSubImg;
	
	private WDStudioFile wdStudoiFile;
	
	private String sDate;	//결혼 날짜
	
	public WDStudio()
	{
	    sCode = "";
	    sName = "";
	    sPrice = 0;
	    sLocation = "";
	    sNumber = "";
	    sImgname = "";
	    sContent = "";
	    searchType = "";
	    searchValue = "";
	    startRow = 0;
	    endRow = 0;
	    wdStudoiFile = null;
	    sDiscount = 0;
	    
	    sSubImg = 0;
	    sDate = "";
	}
		

	public int getsSubImg() {
		return sSubImg;
	}


	public void setsSubImg(int sSubImg) {
		this.sSubImg = sSubImg;
	}


	public long getsDiscount() {
		return sDiscount;
	}

	public void setsDiscount(long sDiscount) {
		this.sDiscount = sDiscount;
	}


	public String getsCode() {
		return sCode;
	}


	public void setsCode(String sCode) {
		this.sCode = sCode;
	}


	public String getsName() {
		return sName;
	}


	public void setsName(String sName) {
		this.sName = sName;
	}


	public long getsPrice() {
		return sPrice;
	}


	public void setsPrice(long sPrice) {
		this.sPrice = sPrice;
	}


	public String getsLocation() {
		return sLocation;
	}


	public void setsLocation(String sLocation) {
		this.sLocation = sLocation;
	}


	public String getsNumber() {
		return sNumber;
	}


	public void setsNumber(String sNumber) {
		this.sNumber = sNumber;
	}


	public String getsImgname() {
		return sImgname;
	}


	public void setsImgname(String sImgname) {
		this.sImgname = sImgname;
	}


	public String getsContent() {
		return sContent;
	}


	public void setsContent(String sContent) {
		this.sContent = sContent;
	}


	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getSearchValue() {
		return searchValue;
	}


	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}


	public long getStartRow() {
		return startRow;
	}


	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}


	public long getEndRow() {
		return endRow;
	}


	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}


	public WDStudioFile getWdStudoiFile() {
		return wdStudoiFile;
	}


	public void setWdStudoiFile(WDStudioFile wdStudoiFile) {
		this.wdStudoiFile = wdStudoiFile;
	}


	public String getsDate() {
		return sDate;
	}


	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

}
