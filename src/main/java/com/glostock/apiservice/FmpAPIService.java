package com.glostock.apiservice;

import com.glostock.model.CompanyVO;
import com.glostock.model.StockVO;
import org.json.JSONArray;
import org.json.JSONObject;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import static com.glostock.apiservice.PolygonAPIService.USER_AGENT;

public class FmpAPIService {

    public static String getCompanyDescription(String company_ticker) throws IOException {
        String DESCRIPTION_URL = "https://financialmodelingprep.com/api/v3/profile/AAPL?apikey=ae03df0dffd60c7068914990fd18aaa8";
        String companyDescription = null;

        URL descRequestURL = new URL(DESCRIPTION_URL);
        HttpURLConnection descURLConnection = (HttpURLConnection) descRequestURL.openConnection();
        descURLConnection.setRequestMethod("GET");
        descURLConnection.setRequestProperty("User-Agent", USER_AGENT);

        if (descURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(descURLConnection.getInputStream()));
            String inputLine;
            StringBuffer descriptionResponse = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                descriptionResponse.append(inputLine);
            }
            in.close();

            JSONArray jObject = new JSONArray(descriptionResponse.toString());

            companyDescription = jObject.getJSONObject(0).getString("description");


        } else {
            System.out.println("GET request not worked");
        }

        return companyDescription;
    }


}
