package br.com.semeru.security;

import br.com.semeru.model.entities.Pessoa;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("assembler")
public class Assembler {

    public Assembler() {
    }

    @Transactional(readOnly = true)
    User buildUserFromUserEntity(Pessoa pessoa) {

        String username = pessoa.getLogin();
        String password = pessoa.getSenha();
        boolean enabled = true; //userBean.isActive()
        boolean accountNonExpired = true;//userBean.isActive()
        boolean credentialsNonExpired = true; //userBean.isActive()
        boolean accountNonLocked = true; //userBean.isActive()

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new GrantedAuthorityImpl(pessoa.getPermissao()));      

        User user = new User(
                username,
                password,
                enabled,
                accountNonExpired,
                credentialsNonExpired,
                accountNonLocked,
                authorities);
        return user;
    }
}

/* http://www.techques.com/question/1-2683308/Spring-Security-3-database-authentication-with-Hibernate
 * 
 * import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;

@Service("assembler")
public class Assembler {

  @Transactional(readOnly = true)
  User buildUserFromUserEntity(UserEntity userEntity) {

    String username = userEntity.getName();
    String password = userEntity.getPassword();
    boolean enabled = userEntity.isActive();
    boolean accountNonExpired = userEntity.isActive();
    boolean credentialsNonExpired = userEntity.isActive();
    boolean accountNonLocked = userEntity.isActive();

    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    for (SecurityRoleEntity role : userEntity.getRoles()) {
      authorities.add(new GrantedAuthorityImpl(role.getRoleName()));
    }

    User user = new User(username, password, enabled,
      accountNonExpired, credentialsNonExpired, accountNonLocked, authorities, id);
    return user;
  }
}*/