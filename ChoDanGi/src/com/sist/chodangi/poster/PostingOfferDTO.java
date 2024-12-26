package com.sist.chodangi.poster;

public class PostingOfferDTO
{
	private int id;						// 제안번호
	private int posting_id;				// 공고번호
	private int open_application_id;	// 오픈지원서번호
	private String offer_date;			// 제안일자
	
	public PostingOfferDTO(int posting_id, int open_application_id)
	{
		this.posting_id = posting_id;
		this.open_application_id = open_application_id;
	}
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getPosting_id()
	{
		return posting_id;
	}
	public void setPosting_id(int posting_id)
	{
		this.posting_id = posting_id;
	}
	public int getOpen_application_id()
	{
		return open_application_id;
	}
	public void setOpen_application_id(int open_application_id)
	{
		this.open_application_id = open_application_id;
	}
	public String getOffer_date()
	{
		return offer_date;
	}
	public void setOffer_date(String offer_date)
	{
		this.offer_date = offer_date;
	}
}
