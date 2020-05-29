package com.port.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.port.biz.contact.ContactService;
import com.port.biz.vo.ContactVO;
import com.port.biz.vo.MemberVO;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;

	@RequestMapping(value = "contact_list")
	public String contactForm(HttpSession session, Model model) {
		
		List<ContactVO> contactList = contactService.getContactList();
		model.addAttribute("contactList", contactList);
		return "contact/contactList";
	}

	@RequestMapping(value = "contact_write")
	public String contactWriteForm(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			model.addAttribute("user", user);
			return "contact/contactWrite";
		}
	}

	@RequestMapping(value = "send_contact")
	public String insertContact(HttpSession session, ContactVO contact) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			System.out.println(contact);
			contactService.insertContact(contact);
			return "redirect:index";
		}
	}
	
	@RequestMapping(value = "contact_detail")
	public String contactDetail(HttpSession session, Model model, @RequestParam(value="cseq") int cseq) {
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		if (user == null) {
			return "member/loginForm";
		} else {
			ContactVO contact = contactService.getContact(cseq);
			if(contact.getId().equals(user.getId())) {
				model.addAttribute("contact", contact);
				return "contact/contactDetail";
			} else {
				return "contact/contact_fail";
			}
		}
	}
	
}
