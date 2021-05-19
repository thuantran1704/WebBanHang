/**
 * 
 */
package ptithcm.intercreptor;

/**
 * @author Thuan Tran
 *
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Intercrepter extends HandlerInterceptorAdapter {
	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse respone, Object Handler) throws Exception {
		HttpSession session = request.getSession();

		if (request.getServletPath().contains("/admin")) {
			if (session.getAttribute("admin") == null) {
				respone.sendRedirect(request.getContextPath() + "/user/login.htm");
				return false;
			}
		
		}
		return true;
	}
}
