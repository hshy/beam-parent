/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.hsshy.beam.common.utils;

import com.hsshy.beam.common.enumeration.RetEnum;

import java.util.HashMap;

/**
 * @description: 封装返回结果类
 * @author: hs
 * @create: 2018-09-21 22:42:04
 **/
public class R<T> extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;

	public R(int code, String msg) {
		put("code", code);
		put("msg", msg);
		put("data", null);
		put("error",false);
	}
	public R(int code, String msg, boolean error) {
		put("code", code);
		put("msg", msg);
		put("data", null);
		put("error",error);
	}
	public R(int code, String msg, boolean error, T data) {
		put("code", code);
		put("msg", msg);
		put("data", data);
		put("error",error);
	}
	public static R fail() {
		return new R(RetEnum.ERROR.getRet(), RetEnum.ERROR.getMsg(),true);
	}
	public static R fail(String msg) {
		return fail(RetEnum.ERROR.getRet(), msg);
	}
	
	public static R fail(int code, String msg) {
		return new R(code,msg,true);
	}
	public static <T> R<T> fail(T data) {
		return new R(RetEnum.ERROR.getRet(), RetEnum.ERROR.getMsg(),true,data);
	}
	public static <T> R<T> fail(int code, String msg, T data) {
		return new R(code,msg,true,data);
	}
	public static R ok() {
		return new R(RetEnum.SUCCESS.getRet(), RetEnum.SUCCESS.getMsg());
	}
	public static R ok(String msg) {
		String data = msg;
		return new R(RetEnum.SUCCESS.getRet(),msg,false,data);
	}

	public static R ok(int code, String msg) {
		return new R(code,msg,false,null);
	}
	public static <T> R<T> ok(T data) {
		return new R(RetEnum.SUCCESS.getRet(), RetEnum.SUCCESS.getMsg(),false,data);
	}
	public static <T> R<T> ok(int code, String msg, T data) {
		return new R(code,msg,false,data);
	}
	@Override
	public R put(String key, Object value) {
		super.put(key, value);
		return this;
	}


}
