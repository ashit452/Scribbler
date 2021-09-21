package Imgupload;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

public class parttoblob {
	public static InputStream getmyblob(Part p) {
		InputStream is=null;
		try {
			is = p.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return is;
	}
}
