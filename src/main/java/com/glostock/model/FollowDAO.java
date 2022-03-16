package com.glostock.model;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FollowDAO {
    String url = "jdbc:oracle:thin:@localhost:1521/orcl";
    String uid = "glostock";
    String upw = "glostock";

    private static FollowDAO instance = new FollowDAO();

    private FollowDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            System.out.println("드라이버 로딩 에러 발생");
        }
    }

    public static FollowDAO getInstance() {
        return instance;
    }

    private DataSource ds;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    public int addFollow(String nickname, String ticker) {
        int result = 0;

        String sql = "INSERT INTO glo_follow (nickname, ticker) VALUES (?, ?)";

        try {
            conn = DriverManager.getConnection(url, uid, upw);
            System.out.println("ADD 커넥션 성공");

            pstmt = conn.prepareStatement(sql);
            pstmt.setNString(1, nickname);
            pstmt.setNString(2, ticker);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("ADD 커넥션 에러 발생");
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public int unfollow(String nickname, String ticker) {
        int result = 0;

        String delete_sql = "DELETE FROM glo_follow WHERE nickname=? AND ticker=?";

        try {
            conn = DriverManager.getConnection(url, uid, upw);

            System.out.println("UNFOLLOW 커넥션 성공");

            pstmt = conn.prepareStatement(delete_sql);
            System.out.println("After prepare statement");
            pstmt.setString(1, nickname);
            System.out.println("After first set string");
            pstmt.setString(2, ticker);
            System.out.println("After second set string");

            result = pstmt.executeUpdate(delete_sql);

            System.out.println("After execute update");

        } catch (Exception e) {
            System.out.println("UNFOLLOW 커넥션 실패");
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public ArrayList<FollowVO> getFollowList(String nickname) {
        ArrayList<FollowVO> result = new ArrayList<>();

        String sql = "SELECT * FROM glo_follow WHERE nickname = ?";

        try {
            conn = DriverManager.getConnection(url, uid, upw);
            System.out.println("GET 커넥션 성공");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nickname);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                FollowVO vo = new FollowVO(
                        rs.getInt("FollowID"),
                        rs.getString("Nickname"),
                        rs.getString("Ticker"),
                        rs.getTimestamp("Appendtime")
                );
                result.add(vo);
            }

        } catch (Exception e) {
            System.out.println("GET 커넥션 에러 발생");
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
