//package fr.esimed.projet.configuration.security;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//import javax.inject.Inject;
//import javax.sql.DataSource;
//
///**
// * Created by maximedesogus on 25/11/2016.
// */
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
//
//    @Inject
//    private DataSource dataSource;
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests()
//                .antMatchers("/admin/**").access("hasRole('ADMIN')")
//                .antMatchers("/").access("hasRole('USER') OR hasRole('ADMIN')")
//                .anyRequest().authenticated()
//                .and().formLogin()
//                .loginPage("/login")
//                .failureUrl("/login?error=1")
//                .defaultSuccessUrl("/projets/", true)
//                .permitAll()
//                .and().logout()
//                .permitAll();
//    }
//
//    @Override
//     public void configure(WebSecurity webSecurity) throws Exception{
//        webSecurity.ignoring().antMatchers("/assets/**");
//    }
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        /*auth.jdbcAuthentication()
//                .dataSource(dataSource)
//                .usersByUsernameQuery("select username,password,enabled from users where username=?")
//                .authoritiesByUsernameQuery("select username,role from user_roles where username=?");*/
//        auth.inMemoryAuthentication()
//                .withUser("jean").password("azerty").roles("USER");
//        auth.inMemoryAuthentication()
//                .withUser("admin").password("admin").roles("ADMIN");
//    }
//
//}
//
