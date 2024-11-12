package com.example.androidserver.Comment.mapper;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.user.mapper.UserRowMapper;
import com.example.androidserver.user.model.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

@Log4j2
public class CommentRowMapper implements RowMapper<Comment> {
    @Override
    public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
        Comment comment = new Comment();
        comment.setCid(rs.getInt("cid"));
        comment.setUid(rs.getLong("uid"));
        comment.setQid(rs.getInt("qid"));
        comment.setContent(rs.getString("content"));
        comment.setCreateAt(rs.getTimestamp("createAt"));
        comment.setUpdateAt(rs.getTimestamp("updateAt"));

        // User 정보 매핑
        User user = new User();
        user.setUid(rs.getLong("uid"));
        user.setName(rs.getString("name"));
        user.setCompany(rs.getString("company"));
        comment.setUser(user);
        return comment;
    }
}