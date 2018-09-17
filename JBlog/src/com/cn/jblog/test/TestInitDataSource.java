package com.cn.jblog.test;

import com.cn.jblog.model._MappingKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import config.DataSourcePlugin;

public class TestInitDataSource {

	public static void init() {
		DruidPlugin druidPlugin = DataSourcePlugin.createDruidPlugin();
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		_MappingKit.mapping(arp);
	    
	    // 与 jfinal web 环境唯一的不同是要手动调用一次相关插件的start()方法
		druidPlugin.start();
	    arp.start();
	}
}
