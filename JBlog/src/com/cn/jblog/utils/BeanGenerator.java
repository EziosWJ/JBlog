package com.cn.jblog.utils;

import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.druid.DruidPlugin;

import config.DataSourcePlugin;
import config.DevConfig;

public class BeanGenerator {

	public static void main(String[] args) {
		// base model 所使用的包名
		String baseModelPackageName = "com.cn.jblog.model.base";
		// base model 文件保存路径
//		String baseModelOutputDir = PathKit.getWebRootPath() + "/../src/com/weixin/wj/model/base";
		String baseModelOutputDir = PathKit.getWebRootPath() + "/src/com/cn/jblog/model/base";
		
		// model 所使用的包名 (MappingKit 默认使用的包名)
		String modelPackageName = "com.cn.jblog.model";
		// model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
		String modelOutputDir = baseModelOutputDir + "/..";
//		String modelOutputDir = baseModelOutputDir ;
		
		DruidPlugin druidPlugin = DataSourcePlugin.createDruidPlugin();
		druidPlugin.start();
		// 创建生成器
		Generator generator = new Generator(druidPlugin.getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
		// 设置是否生成链式 setter 方法
		generator.setGenerateChainSetter(false);
		// 添加不需要生成的表名
		generator.addExcludedTable("book");
		// 设置是否在 Model 中生成 dao 对象
		generator.setGenerateDaoInModel(false);
		// 设置是否生成链式 setter 方法
		generator.setGenerateChainSetter(true);
		// 设置是否生成字典文件
		generator.setGenerateDataDictionary(false);
		// 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
		generator.setRemovedTableNamePrefixes("jblog_");
		// 生成
		generator.generate();
	}
}
