package config;

import com.cn.jblog.model._MappingKit;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;

public class DevConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);

	}

	@Override
	public void configRoute(Routes me) {
		me.add(new DevRoute());

	}

	@Override
	public void configEngine(Engine me) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configPlugin(Plugins me) {
		DruidPlugin druidPlugin = DataSourcePlugin.createDruidPlugin();
		me.add(druidPlugin);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		me.add(arp);
		_MappingKit.mapping(arp);

	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub

	}

}
