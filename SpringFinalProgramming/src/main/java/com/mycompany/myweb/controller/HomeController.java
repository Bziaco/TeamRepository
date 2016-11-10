package com.mycompany.myweb.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  //패키지 상관없이 컨트롤러를 만들어라 내가 다 찾아줄께. 대신 base 패키지 위로 만드는 것은 못찾음
public class HomeController {
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   @RequestMapping("/")
   public String index() {
      logger.info("index() 실행");
      return "index";
   }
   
   @RequestMapping("/home")
   public String home() {
      logger.info("home() 실행");
      return "home";
   }
}
