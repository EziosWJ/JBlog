package config;

import com.cn.jblog.controller.ArticleController;
import com.cn.jblog.controller.EntranceController;
import com.cn.jblog.controller.UserController;
import com.jfinal.config.Routes;

public class DevRoute extends Routes {

	@Override
	public void config() {
		add("/", EntranceController.class);
		add("/user",UserController.class);
		add("/article",ArticleController.class);
	}

}