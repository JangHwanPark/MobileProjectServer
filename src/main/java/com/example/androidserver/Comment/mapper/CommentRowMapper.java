package com.example.androidserver.Comment.mapper;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.user.mapper.UserRowMapper;
import com.example.androidserver.user.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentRowMapper implements RowMapper<Comment> {
    @Override
    public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
        Comment comment = new Comment();
        comment.setCid(rs.getInt("cid"));
        comment.setUid(rs.getInt("uid"));
        comment.setQid(rs.getInt("qid"));
        comment.setContent(rs.getString("content"));
        comment.setCreateAt(rs.getTimestamp("createAt"));
        comment.setUpdateAt(rs.getTimestamp("updateAt"));

        // User 정보 매핑
        UserRowMapper userRowMapper = new UserRowMapper();
        User user = userRowMapper.mapRow(rs, rowNum); // UserMapper 사용
        comment.setUser(user); // Comment에 User 설정
        return comment;
    }
}