package config;

import com.jfinal.plugin.druid.DruidPlugin;

public class DataSourcePlugin {
	
	public static DruidPlugin createDruidPlugin(){
		DruidPlugin druidPlugin = new DruidPlugin("jdbc:mysql:///jblog", "root", "123456");
		return druidPlugin;
	}
}
