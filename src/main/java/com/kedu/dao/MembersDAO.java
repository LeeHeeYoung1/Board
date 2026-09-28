package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MembersDTO;

@Repository

public class MembersDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int signup(MembersDTO dto) {
	
		String sql = "insert members from values(?,?,?,?,?,?,?,?,systimestamp)";
		return jdbc.update(sql, dto.getId(),dto.getPw(),dto.getName(),dto.getPhone(),dto.getEmail(),
		        dto.getZipcode(),dto.getAddress1(),dto.getAddress2());
	}
	
	public int idCheck(String id) {
		String sql = "select count(*) from members where id=?";
		return jdbc.queryForObject(sql, Integer.class, id);
	}
	
	public boolean login(MembersDTO dto) {
		String sql = "select count(*) from members where id=? and pw=?";
		int idCount = jdbc.queryForObject(sql, Integer.class, dto.getId(),dto.getPw());
		return idCount>0;
	}
	
	public MembersDTO myPage(MembersDTO dto) {
		String sql = "select * from members where id=?";
		return jdbc.queryForObject(sql,  new BeanPropertyRowMapper<>(MembersDTO.class), dto.getId());
	}
	
	public int deleteAccount(String delId) {
		String sql = "delete from members where id=?";
		return jdbc.update(sql, delId);
	}
	
	public int updateMypage(MembersDTO dto) {
		String sql = "update members set name=?, phone=?, email=?,"
				+ " zipcode=?, address1=?, address2=? where id=?";
		return jdbc.update(sql, dto.getName(),dto.getPhone(),dto.getEmail(),dto.getZipcode(),
				dto.getAddress1(),dto.getAddress2(),dto.getId());
	}
}
