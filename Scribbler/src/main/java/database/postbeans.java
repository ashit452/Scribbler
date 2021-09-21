package database;

import java.io.InputStream;
import java.sql.Blob;

public class postbeans {
	private int Uid;
	private String Title;
	private String Description;
	private String Category;
	private InputStream Image;
	private String status;
	public postbeans() {
		super();
		
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getUid() {
		return Uid;
	}
	public void setUid(int uid) {
		Uid = uid;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public InputStream getImage() {
		return Image;
	}
	public void setImage(InputStream blob) {
		Image = blob;
	}
	
}
