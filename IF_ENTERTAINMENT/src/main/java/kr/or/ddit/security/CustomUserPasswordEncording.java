package kr.or.ddit.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class CustomUserPasswordEncording implements PasswordEncoder {


	@Override
	public String encode(CharSequence rawPassword) {
		log.info("before encode : " + rawPassword);
		return rawPassword.toString();
		
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.info("matches : " + rawPassword + " : " + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}

}
