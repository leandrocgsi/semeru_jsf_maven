package br.com.semeru.security;

import java.util.ArrayList;
import java.util.List;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        System.out.println("O Login do cara é: " + authentication.getName());
        List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        //Use assim se você usa o Spring Security 3.0.5.RELEASE
        auth.add(new GrantedAuthorityImpl("ROLE_USER"));
        //Já na versão 3.1.3.RELEASE essa classe foi depreciada e você deve usar como no trecho abaixo  
        //auth.add(new SimpleGrantedAuthority("ROLE_USER"));
        if (authentication.getName().equals(authentication.getCredentials())) {
            return new UsernamePasswordAuthenticationToken(authentication.getName(), authentication.getCredentials(), auth);
        } else {
            return null;
        }

    }

    @Override
    public boolean supports(Class<? extends Object> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}