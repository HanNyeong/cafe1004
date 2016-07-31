package com.cafe24.seoje1004.event.model;

public class Event {
	private String eventCode;
	private String eventName;
	private String eventBegin;
	private String eventEnd;
	private String eventType;
	private int eventDiscountRate;
	private String eventRegitDate;
	private String headStaffId;
	
	public String getEventCode() {
		return eventCode;
	}
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventBegin() {
		return eventBegin;
	}
	public void setEventBegin(String eventBegin) {
		this.eventBegin = eventBegin;
	}
	public String getEventEnd() {
		return eventEnd;
	}
	public void setEventEnd(String eventEnd) {
		this.eventEnd = eventEnd;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public int getEventDiscountRate() {
		return eventDiscountRate;
	}
	public void setEventDiscountRate(int eventDiscountRate) {
		this.eventDiscountRate = eventDiscountRate;
	}
	public String getEventRegitDate() {
		return eventRegitDate;
	}
	public void setEventRegitDate(String eventRegitDate) {
		this.eventRegitDate = eventRegitDate;
	}
	public String getHeadStaffId() {
		return headStaffId;
	}
	public void setHeadStaffId(String headStaffId) {
		this.headStaffId = headStaffId;
	}
	@Override
	public String toString() {
		return "Event [eventCode=" + eventCode + ", eventName=" + eventName + ", eventBegin=" + eventBegin
				+ ", eventEnd=" + eventEnd + ", eventType=" + eventType + ", eventDiscountRate=" + eventDiscountRate
				+ ", eventRegitDate=" + eventRegitDate + ", headStaffId=" + headStaffId + "]";
	}
	
}
