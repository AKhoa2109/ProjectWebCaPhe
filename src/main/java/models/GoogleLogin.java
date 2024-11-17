package models;

import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.fluent.Request;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.http.client.fluent.Form;

import java.io.IOException;

public class GoogleLogin {

    public static final String GOOGLE_CLIENT_ID = System.getenv("GOOGLE_CLIENT_ID");
    public static final String GOOGLE_CLIENT_SECRET = System.getenv("GOOGLE_CLIENT_SECRET");
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/Project/GoogleLoginServlet";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public GoogleLogin() {
        // Constructor can be left empty if not needed for initialization
    }

    public static String getToken(String code) throws IOException {
        // Create the request to exchange the authorization code for an access token
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                        .add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", GOOGLE_GRANT_TYPE)
                        .build())
                .execute().returnContent().asString();

        // Parse the response JSON
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        // Extract the access token from the response
        String accessToken = jobj.get("access_token").getAsString();

        return accessToken;
    }
    
    public static NguoiDung getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

    	// Liên kết URL lấy thông tin người dùng từ Google
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;

        // Gửi yêu cầu GET để lấy thông tin người dùng
        String response = Request.Get(link).execute().returnContent().asString();

        // Parse JSON Response
        JsonObject googleResponse = new Gson().fromJson(response, JsonObject.class);

        // Tạo đối tượng NguoiDung và ánh xạ các trường từ Google API
        NguoiDung googleUser = new NguoiDung();
        googleUser.setTenND(googleResponse.get("name").getAsString());  // Tên người dùng
        googleUser.setGioiTinh(googleResponse.has("gender") ? googleResponse.get("gender").getAsString() : "");  // Giới tính (nếu có)
        googleUser.setEmail(googleResponse.get("email").getAsString());  // Email
        googleUser.setAnhND(googleResponse.get("picture").getAsString());  // Link ảnh đại diện
        googleUser.setSdt("");  // Số điện thoại (Google API không cung cấp)
        googleUser.setDiaChi("");  // Địa chỉ (Google API không cung cấp)
        googleUser.setNamSinh(0);  // Năm sinh (Google API không cung cấp)

        return googleUser;

    }
}
