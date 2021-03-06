package com.cafe24.seoje1004;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subSell.service.SubSellService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	SubSellService subSellService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,@RequestParam(value="subCode",required=false)String subCode){
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//날짜에서 오늘날짜 일(day)만 구하기
		SimpleDateFormat days = new SimpleDateFormat("dd");
		System.out.println("days : "+days.format(date));		
		
		//메뉴차트+매출차트
		Map<String, Object> map = subSellService.menuChart(subCode);
		System.out.println(map);
		
		model.addAttribute("map", map);
		return "home";
	}

	
}
