var gcfutil = {
	/**
	 * 是否是IE浏览器并且版本小于等于IE8
	 */
	isLessEqualIE8 : function() {
		if (!domutils.isIE()) {
			return false;
		} else {
			// IE8: Trident/4.0
			// IE9: Trident/5.0
			// IE10: Trident/6.0
			// IE11: Trident/7.0
			//
			// IE6: MSIE 6.0
			// IE7: MSIE 7.0 (注：在IE11中“X-UA-Compatible，IE=6”时也有“MSIE 7.0”)
			var UA = /\bTrident\/([\w.]+)/.exec(navigator.userAgent);
			if (UA && parseFloat(UA[1]) > 6) { // IE11除外
				return false;
			} else {
				return true;
			}
		}
	},

	/**
	 * 是否已安装Chrome插件
	 */
	isGcfAvailable : function() {
		if ('undefined' == typeof CFInstall) {
			var className = 'thirdparty.CFInstall';
			if (jsloader.resolve('freequery.common.util').encode) {
				className += '_min';
			}
			jsloader.resolve(className, true);
		}
		return CFInstall.isAvailable();
	},

	/**
	 * 是否需要提示安装Chrome插件
	 */
	isNeedPromptSetupGCF : function() {
		if (!this.isLessEqualIE8()) {
			return false;
		} else {
			return !this.isGcfAvailable();
		}
	},

	/**
	 * 显示安装Chrome插件的提示
	 */
	showSetupGcfPrompt : function() {
		if (!this.isNeedPromptSetupGCF()) {
			return;
		}
		var id = 'gcfbar';
		var elem = document.getElementById(id);
		if (elem) {
			if (elem.style.display == 'none') {
				elem.style.display = '';
			}
			return;
		}
		elem = document.createElement('div');
		elem.id = id;
		var buf = [];
		buf.push('width:100%;padding:5px 0px;border-top:1px solid #666;position:absolute;');
		buf.push('left:0;top:0;text-align:center;z-index:10000;');
		buf.push('font-family:SimSun,Arial !important;font-size:12px;');
		buf.push('color:#ff0000 !important;background:#FFFFE1;cursor:default;');
		elem.style.cssText = buf.join('');
		//
		buf = [];
		buf.push('<img src="img/chromeframe/icon.png" style="float:left;" />');
		buf.push('${LowVersionIE11ErrorTip} 1 - ${LowVersionIE11ErrorTip2}${Period} 2 - ${LowVersionIE11ErrorTip3}${Period} 3 - ${LowVersionIE11ErrorTip4}');
		buf.push('<a href="ChromeFrame.zip">ChromeFrame</a>');
		buf.push('${LowVersionIE11ErrorTip5}${Period}');
		elem.innerHTML = buf.join('');
		document.body.appendChild(elem);
	}
};