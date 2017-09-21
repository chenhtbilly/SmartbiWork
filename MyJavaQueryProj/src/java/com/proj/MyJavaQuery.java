package com.proj;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import smartbi.freequery.metadata.IJavaQueryData;
import smartbi.freequery.metadata.JavaQueryConfig;
import smartbi.freequery.metadata.JavaQueryOutputField;
import smartbi.freequery.metadata.JavaQueryParameter;
import smartbi.freequery.querydata.CellData;
import smartbi.freequery.querydata.GridData;
import smartbi.net.sf.json.JSONObject;
import smartbi.util.StringUtil;
import smartbi.util.ValueType;

public class MyJavaQuery implements IJavaQueryData.ISimpleData {

	private Map<String, JavaQueryConfig> configs = new LinkedHashMap<String, JavaQueryConfig>();
	private BufferedReader reader;
	private List<JavaQueryOutputField> outputFields;
	private int currentLine;

	public MyJavaQuery() {
		// 增加一个名称为FileName的配置项
		addConfig("FileName", "文件名", "给定一个文件名", "test.csv", true);
		addConfig("Encoding", "编码", "编码方式", "GBK", true);
	}

	/**
	 * 获取Java查询需要的配置信息
	 */
	public List<JavaQueryConfig> getConfigs() {
		return new ArrayList<JavaQueryConfig>(configs.values());
	}

	/**
	 * 添加一个配置项
	 * 
	 * @param name
	 *            名称
	 * @param alias
	 *            别名
	 * @param desc
	 *            描述
	 * @param defaultValue
	 *            默认值
	 * @param notNull
	 *            是否允许为空
	 */
	private void addConfig(String name, String alias, String desc,
			String defaultValue, boolean notNull) {
		JavaQueryConfig p = new JavaQueryConfig();
		p.setName(name);
		p.setAlias(alias);
		p.setDesc(desc);
		p.setValue(defaultValue);
		p.setNotNull(notNull);
		configs.put(name, p);
	}

	/**
	 * 从保存的字符串中恢复配置信息
	 * 
	 * @param configStr
	 *            配置字符串
	 */
	public void loadConfigs(String configStr) {
		if (StringUtil.isNullOrEmpty(configStr))
			return;
		JSONObject obj = JSONObject.fromString(configStr);
		configs.get("FileName").setValue(
				obj.has("FileName") ? obj.getString("FileName") : null);
		configs.get("Encoding").setValue(
				obj.has("Encoding") ? obj.getString("Encoding") : null);
	}

	/**
	 * 保存配置信息
	 * 
	 * @return 返回配置字符串
	 */
	public String saveConfigs() {
		JSONObject json = new JSONObject();
		for (JavaQueryConfig config : configs.values())
			json.put(config.getName(), config.getValue());
		return json.toString();
	}

	/**
	 * 设置配置信息
	 * 
	 * @param key
	 *            名称
	 * @param value
	 *            配置值
	 */
	public void setConfigValue(String key, String value) {
		configs.get(key).setValue(value);
	}

	/**
	 * 设置配置信息
	 */
	public void setConfigValues(Map<String, String> configValues) {
		for (Entry<String, String> config : configValues.entrySet())
			configs.get(config.getKey()).setValue(config.getValue());
	}

	/**
	 * 根据配置信息初始化Java查询对象
	 */
	public void init() {
		try {
			reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(configs.get("FileName").getValue()),
					configs.get("Encoding").getValue()));
			String titleLine = reader.readLine();
			String[] fields = titleLine.split(",");
			outputFields = new ArrayList<JavaQueryOutputField>();
			for (String str : fields) {
				JavaQueryOutputField f = new JavaQueryOutputField();
				f.setId(str);
				f.setName(str);
				f.setAlias(str);
				f.setDataType(ValueType.STRING);
				outputFields.add(f);
			}
			currentLine = 0;
		} catch (UnsupportedEncodingException e) {
			throw new IllegalArgumentException(e);
		} catch (FileNotFoundException e) {
			throw new IllegalArgumentException(e);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * 关闭Java查询对象，关闭必要的资源
	 */
	public void close() {
		try {
			if (reader != null) {
				reader.close();
				reader = null;
			}
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * 返回参数对象
	 */
	public List<JavaQueryParameter> getParameters() {
		return new ArrayList<JavaQueryParameter>();
	}

	/**
	 * 设置参数值
	 */
	public void setParameterValue(String id, String value, String displayValue) {
	}

	/**
	 * 返回Java查询的输出字段
	 */
	public List<JavaQueryOutputField> getOutputFields() {
		return outputFields;
	}

	/**
	 * 获取指定行的数据
	 */
	public GridData getGridData(int from, int count) {
		try {
			if (currentLine > from) {
				reader.close();
				reader = new BufferedReader(
						new InputStreamReader(new FileInputStream(configs.get(
								"FileName").getValue()), configs
								.get("Encoding").getValue()));
				reader.readLine();
				currentLine = 0;
			}
			while (currentLine < from) {
				reader.readLine();
				currentLine++;
			}
			List<List<CellData>> datas = new ArrayList<List<CellData>>();
			for (int i = 0; i < count; i++) {
				String line = reader.readLine();
				if (line == null)
					break;
				currentLine++;
				String[] fs = line.split(",");
				List<CellData> row = new ArrayList<CellData>();
				for (int j = 0; j < fs.length; j++) {
					CellData c = new CellData();
					c.setStringValue(fs[j]);
					row.add(c);
				}
				datas.add(row);
			}
			GridData d = new GridData();
			List<String> headers = new ArrayList<String>();
			for (JavaQueryOutputField f : outputFields)
				headers.add(f.getName());
			d.setStringHeaders(null);
			d.setData(datas);
			return d;
		} catch (UnsupportedEncodingException e) {
			throw new IllegalArgumentException(e);
		} catch (FileNotFoundException e) {
			throw new IllegalArgumentException(e);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * 返回总行数，返回Integer.MAX_VALUE表示未知总行数
	 */
	public int getRowCount() {
		return Integer.MAX_VALUE;
	}
}
