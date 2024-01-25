package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cafe.dao.UserRepository;
import cafe.dto.PersistentLogin;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 아이디 저장 쿠키 가져오기
		System.out.println("자동로그인 필터 테스트");
		Cookie[] cookies = request.getCookies();
		HttpSession session = request.getSession();
		String token = "";
		String rememberMe = "";
		String id = "";
		PersistentLogin persistentLogin = null;
		UserRepository userDAO = new UserRepository();
		
		if(cookies != null) {
			for(int i = 0 ; i < cookies.length ; i++) {
				
				if( cookies[i].getName().equals("token") ) {
					token = cookies[i].getValue(); 
				}
				if( cookies[i].getName().equals("rememberMe") ) {
					rememberMe = cookies[i].getValue(); 
				}
			}
			if(token != null && !token.equals("")) {
				persistentLogin = userDAO.selectTokenByToken(token);
				if(persistentLogin != null) {					
					id = persistentLogin.getUserId();
					System.out.println("자동로그인 세션에 아이디 등록완료");
				}
			}			
		}
			
		
		System.out.println(persistentLogin);
		System.out.println(rememberMe);
		if(persistentLogin != null && rememberMe.equals("on")) {
			
			session.setAttribute("loginId", id);	
			
		}
				
		// 다음 필터로 요청/응답 전달
		chain.doFilter(request, response);		
				
				
				
				
				
	}


	
	
	
}
  