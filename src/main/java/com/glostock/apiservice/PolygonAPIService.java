package com.glostock.apiservice;

import com.glostock.model.CompanyVO;
import com.glostock.model.NewsVO;
import com.glostock.model.StockVO;
import org.json.JSONArray;
import org.json.JSONObject;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class PolygonAPIService {

    private static String input_ticker = "";

    static final String USER_AGENT = "Mozilla/5.0";

    public static ArrayList<NewsVO> getThreeNews(String company_ticker) throws IOException {
        ArrayList<NewsVO> three_recent_news = new ArrayList<>();

        String NEWSAPI_URL = "https://api.polygon.io/v2/reference/news?ticker=" + company_ticker + "&apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY";

        URL news_obj = new URL(NEWSAPI_URL);

        HttpURLConnection newsURLConnection = (HttpURLConnection) news_obj.openConnection();
        newsURLConnection.setRequestMethod("GET");
        newsURLConnection.setRequestProperty("User-Agent", USER_AGENT);

        if (newsURLConnection.getResponseCode() == newsURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(newsURLConnection.getInputStream()));
            String inputLine;
            StringBuffer newsresponse = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                newsresponse.append(inputLine);
            }
            in.close();

            JSONObject jObject = new JSONObject(newsresponse.toString());

            JSONArray newsArray = jObject.getJSONArray("results");

            for (int i = 0; i < 3; i++) {
                NewsVO vo = new NewsVO();
                vo.setPublisher_name(newsArray.getJSONObject(i).getJSONObject("publisher").getString("name"));
                vo.setArticle_author(newsArray.getJSONObject(i).getString("author"));
                vo.setArticle_description(newsArray.getJSONObject(i).getString("description"));
                vo.setArticle_title(newsArray.getJSONObject(i).getString("title"));
                vo.setArticle_url(newsArray.getJSONObject(i).getString("article_url"));
                vo.setArticle_image_url(newsArray.getJSONObject(i).getString("image_url"));
                vo.setPublisher_logo_url(newsArray.getJSONObject(i).getJSONObject("publisher").getString("logo_url"));
                vo.setPublisher_icon_url(newsArray.getJSONObject(i).getJSONObject("publisher").getString("favicon_url"));
                vo.setArticle_timestamp(newsArray.getJSONObject(i).getString("published_utc"));
                three_recent_news.add(vo);
            }

        } else {
            System.out.println("GET request not worked");
        }

        return three_recent_news;
    }

    public static CompanyVO getCompanyProfile(String company_ticker) throws IOException {
        CompanyVO profile = new CompanyVO();
        String COMPANY_PROFILE_URL = "https://api.polygon.io/v3/reference/tickers/" + company_ticker + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY";


        URL profileRequestObject = new URL(COMPANY_PROFILE_URL);
        HttpURLConnection profileURLConnection = (HttpURLConnection) profileRequestObject.openConnection();
        profileURLConnection.setRequestMethod("GET");
        profileURLConnection.setRequestProperty("User-Agent", USER_AGENT);

        if (profileURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(profileURLConnection.getInputStream()));
            String inputLine;
            StringBuffer companyProfileResponse = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                companyProfileResponse.append(inputLine);
            }
            in.close();

            JSONObject jObject = new JSONObject(companyProfileResponse.toString());

            JSONObject companyProfileObject = jObject.getJSONObject("results");
            profile.setCompany_ticker(companyProfileObject.getString("ticker"));
            profile.setCompany_name(companyProfileObject.getString("name"));
            profile.setCompany_description(companyProfileObject.getString("description"));
            profile.setCompany_website_url(companyProfileObject.getString("homepage_url"));
            profile.setCompany_currency(companyProfileObject.getString("currency_name"));
            profile.setCompany_logo_url(companyProfileObject.getJSONObject("branding").getString("logo_url"));
            profile.setCompany_description_ko(PapagoAPIService.translateENtoKR(profile.getCompany_description()));

        } else {
            System.out.println("GET request not worked");
        }
        return profile;
    }

    public static ArrayList<StockVO> getFollowList() throws IOException {
        ArrayList<StockVO> followList = new ArrayList<>();

        String DISCOVER_URL = "https://api.polygon.io/v3/reference/tickers?type=CS&exchange=XNYS&active=true&sort=ticker&order=asc&limit=3&apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY";

        URL discoverRequestObject = new URL(DISCOVER_URL);
        HttpURLConnection discoverURLConnection = (HttpURLConnection) discoverRequestObject.openConnection();
        discoverURLConnection.setRequestMethod("GET");
        discoverURLConnection.setRequestProperty("User-Agent", USER_AGENT);

        if (discoverURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(discoverURLConnection.getInputStream()));
            String inputLine;
            StringBuffer discoverResponse = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                discoverResponse.append(inputLine);
            }
            in.close();

            JSONObject jObject = new JSONObject(discoverResponse.toString());

            JSONArray discoverResultArray = jObject.getJSONArray("results");
            System.out.println(discoverResultArray.length());

            for (Object jsonObject : discoverResultArray) {
                StockVO vo = new StockVO();
                JSONObject jsObject = (JSONObject) jsonObject;

                vo.setTicker(jsObject.getString("ticker"));
                vo.setName(jsObject.getString("name"));

                Stock tempStock = YahooFinance.get(vo.getTicker());
                vo.setCurrent_price(tempStock.getQuote().getPrice().doubleValue());

                vo.setPrev_close_price(tempStock.getQuote().getPreviousClose().doubleValue());
                vo.setChange_in_percentage(tempStock.getQuote().getChangeInPercent().doubleValue());

                CompanyVO tempCompanyVO = getCompanyProfile(vo.getTicker());

                vo.setLogo_url(tempCompanyVO.getCompany_logo_url());

                followList.add(vo);
            }

        } else {
            System.out.println("GET request not worked");
        }

        return followList;
    }

}
