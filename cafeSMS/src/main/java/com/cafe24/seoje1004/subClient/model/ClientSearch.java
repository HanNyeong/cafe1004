package com.cafe24.seoje1004.subClient.model;

public class ClientSearch {
	private String upDown;
	private String criteria;
	private String regitDateStart;
	private String regitDateEnd;
	private String searchKey;
	private String searchSubClient;
	
	public String getUpDown() {
			return upDown;
		}
		public void setUpDown(String upDown) {
			this.upDown = upDown;
		}
		public String getCriteria() {
			return criteria;
		}
		public void setCriteria(String criteria) {
			this.criteria = criteria;
		}
		public String getRegitDateStart() {
			return regitDateStart;
		}
		public void setRegitDateStart(String regitDateStart) {
			this.regitDateStart = regitDateStart;
		}
		public String getRegitDateEnd() {
			return regitDateEnd;
		}
		public void setRegitDateEnd(String regitDateEnd) {
			this.regitDateEnd = regitDateEnd;
		}
		public String getSearchKey() {
			return searchKey;
		}
		public void setSearchKey(String searchKey) {
			this.searchKey = searchKey;
		}
		public String getSearchSubClient() {
			return searchSubClient;
		}
		public void setSearchSubClient(String searchSubClient) {
			this.searchSubClient = searchSubClient;
		}
		@Override
		public String toString() {
			return "ClientSearch [upDown=" + upDown + ", criteria=" + criteria + ", regitDateStart=" + regitDateStart
					+ ", regitDateEnd=" + regitDateEnd + ", searchKey=" + searchKey + ", searchSubClient="
					+ searchSubClient + "]";
		}
		
}
