package com.sample.vo;

public class EmailVO {
	
	    private String receiveMail;
	    private String title;
	    private String content;

	    public EmailVO() {}

	    public EmailVO(String receiveMail, String title, String content) {
	        this.receiveMail = receiveMail;
	        this.title = title;
	        this.content = content;
	    }

		public String getReceiveMail() {
			return receiveMail;
		}

		public void setReceiveMail(String receiveMail) {
			this.receiveMail = receiveMail;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}
	    
	    
}
