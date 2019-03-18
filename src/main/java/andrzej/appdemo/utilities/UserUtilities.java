package andrzej.appdemo.utilities;

import andrzej.appdemo.user.User;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.File;
import java.util.List;

public class UserUtilities {
	
	public static String getLoggedUser() {
		String username = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			username = auth.getName();
		}
		return username;
	}




}

