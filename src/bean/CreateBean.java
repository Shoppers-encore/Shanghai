package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import db.BasketDao;
import db.BoardDao;
import db.ChatDao;
import db.OrderDao;
import db.ProductDao;
import db.RecDao;
import db.TagDao;
import db.UserDao;

@Configuration
public class CreateBean {
	@Bean
	public BasketDao basketDao() {
		return new BasketDao();
	}
	@Bean
	public BoardDao boardDao() {
		return new BoardDao();
	}
	@Bean
	public ChatDao chatDao() {
		return new ChatDao();
	}
	@Bean
	public OrderDao orderDao() {
		return new OrderDao();
	}
	@Bean
	public ProductDao productDao() {
		return new ProductDao();
	}
	@Bean
	public TagDao tagDao() {
		return new TagDao();
	}
	@Bean
	public UserDao userDao() {
		return new UserDao();
	}
	
	@Bean
	public RecDao recDao() {
		return new RecDao();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}
