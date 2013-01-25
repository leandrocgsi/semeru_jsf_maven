package br.com.semeru.security;

import br.com.semeru.model.dao.HibernateDAO;
import br.com.semeru.model.dao.InterfaceDAO;
import br.com.semeru.model.entities.Pessoa;
import br.com.semeru.util.FacesContextUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("semeruUserService")
public class UserServiceImpl implements UserDetailsService, Serializable {

    private static final long serialVersionUID = 1L;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (username != null && username.isEmpty()) {
            throw new UsernameNotFoundException("Usuario nao encontrado!");
        } else {
            try {
                Pessoa usuario = findUser(username);

                String login = usuario.getLogin();
                String password = usuario.getSenha();
                boolean enabled = true; //userBean.isActive()
                boolean accountNonExpired = true;//userBean.isActive()
                boolean credentialsNonExpired = true; //userBean.isActive()
                boolean accountNonLocked = true; //userBean.isActive()

                Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
                //Use assim se você usa o Spring Security 3.0.5.RELEASE
                authorities.add(new GrantedAuthorityImpl(usuario.getPermissao()));
                //Já na versão 3.1.3.RELEASE essa classe foi depreciada e você deve usar como no trecho abaixo
                //authorities.add(new SimpleGrantedAuthority(usuario.getPermissao()));
                User user = new User(
                        login,
                        password,
                        enabled,
                        accountNonExpired,
                        credentialsNonExpired,
                        accountNonLocked,
                        authorities);
                return user;
            } catch (Exception e) {
                return null;
            }
        }

    }

    public Pessoa findUser(String login) {
        String stringQuery = "from Pessoa pessoa where pessoa.login = "+ login;
//        return pessoaDAO().getEntityByHQLQuery(stringQuery);
        Session session = FacesContextUtil.getRequestSession();
        Query query = session.createQuery(stringQuery);
        //query.setString(0, login);
        return (Pessoa) query.uniqueResult();
    }
    
    private InterfaceDAO<Pessoa> pessoaDAO() {
        InterfaceDAO<Pessoa> pessoaDAO = new HibernateDAO<Pessoa>(Pessoa.class, FacesContextUtil.getRequestSession());
        return pessoaDAO;
    }
}