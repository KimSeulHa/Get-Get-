package faq;

public class Faq {
	private int faqnum;
	private String faqTitle;
	private String id;
	private String faqContent;
	private String date;
	private String faqimg;
	private int faqAvailable;

	public int getFaqnum() {
		return faqnum;
	}

	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public int getFaqAvailable() {
		return faqAvailable;
	}

	public void setFaqAvailable(int faqAvailable) {
		this.faqAvailable = faqAvailable;
	}

	public String getFaqimg() {
		return faqimg;
	}

	public void setFaqimg(String faqimg) {
		this.faqimg = faqimg;
	}
}
