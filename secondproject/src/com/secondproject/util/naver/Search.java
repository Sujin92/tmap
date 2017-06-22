package com.secondproject.util.naver;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Search {

	public void getData() {
		String clientId = "HI7oAnTDg6I_l3gyYakf";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
		String clientSecret = "gqOC6yp27Q";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";
		try {
			String text = URLEncoder.encode("�׸����丮", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text; // json
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ���� �߻�
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			String data = response.toString();
			System.out.println("1" + new String(data.getBytes("UTF-8"), "EUC-KR"));
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
