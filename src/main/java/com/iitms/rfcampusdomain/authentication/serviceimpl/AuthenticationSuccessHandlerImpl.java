package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdata.authentication.entity.TestSession;

@Component("authenticationSuccessHandler")
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler, AuthenticationFailureHandler{

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);
	
	@Autowired
	private TestSession testSession;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		//request.getSession().setAttribute("roleId", 1);
		logger.info("Authentication Success");
		SessionUser sessionUser = (SessionUser) auth.getPrincipal();
		int roleId = sessionUser.getRoless().getId();
		testSession.setUsername(((SessionUser) auth.getPrincipal()).getUsername());
	   testSession.setRoleId(roleId);
		
		response.sendRedirect("./admin");
		//sessionUser.setUsername();
	}

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
        AuthenticationException exception) throws IOException, ServletException {
        logger.info("Error : auth fail");
        response.sendRedirect("./login");
        
    }

}
