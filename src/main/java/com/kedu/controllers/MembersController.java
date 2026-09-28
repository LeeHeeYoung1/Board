package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dao.MembersDAO;
import com.kedu.dto.MembersDTO;

@Controller
@RequestMapping("/members")
public class MembersController {
	
	@Autowired
	private MembersDAO dao;
	
	@RequestMapping("/register")
	public String register() {
		return "members/register";
	}
	
	@RequestMapping("/signup")
	public String signup(MembersDTO dto)  {
		String pw = EncryptionUtils.encryptSHA512(dto.getPw());
		dto.setPw(pw);
		dao.signup(dto);
		return "/";
	}
	
	@RequestMapping("/idCheck")
	public String idCheck(String id) {
		int idValue = dao.idCheck(id);
		return Integer.toString(idValue);
	}
	
	@RequestMapping("/login")
	public String login(MembersDTO dto, HttpSession session) {
		String pw = EncryptionUtils.encryptSHA512(dto.getPw());
		boolean result = dao.login(dto);
		if(result) {
			session.setAttribute("loginId", dto.getId());
		}
		return "/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/";
	}
	
	@RequestMapping("/myPage")
	public String Mypage(MembersDTO dto, Model model) {
		MembersDTO dto2 = dao.myPage(dto);
		model.addAttribute("list", dto2);
		return "members/mypage";
	}
	
	@RequestMapping("/deleteAccount")
	public String deleteAccount(HttpSession session) {
		String delId = (String)(session.getAttribute("loginId"));
		dao.deleteAccount(delId);
		return "/";
	}
	
	@RequestMapping("/updateMypage")
	public String updateMypage(MembersDTO dto) {
		dao.updateMypage(dto);
		
		return "redirect:/members/myPage";
	}
}
