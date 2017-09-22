package com.proj;

import java.io.BufferedReader;
import java.io.File;
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
		// ����һ������ΪFileName��������
		addConfig("FileName", "�ļ���", "����һ���ļ���", "test.csv", true);
		addConfig("Encoding", "����", "���뷽ʽ", "GBK", true);
	}

	/**
	 * ��ȡJava��ѯ��Ҫ��������Ϣ
	 */
	public List<JavaQueryConfig> getConfigs() {
		return new ArrayList<JavaQueryConfig>(configs.values());
	}

	/**
	 * ���һ��������
	 * 
	 * @param name
	 *            ����
	 * @param alias
	 *            ����
	 * @param desc
	 *            ����
	 * @param defaultValue
	 *            Ĭ��ֵ
	 * @param notNull
	 *            �Ƿ�����Ϊ��
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
	 * �ӱ�����ַ����лָ�������Ϣ
	 * 
	 * @param configStr
	 *            �����ַ���
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
	 * ����������Ϣ
	 * 
	 * @return ���������ַ���
	 */
	public String saveConfigs() {
		JSONObject json = new JSONObject();
		for (JavaQueryConfig config : configs.values())
			json.put(config.getName(), config.getValue());
		return json.toString();
	}

	/**
	 * ����������Ϣ
	 * 
	 * @param key
	 *            ����
	 * @param value
	 *            ����ֵ
	 */
	public void setConfigValue(String key, String value) {
		configs.get(key).setValue(value);
	}

	/**
	 * ����������Ϣ
	 */
	public void setConfigValues(Map<String, String> configValues) {
		for (Entry<String, String> config : configValues.entrySet())
			configs.get(config.getKey()).setValue(config.getValue());
	}

	/**
	 * ����������Ϣ��ʼ��Java��ѯ����
	 */
	public void init() {
		try {
			outputFields = new ArrayList<JavaQueryOutputField>();
			File file = new File(configs.get("FileName").getValue());
			if (file.exists()) {
				FileInputStream fis = new FileInputStream(file);
				if (configs.get("Encoding").getValue().toLowerCase().equals("utf-8")) {
					byte[] headData = new byte[3];
					fis.read(headData, 0, 3);
					if (headData[0] != (byte) 0xef || headData[1] != (byte) 0xbb || headData[2] != (byte) 0xbf) {
						fis.close();
						fis = new FileInputStream(file);
					}
				}
				reader = new BufferedReader(new InputStreamReader(fis, configs.get("Encoding").getValue()));
				String titleLine = reader.readLine();
				String[] fields = titleLine == null ? "".split(",") : titleLine.split(",");
				for (String str : fields) {
					JavaQueryOutputField f = new JavaQueryOutputField();
					f.setId(str);
					f.setName(str);
					f.setAlias(str);
					if (str.equals(StringUtil.getLanguageValue("Value1"))) {
						f.setDataType(ValueType.DOUBLE);
					} else {
						f.setDataType(ValueType.STRING);
					}
					outputFields.add(f);
				}
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
	 * �ر�Java��ѯ���󣬹رձ�Ҫ����Դ
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
	 * ���ز�������
	 */
	public List<JavaQueryParameter> getParameters() {
		return new ArrayList<JavaQueryParameter>();
	}

	/**
	 * ���ò���ֵ
	 */
	public void setParameterValue(String id, String value, String displayValue) {
	}

	/**
	 * ����Java��ѯ������ֶ�
	 */
	public List<JavaQueryOutputField> getOutputFields() {
		return outputFields;
	}

	/**
	 * ��ȡָ���е�����
	 */
	public GridData getGridData(int from, int count) {
		try {
			if (currentLine > from) {
				if (reader != null) {
					reader.close();
					FileInputStream fis = new FileInputStream(configs.get("FileName").getValue());
					if (configs.get("Encoding").getValue().toLowerCase().equals("utf-8")) {
						byte[] headData = new byte[3];
						fis.read(headData, 0, 3);
						if (headData[0] != (byte) 0xef || headData[1] != (byte) 0xbb || headData[2] != (byte) 0xbf) {
							fis.close();
							fis = new FileInputStream(configs.get("FileName").getValue());
						}
					}
					reader = new BufferedReader(new InputStreamReader(fis, configs.get("Encoding").getValue()));
					reader.readLine();
				}
				currentLine = 0;
			}
			if (reader != null) {
				while (currentLine < from) {
					reader.readLine();
					currentLine++;
				}
			}
			List<List<CellData>> datas = new ArrayList<List<CellData>>();
			for (int i = 0; i < count; i++) {
				String line = reader == null ? null : reader.readLine();
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
			d.setStringHeaders(headers);
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
	 * ����������������Integer.MAX_VALUE��ʾδ֪������
	 */
	public int getRowCount() {
		return Integer.MAX_VALUE;
	}
}
